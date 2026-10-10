// Host-side tests use GNU inline semantics to match SDCC's screen helpers.
// From the project directory:
// gcc -std=c99 -fgnu89-inline -Wall -Wextra -Werror -I tests\support -idirafter ..\MSXgl\engine\src tests\editor_test.c -o editor_test.exe
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include "../document.c"
#include "../editor.c"

static u8 banks[2][8][16384];
static DOS_VarTable mappers[] = { {3, 8, 5, 0, 0, {0}}, {1, 8, 3, 0, 0, {0}}, {0} };
static u8 page = 7, slot = 3;
static u8 allocated[2];
static u32 written;
static u32 blinkCells;
static int failAfter = -1;
static bool failFree;

bool Document_MemorySafe() { return TRUE; }
void Document_SelectSlot(u8 value) { slot = value; }
u8* Document_Page() { return banks[slot == 3 ? 0 : 1][page]; }
const DOS_VarTable* DOSMapper_GetVarTable() { return mappers; }
u8 DOSMapper_GetPage2() { return page; }
void DOSMapper_SetPage2(u8 value) { page = value; }
u8 Sys_GetPageSlot(u8 value) { assert(value == 2); return slot; }
bool DOSMapper_Alloc(u8 type, u8 value, DOS_Segment* seg)
{
	assert(type == DOS_ALLOC_USER);
	if (failAfter == 0)
		return FALSE;
	if (failAfter > 0)
		--failAfter;
	u8 index = value == 3 ? 0 : 1;
	assert(mappers[index].FreeSeg);
	--mappers[index].FreeSeg;
	seg->Number = ++allocated[index];
	seg->Slot = value;
	return TRUE;
}
bool DOSMapper_FreeStruct(DOS_Segment* seg)
{
	u8 index = seg->Slot == 3 ? 0 : 1;
	++mappers[index].FreeSeg;
	--allocated[index];
	return !failFree;
}

static u8 screen[SCR_WIDTH * SCR_HEIGHT];
static bool attributes[SCR_WIDTH * SCR_HEIGHT];
static u16 address;

void Scr_Locate(u8 x, u8 y)
{
	assert(x < SCR_WIDTH && y < SCR_HEIGHT);
	address = (u16)y * SCR_WIDTH + x;
}

void Scr_PutChar(c8 chr)
{
	assert(address < sizeof(screen));
	screen[address++] = chr;
	++written;
}

void Scr_Puts(const c8* str)
{
	while (*str) Scr_PutChar(*str++);
}

void Scr_Write(const void* src, u16 len)
{
	const c8* bytes = src;
	while (len--) Scr_PutChar(*bytes++);
}

void Scr_Fill(u8 chr, u16 len)
{
	while (len--) Scr_PutChar(chr);
}

void Scr_SetBlink(u8 x, u8 y, u16 len, bool on)
{
	u16 pos = (u16)y * SCR_WIDTH + x;
	assert(x < SCR_WIDTH && pos + len <= sizeof(screen));
	blinkCells += len;
	while (len--) attributes[pos++] = on;
}

static void Type(const c8* text)
{
	while (*text)
	{
		u8 key = *text++;
		assert(Editor_Input(key == '\n' ? ASCII_RET : key));
	}
}

static void ExpectText(const c8* text)
{
	assert(s_Length == strlen(text));
	Document_Begin();
	for (u32 i = 0; i < s_Length; ++i)
		assert(Document_Get(i) == (u8)text[i]);
	Document_End();
}

static void TestCursor(u32 pos)
{
	Document_Begin();
	SetCursor(pos);
	Document_End();
}

static void ExpectStatus(u8 x, const c8* text)
{
	assert(memcmp(&screen[(SCR_HEIGHT - 1) * SCR_WIDTH + x], text, strlen(text)) == 0);
}

int main(void)
{
	assert(Document_Init());
	assert(g_DocumentCapacity == 131072UL);
	Editor_Init();
	Editor_Draw();
	assert(!g_EditorModified && g_EditorInsert && !g_EditorWrap);
	assert(screen[23 * 80] == ASCII_LEFT && screen[24 * 80 - 1] == ASCII_RIGHT);
	ExpectStatus(2, "  Line=0001   Col=0001");
	ExpectStatus(36, "untitled");
	ExpectStatus(65, "Insert WW=Off");
	assert(attributes[80]);
	written = blinkCells = 0;
	Editor_Draw();
	assert(written == 0 && blinkCells == 0);
	Type("a");
	Editor_Draw();
	assert(written <= 24 && blinkCells == 2);
	written = blinkCells = 0;
	Type("b");
	Editor_Draw();
	assert(written <= 2 && blinkCells == 2);
	written = blinkCells = 0;
	Editor_Input(ASCII_LEFT);
	Editor_Draw();
	assert(written <= 1 && blinkCells == 2);
	Editor_Init();
	assert(Editor_Input(ASCII_BS) && Editor_Input(127));
	assert(!g_EditorModified);
	Editor_ToggleWrap();
	assert(!g_EditorModified && g_EditorWrap);
	Editor_ToggleWrap();
	assert(!g_EditorModified && !g_EditorWrap);
	assert(Editor_Input(EDITOR_TEXT_START) && s_Cursor == 0);
	assert(Editor_Input(EDITOR_TEXT_END) && s_Cursor == 0);

	Type("one,  two_three\rfinal");
	g_EditorModified = FALSE;
	TestCursor(0);
	assert(Editor_Input(EDITOR_WORD_LEFT) && s_Cursor == 0);
	assert(Editor_Input(EDITOR_WORD_RIGHT) && s_Cursor == 6);
	assert(Editor_Input(EDITOR_WORD_RIGHT) && s_Cursor == 16);
	assert(Editor_Input(EDITOR_WORD_RIGHT) && s_Cursor == s_Length);
	assert(Editor_Input(EDITOR_WORD_RIGHT) && s_Cursor == s_Length);
	assert(Editor_Input(EDITOR_WORD_LEFT) && s_Cursor == 16);
	assert(Editor_Input(EDITOR_WORD_LEFT) && s_Cursor == 6);
	assert(Editor_Input(EDITOR_WORD_LEFT) && s_Cursor == 0);
	TestCursor(8);
	assert(Editor_Input(EDITOR_WORD_LEFT) && s_Cursor == 6);
	assert(Editor_Input(ASCII_CLS) && s_Cursor == 15);
	assert(Editor_Input(ASCII_HOME) && s_Cursor == 0);
	Editor_ToggleWrap();
	assert(Editor_Input(EDITOR_WORD_RIGHT) && s_Cursor == 6);
	assert(!g_EditorModified);
	ExpectText("one,  two_three\nfinal");
	assert(Editor_Input(EDITOR_TEXT_END) && s_Cursor == s_Length);
	assert(Editor_Input(EDITOR_TEXT_START) && s_Cursor == 0);
	assert(!g_EditorModified);
	Editor_Init();

	Type("abc");
	Editor_Input(ASCII_LEFT);
	Type("X");
	ExpectText("abXc");
	Editor_Input(127);
	ExpectText("abX");
	Editor_Input(ASCII_BS);
	ExpectText("ab");
	Editor_Input(ASCII_HOME);
	Editor_Input(ASCII_INSERT);
	Type("Z");
	ExpectText("Zb");
	Editor_Draw();
	ExpectStatus(2, "*");
	ExpectStatus(20, "0002");
	ExpectStatus(65, "Over   WW=Off");
	Type("b");
	Editor_Input(ASCII_RET);
	Type("cd");
	ExpectText("Zb\ncd");
	Editor_Input(ASCII_HOME);
	Editor_Input(ASCII_BS);
	ExpectText("Zbcd");
	assert(s_Cursor == 2);
	Editor_Input(ASCII_RET);
	Editor_Input(ASCII_LEFT);
	Editor_Input(127);
	ExpectText("Zbcd");
	Editor_Input(ASCII_HOME);
	Editor_Input(ASCII_TAB);
	assert(s_Cursor == 8);

	Editor_Init();
	Type("abcdef\nx\nabcdef");
	TestCursor(5);
	Editor_Input(ASCII_DOWN);
	assert(s_Cursor == 8);
	Editor_Input(ASCII_DOWN);
	assert(s_Cursor == 14);
	Editor_Input(ASCII_UP);
	assert(s_Cursor == 8);
	Editor_Input(ASCII_UP);
	assert(s_Cursor == 5);
	Editor_ToggleWrap();
	assert(!s_VerticalMove && g_EditorWrap);
	Editor_ToggleWrap();
	assert(!g_EditorWrap && g_EditorModified);

	Editor_Init();
	for (u16 i = 0; i < 100; ++i) Type("a");
	Editor_Draw();
	assert(s_LeftCol == 21 && attributes[80 + 79]);
	Editor_ToggleWrap();
	Editor_Draw();
	assert(s_LeftCol == 0 && attributes[160 + 20]);
	TestCursor(80);
	Editor_Draw();
	assert(attributes[160]);
	Editor_Input(ASCII_RET);
	Editor_Draw();
	assert(attributes[240]);
	Editor_Input(ASCII_UP);
	Editor_Draw();
	assert(attributes[160]);
	Editor_ToggleWrap();
	Editor_Draw();
	assert(s_LeftCol == 1 && attributes[80 + 79]);

	Editor_Init();
	Type("one two ");
	for (u16 i = 0; i < 75; ++i) Type("x");
	Editor_ToggleWrap();
	Document_Begin();
	assert(RowEnd(0) == 8);
	Document_End();
	Editor_Draw();
	assert(attributes[160 + 75]);
	assert(!memcmp(&screen[160], "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 75));

	Editor_Init();
	for (u16 i = 0; i < 30; ++i) assert(Editor_Input(ASCII_RET));
	Editor_Draw();
	assert(s_TopRow == 9);
	ExpectStatus(9, "0031");
	Editor_Input(EDITOR_TEXT_START);
	Editor_Draw();
	assert(s_TopRow == 0 && s_Cursor == 0);
	Editor_Input(EDITOR_TEXT_END);
	Editor_Draw();
	assert(s_TopRow == 9 && s_Cursor == s_Length);
	for (u16 i = 0; i < 30; ++i) Editor_Input(ASCII_UP);
	Editor_Draw();
	assert(s_TopRow == 0 && s_Cursor == 0);

	Editor_Init();
	for (u32 i = 0; i < g_DocumentCapacity; ++i) Type("a");
	assert(!Editor_Input('b'));
	assert(!Editor_Input(ASCII_RET));
	assert(!Editor_Input(ASCII_TAB));
	assert(s_Length == g_DocumentCapacity && s_Cursor == g_DocumentCapacity);
	Editor_Draw();
	ExpectStatus(20, "####");
	Editor_Input(ASCII_HOME);
	Editor_Input(ASCII_INSERT);
	assert(Editor_Input('b') && s_Length == g_DocumentCapacity);
	Editor_Input(127);
	assert(s_Length == g_DocumentCapacity - 1);
	Editor_Input(ASCII_INSERT);
	assert(Editor_Input('c') && s_Length == g_DocumentCapacity);
	Editor_Draw();
	Editor_Init();
	Type("first\nsecond\nthird");
	Editor_Draw();
	TestCursor(7);
	Type("XYZ");
	Editor_Draw();
	assert(!memcmp(&screen[160], "sXYZecond", 9));
	assert(!memcmp(&screen[240], "third", 5));
	Editor_Input(ASCII_HOME);
	Editor_Input(ASCII_BS);
	Editor_Draw();
	assert(!memcmp(&screen[80], "firstsXYZecond", 13));
	assert(!memcmp(&screen[160], "third", 5));
	assert(screen[240] == ' ');
	Editor_Init();
	Type("first line\rsecond line with words\rthird");
	u32 random = 91;
	const u16 keys[] = { 'x', ' ', ASCII_RET, ASCII_BS, 127, ASCII_LEFT,
		ASCII_RIGHT, ASCII_UP, ASCII_DOWN, ASCII_HOME, ASCII_CLS,
		EDITOR_WORD_LEFT, EDITOR_WORD_RIGHT, EDITOR_TEXT_START, EDITOR_TEXT_END };
	for (u16 step = 0; step < 500; ++step)
	{
		random = random * 1664525UL + 1013904223UL;
		if (step % 37 == 0)
			Editor_ToggleWrap();
		assert(Editor_Input(keys[random % (sizeof(keys) / sizeof(keys[0]))]));
		Editor_Draw();
		u8 savedScreen[sizeof(screen)];
		bool savedAttributes[sizeof(attributes) / sizeof(attributes[0])];
		memcpy(savedScreen, screen, sizeof(screen));
		memcpy(savedAttributes, attributes, sizeof(attributes));
		for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
			s_EndValid[i] = FALSE;
		Editor_Invalidate();
		Editor_Draw();
		if (memcmp(savedScreen, screen, sizeof(screen)))
		{
			fprintf(stderr, "Incremental redraw mismatch: step=%u key=%u wrap=%u cursor=%lu dirtyLine=%lu top=%lu\n",
				step, keys[random % (sizeof(keys) / sizeof(keys[0]))], g_EditorWrap,
				(unsigned long)s_Cursor, (unsigned long)s_DirtyLine, (unsigned long)s_TopRow);
			for (u16 cell = 0; cell < sizeof(screen); ++cell)
				if (savedScreen[cell] != screen[cell])
					fprintf(stderr, "cell=%u incremental=%u full=%u\n", cell, savedScreen[cell], screen[cell]);
		}
		assert(!memcmp(savedScreen, screen, sizeof(screen)));
		assert(!memcmp(savedAttributes, attributes, sizeof(attributes)));
		Document_Begin();
		u32 line = 1;
		for (u32 pos = 0; pos < s_Cursor; ++pos)
			if (Document_Get(pos) == '\n')
				++line;
		assert(line == s_LineNumber && s_LineStart == LineStart(s_Cursor));
		Document_End();
	}
	Document_Begin();
	static c8 oracle[131072];
	u32 length = 73727;
	memset(oracle, 'a', 65535);
	memset(oracle + 65535, 'b', length - 65535);
	Document_Reset();
	assert(Document_Insert(0, 'a', 65535));
	assert(Document_Insert(65535, 'b', 8192));
	u32 seed = 17;
	for (u16 edit = 0; edit < 200; ++edit)
	{
		seed = seed * 1664525UL + 1013904223UL;
		u32 pos = seed % length;
		if (edit & 1)
		{
			Document_Delete(pos);
			memmove(oracle + pos, oracle + pos + 1, length - pos - 1);
			--length;
		}
		else
		{
			u8 chr = edit % 26 + 'A';
			assert(Document_Insert(pos, chr, 3));
			memmove(oracle + pos + 3, oracle + pos, length - pos);
			memset(oracle + pos, chr, 3);
			length += 3;
		}
	}
	c8 block[128];
	for (u32 pos = 0; pos < length; )
	{
		u16 count = length - pos > sizeof(block) ? sizeof(block) : (u16)(length - pos);
		Document_Read(pos, block, count);
		assert(!memcmp(block, oracle + pos, count));
		pos += count;
	}
	Document_End();
	assert(page == 7 && slot == 3);
	assert(Document_Close());
	assert(mappers[0].FreeSeg == 5 && mappers[1].FreeSeg == 3);
	failAfter = 3;
	assert(!Document_Init());
	assert(Document_Close());
	assert(mappers[0].FreeSeg == 5 && mappers[1].FreeSeg == 3);
	failAfter = -1;
	assert(Document_Init());
	failFree = TRUE;
	assert(!Document_Close());
	failFree = FALSE;
	puts("All editor, differential redraw and 128 KB multi-mapper tests passed.");
	return 0;
}
