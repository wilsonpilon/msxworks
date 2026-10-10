// Mapper-backed editor with a gap buffer and differential VRAM updates.
#include "editor.h"
#include "document.h"
#include "screen.h"
#include "ascii.h"

#define EDITOR_ROWS (SCR_HEIGHT - 2)
#define LINE_CACHE_SIZE (EDITOR_ROWS + 2)
#define s_Length g_DocumentLength

static u32 s_Cursor;
static u32 s_LineStart;
static u32 s_LineNumber;
static u32 s_TopRow;
static u32 s_ViewStart;
static u32 s_LeftCol;
static u32 s_GoalCol;
static bool s_VerticalMove;
static c8 s_Screen[SCR_WIDTH * (SCR_HEIGHT - 1)];
static c8 s_Row[SCR_WIDTH];
static bool s_ScreenValid;
static bool s_TextDirty;
static bool s_DirtyFollowing;
static u32 s_DirtyStart;
static u32 s_DirtyLine;
static u8 s_PaintedRows;
static u32 s_PaintedView;
static u32 s_PaintedLeft;
static u32 s_EndStart[LINE_CACHE_SIZE];
static u32 s_EndPos[LINE_CACHE_SIZE];
static bool s_EndValid[LINE_CACHE_SIZE];
static u8 s_LastEnd;
static u8 s_NextEnd;
static c8 s_Scan[128];
static u8 s_CursorX;
static u8 s_CursorY;
bool g_EditorModified;
bool g_EditorInsert;
bool g_EditorWrap;

static u32 LineStart(u32 pos)
{
	while (pos)
	{
		u16 size = pos > sizeof(s_Scan) ? sizeof(s_Scan) : (u16)pos;
		Document_Read(pos - size, s_Scan, size);
		for (u16 i = size; i; --i)
			if (s_Scan[i - 1] == '\n')
				return pos - size + i;
		pos -= size;
	}
	return pos;
}

static u32 LineEnd(u32 pos)
{
	if (s_EndValid[s_LastEnd] && (pos >= s_EndStart[s_LastEnd]) && (pos <= s_EndPos[s_LastEnd]))
		return s_EndPos[s_LastEnd];
	for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
		if (s_EndValid[i] && (pos >= s_EndStart[i]) && (pos <= s_EndPos[i]))
		{
			s_LastEnd = i;
			return s_EndPos[i];
		}
	u32 start = pos;
	bool found = FALSE;
	while ((pos < s_Length) && !found)
	{
		u32 remaining = s_Length - pos;
		u16 size = remaining > sizeof(s_Scan) ? sizeof(s_Scan) : (u16)remaining;
		Document_Read(pos, s_Scan, size);
		u16 i = 0;
		while ((i < size) && (s_Scan[i] != '\n'))
			++i;
		pos += i;
		found = i < size;
	}
	s_LastEnd = s_NextEnd;
	s_NextEnd = (s_NextEnd + 1) % LINE_CACHE_SIZE;
	s_EndValid[s_LastEnd] = TRUE;
	s_EndStart[s_LastEnd] = start;
	s_EndPos[s_LastEnd] = pos;
	return pos;
}

static void UpdateLineCache(u32 pos, u16 count, bool insert, bool newline)
{
	for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
	{
		if (newline)
			s_EndValid[i] = FALSE;
		else if (s_EndValid[i])
		{
			if (s_EndStart[i] > pos)
				s_EndStart[i] = insert ? s_EndStart[i] + count : s_EndStart[i] - count;
			if (s_EndPos[i] >= pos)
				s_EndPos[i] = insert ? s_EndPos[i] + count : s_EndPos[i] - count;
		}
	}
}

static void SetCursor(u32 pos)
{
	bool crossed = FALSE;
	u32 from = s_Cursor < pos ? s_Cursor : pos;
	u32 end = s_Cursor < pos ? pos : s_Cursor;
	bool forward = s_Cursor < pos;
	while (from < end)
	{
		u32 remaining = end - from;
		u16 size = remaining > sizeof(s_Scan) ? sizeof(s_Scan) : (u16)remaining;
		Document_Read(from, s_Scan, size);
		for (u16 i = 0; i < size; ++i)
		{
			if (s_Scan[i] == '\n')
			{
				if (forward)
				{
					++s_LineNumber;
					s_LineStart = from + i + 1;
				}
				else
				{
					--s_LineNumber;
					crossed = TRUE;
				}
			}
		}
		from += size;
	}
	s_Cursor = pos;
	if (crossed)
		s_LineStart = LineStart(s_Cursor);
}

static u32 RowEnd(u32 start)
{
	if (!g_EditorWrap)
		return LineEnd(start);
	u32 remaining = s_Length - start;
	u8 size = remaining > SCR_WIDTH ? SCR_WIDTH : (u8)remaining;
	Document_Read(start, s_Scan, size);
	for (u8 i = 0; i < size; ++i)
		if (s_Scan[i] == '\n')
			return start + i;
	if (size < SCR_WIDTH)
		return start + size;
	for (u8 i = size; i; --i)
		if (s_Scan[i - 1] == ' ')
			return start + i;
	return start + size;
}

static bool NextRow(u32 start, u32* next)
{
	u32 end = RowEnd(start);
	if (g_EditorWrap && (end - start == SCR_WIDTH
		|| (end < s_Length && Document_Get(end) != '\n')))
	{
		*next = end;
		return TRUE;
	}
	if ((end < s_Length) && (Document_Get(end) == '\n'))
	{
		*next = end + 1;
		return TRUE;
	}
	return FALSE;
}

static u32 PreviousRow(u32 start)
{
	if (!start)
		return 0;
	u32 pos = LineStart(start - 1);
	u32 next;
	while (NextRow(pos, &next) && (next < start))
		pos = next;
	return pos;
}

// Use the viewport as the row index anchor, not the beginning of the document.
static void CursorRow(u32* row, u32* start)
{
	if (!g_EditorWrap)
	{
		*row = s_LineNumber - 1;
		*start = s_LineStart;
		if (*row < s_TopRow)
		{
			s_ViewStart = *start;
			s_TopRow = *row;
		}
		else if (*row >= s_TopRow + EDITOR_ROWS)
		{
			s_ViewStart = *start;
			s_TopRow = *row;
			for (u8 i = 1; i < EDITOR_ROWS; ++i)
			{
				s_ViewStart = LineStart(s_ViewStart - 1);
				--s_TopRow;
			}
		}
		return;
	}
	while (s_Cursor < s_ViewStart)
	{
		s_ViewStart = PreviousRow(s_ViewStart);
		--s_TopRow;
	}
	*row = s_TopRow;
	*start = s_ViewStart;
	u32 next;
	while (NextRow(*start, &next) && (next <= s_Cursor))
	{
		*start = next;
		++*row;
	}
}

static void PrepareEdit()
{
	while (s_Cursor < s_ViewStart)
	{
		s_ViewStart = PreviousRow(s_ViewStart);
		--s_TopRow;
	}
	// Word wrapping may change earlier rows of the same logical line.
	while (g_EditorWrap && s_ViewStart && (Document_Get(s_ViewStart - 1) != '\n'))
	{
		s_ViewStart = PreviousRow(s_ViewStart);
		--s_TopRow;
	}
}

void Editor_Invalidate()
{
	s_ScreenValid = FALSE;
}

// Upload one contiguous changed span per row; never erase before writing.
static void UploadRow(u8 y)
{
	c8* old = &s_Screen[(u16)(y - 1) * SCR_WIDTH];
	u8 first = 0;
	u8 last = SCR_WIDTH;
	if (s_ScreenValid)
	{
		const c8* before = old;
		const c8* after = s_Row;
		while ((first < last) && (*before == *after))
		{
			++first;
			++before;
			++after;
		}
		before = old + last;
		after = s_Row + last;
		while ((last > first) && (before[-1] == after[-1]))
		{
			--last;
			--before;
			--after;
		}
	}
	if (first != last)
	{
		Scr_Locate(first, y);
		Scr_Write(&s_Row[first], last - first);
		c8* dest = old + first;
		const c8* src = s_Row + first;
		for (u8 i = first; i < last; ++i)
			*dest++ = *src++;
	}
}

static void PutStatus(u8 x, const c8* text)
{
	while (*text)
		s_Row[x++] = *text++;
}

static void PutNumber(u8 x, u32 value)
{
	// Keep the requested four-column field; indicate overflow rather than wrap.
	if (value > 9999)
	{
		PutStatus(x, "####");
		return;
	}
	static const u16 places[] = { 1000, 100, 10, 1 };
	u16 remaining = (u16)value;
	for (u8 i = 0; i < 4; ++i)
	{
		c8 digit = '0';
		while (remaining >= places[i])
		{
			remaining -= places[i];
			++digit;
		}
		s_Row[x++] = digit;
	}
}

static void ClearRow()
{
	c8* dest = s_Row;
	for (u8 i = 0; i < SCR_WIDTH; ++i)
		*dest++ = ' ';
}

static void DrawTextRow(u8 y, u32 pos, bool hasRow)
{
	ClearRow();
	if (hasRow)
	{
		u32 end = RowEnd(pos);
		if (end - pos > s_LeftCol)
		{
			u32 size = end - pos - s_LeftCol;
			if (size > SCR_WIDTH)
				size = SCR_WIDTH;
			Document_Read(pos + s_LeftCol, s_Row, (u16)size);
		}
	}
	UploadRow(y);
}

void Editor_Init()
{
	Document_Reset();
	s_Cursor = s_LineStart = s_ViewStart = s_TopRow = s_LeftCol = s_GoalCol = 0;
	s_LineNumber = 1;
	s_VerticalMove = FALSE;
	g_EditorModified = FALSE;
	g_EditorInsert = TRUE;
	g_EditorWrap = FALSE;
	s_TextDirty = s_DirtyFollowing = FALSE;
	s_LastEnd = s_NextEnd = 0;
	for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
		s_EndValid[i] = FALSE;
	Editor_Invalidate();
}

void Editor_ToggleWrap()
{
	g_EditorWrap = !g_EditorWrap;
	s_ViewStart = s_TopRow = 0;
	s_VerticalMove = FALSE;
	Editor_Invalidate();
}

void Editor_DrawStatus()
{
	ClearRow();
	s_Row[0] = ASCII_LEFT;
	s_Row[2] = g_EditorModified ? '*' : ' ';
	PutStatus(4, "Line=");
	PutNumber(9, s_LineNumber);
	PutStatus(16, "Col=");
	PutNumber(20, s_Cursor - s_LineStart + 1);
	PutStatus((SCR_WIDTH - 8) / 2, "untitled");
	PutStatus(65, g_EditorInsert ? "Insert" : "Over");
	PutStatus(72, g_EditorWrap ? "WW=On" : "WW=Off");
	s_Row[SCR_WIDTH - 1] = ASCII_RIGHT;
	UploadRow(SCR_HEIGHT - 1);
	if (!s_ScreenValid)
		Scr_SetBlink(0, SCR_HEIGHT - 1, SCR_WIDTH, TRUE);
}

void Editor_Draw()
{
	Document_Begin();
	u32 row, start, next;
	CursorRow(&row, &start);
	u32 col = s_Cursor - start;
	while (row >= s_TopRow + EDITOR_ROWS)
	{
		NextRow(s_ViewStart, &next);
		s_ViewStart = next;
		++s_TopRow;
	}
	if (g_EditorWrap)
		s_LeftCol = 0;
	else if (col < s_LeftCol)
		s_LeftCol = col;
	else if (col >= s_LeftCol + SCR_WIDTH)
		s_LeftCol = col - SCR_WIDTH + 1;

	bool all = !s_ScreenValid || (s_PaintedView != s_ViewStart) || (s_PaintedLeft != s_LeftCol);
	if (!all && s_TextDirty && !s_DirtyFollowing)
	{
		// A plain edit changes only its logical line, regardless of screen size.
		u32 dirtyRow = s_DirtyLine - 1 - s_TopRow;
		if (dirtyRow < EDITOR_ROWS)
			DrawTextRow((u8)dirtyRow + 1, s_DirtyStart, TRUE);
	}
	else if (all || s_TextDirty)
	{
		u32 pos = s_ViewStart;
		bool hasRow = TRUE;
		u8 paintedRows = 0;
		for (u8 y = 1; y <= EDITOR_ROWS; ++y)
		{
			if (hasRow)
				paintedRows = y;
			else if (s_ScreenValid && (y > s_PaintedRows))
				break;
			bool draw = all || s_DirtyFollowing || (pos == s_DirtyStart);
			if (draw)
				DrawTextRow(y, pos, hasRow);
			if (hasRow)
			{
				hasRow = NextRow(pos, &next);
				if (hasRow)
					pos = next;
			}
		}
		s_PaintedRows = paintedRows;
	}
	u8 x = col - s_LeftCol;
	u8 y = row - s_TopRow + 1;
	if (!s_ScreenValid)
		Scr_SetBlink(0, 1, SCR_WIDTH * EDITOR_ROWS, FALSE);
	else if ((x != s_CursorX) || (y != s_CursorY))
		Scr_SetBlink(s_CursorX, s_CursorY, 1, FALSE);
	if (!s_ScreenValid || (x != s_CursorX) || (y != s_CursorY))
		Scr_SetBlink(x, y, 1, TRUE);
	s_CursorX = x;
	s_CursorY = y;
	Editor_DrawStatus();
	s_ScreenValid = TRUE;
	s_PaintedView = s_ViewStart;
	s_PaintedLeft = s_LeftCol;
	s_TextDirty = s_DirtyFollowing = FALSE;
	Document_End();
}

static void MarkChanged(bool newline)
{
	if (s_TextDirty && (s_LineStart != s_DirtyStart))
		s_DirtyFollowing = TRUE;
	if (!s_TextDirty || (s_LineStart < s_DirtyStart))
	{
		s_DirtyStart = s_LineStart;
		s_DirtyLine = s_LineNumber;
	}
	s_TextDirty = TRUE;
	s_DirtyFollowing |= newline || g_EditorWrap;
}

static bool Insert(u8 chr, u16 count)
{
	if (count > g_DocumentCapacity - s_Length)
		return FALSE;
	PrepareEdit();
	if (!Document_Insert(s_Cursor, chr, count))
		return FALSE;
	UpdateLineCache(s_Cursor, count, TRUE, chr == '\n');
	MarkChanged(chr == '\n');
	s_Cursor += count;
	if (chr == '\n')
	{
		s_LineNumber += count;
		s_LineStart = s_Cursor;
	}
	g_EditorModified = TRUE;
	return TRUE;
}

static void Delete()
{
	if (s_Cursor == s_Length)
		return;
	PrepareEdit();
	bool newline = Document_Get(s_Cursor) == '\n';
	MarkChanged(newline);
	UpdateLineCache(s_Cursor, 1, FALSE, newline);
	Document_Delete(s_Cursor);
	g_EditorModified = TRUE;
}

static void MoveVertical(bool down)
{
	u32 row, start, next;
	CursorRow(&row, &start);
	if (!s_VerticalMove)
		s_GoalCol = s_Cursor - start;
	s_VerticalMove = TRUE;
	if (down)
	{
		if (!NextRow(start, &next))
			return;
		start = next;
	}
	else
	{
		if (!row)
			return;
		start = PreviousRow(start);
	}
	u32 end = RowEnd(start);
	if (g_EditorWrap && NextRow(start, &next) && (next == end))
		--end;
	u32 pos = start + s_GoalCol;
	SetCursor(pos > end ? end : pos);
}

static bool IsWordChar(u8 chr)
{
	return ((chr >= 'a') && (chr <= 'z'))
		|| ((chr >= 'A') && (chr <= 'Z'))
		|| ((chr >= '0') && (chr <= '9'))
		|| (chr == '_') || (chr >= 128);
}

static bool Input(u16 key)
{
	if ((key == ASCII_UP) || (key == ASCII_DOWN))
	{
		MoveVertical(key == ASCII_DOWN);
		return TRUE;
	}
	s_VerticalMove = FALSE;
	u32 pos = s_Cursor;
	switch (key)
	{
	case EDITOR_TEXT_START:
		SetCursor(0);
		break;
	case EDITOR_TEXT_END:
		SetCursor(s_Length);
		break;
	case EDITOR_WORD_LEFT:
		while (pos && !IsWordChar(Document_Get(pos - 1))) --pos;
		while (pos && IsWordChar(Document_Get(pos - 1))) --pos;
		SetCursor(pos);
		break;
	case EDITOR_WORD_RIGHT:
		while ((pos < s_Length) && IsWordChar(Document_Get(pos))) ++pos;
		while ((pos < s_Length) && !IsWordChar(Document_Get(pos))) ++pos;
		SetCursor(pos);
		break;
	case ASCII_LEFT:
		if (s_Cursor) SetCursor(s_Cursor - 1);
		break;
	case ASCII_RIGHT:
		if (s_Cursor < s_Length) SetCursor(s_Cursor + 1);
		break;
	case ASCII_HOME:
		SetCursor(s_LineStart);
		break;
	case ASCII_CLS:
		SetCursor(LineEnd(s_Cursor));
		break;
	case ASCII_INSERT:
		g_EditorInsert = !g_EditorInsert;
		break;
	case ASCII_BS:
		if (s_Cursor) { SetCursor(s_Cursor - 1); Delete(); }
		break;
	case 127:
		Delete();
		break;
	case ASCII_RET:
		return Insert('\n', 1);
	case ASCII_TAB:
		return Insert(' ', 8 - (s_Cursor - s_LineStart) % 8);
	default:
		if ((key >= ASCII_SPACE) && (key <= 255) && (key != 127))
		{
			if (!g_EditorInsert && (s_Cursor < s_Length) && (Document_Get(s_Cursor) != '\n'))
			{
				if (Document_Get(s_Cursor) != key)
					g_EditorModified = TRUE;
				PrepareEdit();
				MarkChanged(FALSE);
				Document_Put(s_Cursor, key);
				++s_Cursor;
			}
			else
				return Insert(key, 1);
		}
		break;
	}
	return TRUE;
}

bool Editor_Input(u16 key)
{
	Document_Begin();
	bool ok = Input(key);
	Document_End();
	return ok;
}
