//─────────────────────────────────────────────────────────────────────────────
// MSX-Works - basic text editor and application menus
//
// Checks the minimum environment (MSX2+, MSX-DOS 2, >= 256 KB of mapped RAM).
// - Failure: prints the report on the MSX-DOS console and exits.
// - Success: switches to SCREEN 0 WIDTH 80, shows the title bar with the
//   blink (alternate) colors and the report, then opens an untitled text editor.
// - Menus: SELECT opens/closes, arrows navigate, Enter activates, ESC closes.
// - Editor: typing, Enter, Tab, Backspace, Delete, arrows, Home and Insert.
//   Ctrl+Left/Right moves by words; Ctrl+W/A deletes words; Ctrl+O/K scrolls
//   one row; STOP moves to the logical line's end.
//   Ctrl+Home/STOP moves to the beginning/end of the whole document.
//   Text-layout toggles visual word wrap; View lists future application modes.
//   Text uses the free DOS2 mapper segments; disk I/O is not yet added.
//─────────────────────────────────────────────────────────────────────────────

#include "msxgl.h"
#include "dos.h"
#include "dos_mapper.h"
#include "keyboard.h"
#include "ascii.h"
#include "screen.h"
#include "editor.h"
#include "document.h"

//=============================================================================
// DEFINES
//=============================================================================

#define APP_NAME			"MSX-Works"
#define APP_VERSION			"0.0.1 (stub)"

#define SEGMENT_KB			16
#define MIN_RAM_KB			256
#define MIN_SEGMENTS		(MIN_RAM_KB / SEGMENT_KB)

// Result of _DOSVER calls (field order is used by GetOSInfo)
typedef struct OSInfo
{
	u8 Error;					// A: non-zero if not MSX-DOS
	u8 KernelMajor;				// B
	u8 KernelMinor;				// C (BCD)
	u8 SystemMajor;				// D (BCD)
	u8 SystemMinor;				// E (BCD)
	u8 NextorID;				// IXh: 1 if Nextor
	u8 NextorMajor;				// IXl
	u8 NextorSecondary;			// IYh
	u8 NextorRevision;			// IYl
} OSInfo;

//=============================================================================
// MEMORY DATA
//=============================================================================

OSInfo g_OS;

//=============================================================================
// FUNCTIONS
//=============================================================================

//-----------------------------------------------------------------------------
// Detect MSX-DOS version and Nextor (see Nextor 2.1 Programmers Reference, _DOSVER)
void GetOSInfo(OSInfo* info) __NAKED
{
	info; // HL

__asm
	push	ix
	push	iy
	push	hl

	// Standard _DOSVER call (MSX-DOS 1 returns B < 2)
	ld		b, #0
	ld		c, #DOS_FUNC_DOSVER
	call	BDOS
	pop		hl
	ld		(hl), a					// Error
	inc		hl
	ld		(hl), b					// KernelMajor
	or		a
	jr		nz, getosinfo_end
	ld		a, b
	cp		#2
	jr		c, getosinfo_end

	// MSX-DOS 2: call again with Nextor magic numbers
	push	hl
	ld		ix, #0
	ld		b, #0x5A
	ld		hl, #0x1234
	ld		de, #0xABCD
	ld		c, #DOS_FUNC_DOSVER
	call	BDOS
	pop		hl
	ld		(hl), b					// KernelMajor
	inc		hl
	ld		(hl), c					// KernelMinor
	inc		hl
	ld		(hl), d					// SystemMajor
	inc		hl
	ld		(hl), e					// SystemMinor
	inc		hl
	push	ix
	pop		de
	ld		(hl), d					// NextorID
	inc		hl
	ld		(hl), e					// NextorMajor
	inc		hl
	push	iy
	pop		de
	ld		(hl), d					// NextorSecondary
	inc		hl
	ld		(hl), e					// NextorRevision

getosinfo_end:
	pop		iy
	pop		ix
	ret
__endasm;
}

//=============================================================================
// OUTPUT (MSX-DOS console or direct VRAM)
//=============================================================================

// Report window (screen mode)
#define WIN_WIDTH			48
#define WIN_X				((SCR_WIDTH - WIN_WIDTH) / 2)
#define WIN_TEXT_X			(WIN_X + 3)
#define WIN_MAX_MAPPERS		8

// TRUE when output goes to the VRAM through the screen module
bool g_ScrMode = FALSE;

// Current report line in screen mode
u8 g_Line;

//-----------------------------------------------------------------------------
// Print one character
void PrintChar(c8 chr)
{
	if (g_ScrMode)
		Scr_PutChar(chr);
	else
		DOS_CharOutput(chr);
}

//-----------------------------------------------------------------------------
// Print a zero-terminated string
void Print(const c8* str)
{
	if (g_ScrMode)
		Scr_Puts(str);
	else
		while (*str)
			DOS_CharOutput(*str++);
}

//-----------------------------------------------------------------------------
// Print a string and go to next line
void PrintLn(const c8* str)
{
	Print(str);
	if (g_ScrMode)
		Scr_Locate(WIN_TEXT_X, ++g_Line);
	else
		Print("\r\n");
}

//-----------------------------------------------------------------------------
// Print a separator line (window separator in screen mode)
void PrintSeparator()
{
	if (g_ScrMode)
	{
		Scr_DrawSeparator(WIN_X, g_Line, WIN_WIDTH);
		Scr_Locate(WIN_TEXT_X, ++g_Line);
	}
	else
		PrintLn("-----------------------------------");
}

//-----------------------------------------------------------------------------
// Print an unsigned decimal value
void PrintU16(u16 val)
{
	c8 buf[6];
	u8 i = 5;
	buf[5] = 0;
	do
	{
		buf[--i] = '0' + (val % 10);
		val /= 10;
	} while (val);
	Print(&buf[i]);
}

//-----------------------------------------------------------------------------
// Print a BCD byte as two digits
void PrintBCD(u8 val)
{
	PrintChar('0' + (val >> 4));
	PrintChar('0' + (val & 0x0F));
}

//-----------------------------------------------------------------------------
// Print a slot ID (FxxxSSPP format)
void PrintSlot(u8 slot)
{
	PrintChar('0' + (slot & 0x03));
	if (slot & 0x80)
	{
		PrintChar('-');
		PrintChar('0' + ((slot >> 2) & 0x03));
	}
}

//-----------------------------------------------------------------------------
// Print a segment count and its size in KB
void PrintSegments(const c8* label, u16 seg)
{
	Print(label);
	PrintU16(seg);
	Print(" segments (");
	PrintU16(seg * SEGMENT_KB);
	PrintLn(" KB)");
}

//-----------------------------------------------------------------------------
// Print check result
void PrintCheck(bool ok)
{
	PrintLn(ok ? " [OK]" : " [FAIL]");
}

//=============================================================================
// ENVIRONMENT
//=============================================================================

bool g_DOS2;
u8   g_MSXVer;
u8   g_VDPVer;
bool g_MapperOK;
u16  g_TotalSeg;
u16  g_FreeSeg;
u8   g_NumMappers;

//-----------------------------------------------------------------------------
// Gather environment information. Returns TRUE if MSX-Works can run.
bool CheckEnvironment()
{
	GetOSInfo(&g_OS);
	g_DOS2 = (g_OS.Error == 0) && (g_OS.KernelMajor >= 2);

	g_MSXVer = Sys_GetMSXVersion();
	g_VDPVer = VDP_GetVersion();

	g_TotalSeg = 0;
	g_FreeSeg = 0;
	g_NumMappers = 0;
	g_MapperOK = g_DOS2 && DOSMapper_Init();
	if (g_MapperOK)
	{
		const DOS_VarTable* tab = DOSMapper_GetVarTable();
		while (tab->Slot != 0)
		{
			g_TotalSeg += tab->NumSeg;
			g_FreeSeg += tab->FreeSeg;
			g_NumMappers++;
			tab++;
		}
	}

	return g_DOS2 && (g_MSXVer >= MSXVER_2P) && (g_TotalSeg >= MIN_SEGMENTS);
}

//-----------------------------------------------------------------------------
// Print the environment report
void PrintReport(bool envOK)
{
	if (!g_ScrMode)
	{
		PrintLn("Environment check");
		PrintSeparator();
	}

	// MSX-DOS
	Print("MSX-DOS : ");
	if (!g_DOS2)
	{
		Print("1.x or unknown");
	}
	else if (g_OS.NextorID == 1)
	{
		Print("Nextor ");
		PrintU16(g_OS.NextorMajor);
		PrintChar('.');
		PrintU16(g_OS.NextorSecondary);
		PrintChar('.');
		PrintU16(g_OS.NextorRevision);
	}
	else
	{
		Print("MSX-DOS ");
		PrintU16(g_OS.KernelMajor);
		PrintChar('.');
		PrintBCD(g_OS.KernelMinor);
		Print(" (SYS ");
		PrintU16(g_OS.SystemMajor);
		PrintChar('.');
		PrintBCD(g_OS.SystemMinor);
		PrintChar(')');
	}
	PrintCheck(g_DOS2);

	// MSX generation (MSXVER byte of the Main-ROM)
	Print("MSX     : ");
	switch (g_MSXVer)
	{
	case MSXVER_1:  Print("MSX1"); break;
	case MSXVER_2:  Print("MSX2"); break;
	case MSXVER_2P: Print("MSX2+"); break;
	case MSXVER_TR: Print("MSX turbo R"); break;
	default:        Print("Unknown ("); PrintU16(g_MSXVer); PrintChar(')'); break;
	}
	PrintCheck(g_MSXVer >= MSXVER_2P);

	// Video processor (informative)
	Print("VDP     : ");
	switch (g_VDPVer)
	{
	case VDP_VERSION_TMS9918A: PrintLn("TMS9918A"); break;
	case VDP_VERSION_V9938:    PrintLn("V9938"); break;
	case VDP_VERSION_V9958:    PrintLn("V9958"); break;
	default:                   PrintLn("Unknown"); break;
	}

	// Memory mappers (MSX-DOS 2 extended BIOS)
	if (g_MapperOK)
	{
		const DOS_VarTable* tab = DOSMapper_GetVarTable();
		u8 idx = 0;
		while ((tab->Slot != 0) && (idx < WIN_MAX_MAPPERS))
		{
			Print("Mapper ");
			PrintU16(idx);
			Print(" (slot ");
			PrintSlot(tab->Slot);
			Print("): ");
			PrintU16(tab->NumSeg);
			Print(" seg, ");
			PrintU16(tab->FreeSeg);
			PrintLn(" free");
			tab++;
			idx++;
		}
		PrintSegments("RAM total: ", g_TotalSeg);
		PrintSegments("RAM free : ", g_FreeSeg);
	}
	else
	{
		PrintLn("RAM     : mapper info not available");
	}
	Print("RAM >= ");
	PrintU16(MIN_RAM_KB);
	Print(" KB");
	PrintCheck(g_TotalSeg >= MIN_SEGMENTS);

	PrintSeparator();
	if (envOK)
		PrintLn("Environment OK. MSX-Works can run.");
	else
		PrintLn("Unsupported environment. Requires MSX2+, MSX-DOS 2 and 256 KB RAM.");
}

//-----------------------------------------------------------------------------
// Wait for a key without showing the BIOS cursor: polls MSX-DOS _DIRIO
// (E=FFh: returns A=0 if no key; no echo, no Ctrl-C/Ctrl-STOP check).
// Returns the key code.
u8 WaitKey() __NAKED
{
__asm
	push	ix
waitkey_loop:
	ld		e, #0xFF
	ld		c, #DOS_FUNC_DIRIO
	call	BDOS
	or		a
	jr		z, waitkey_loop
	pop		ix
	ret
__endasm;
}

//=============================================================================
// MAIN
//=============================================================================

#define CHR_ENTER			13
#define CHR_ESC				27

//-----------------------------------------------------------------------------
// Draw a full-width bar with the alternate colors
void DrawBar(u8 y, const c8* left, const c8* right)
{
	Scr_FillAt(0, y, ' ', SCR_WIDTH);
	Scr_PrintAt(1, y, left);
	if (right)
	{
		u8 len = 0;
		while (right[len])
			len++;
		Scr_PrintAt(SCR_WIDTH - 1 - len, y, right);
	}
	Scr_SetBlink(0, y, SCR_WIDTH, TRUE);
}

//-----------------------------------------------------------------------------
// Show the environment report in a centered window with an [OK] button.
// Returns when the user presses Enter (OK) or ESC.
void ShowReportWindow()
{
	u8 mappers = (g_NumMappers < WIN_MAX_MAPPERS) ? g_NumMappers : WIN_MAX_MAPPERS;
	// Borders(2) + blank(1) + DOS/MSX/VDP(3) + mappers + RAM total/free/check(3)
	// + separator(1) + verdict(1) + blank(1) + button(1)
	u8 h = mappers + 13;
	u8 y = 1 + (SCR_HEIGHT - 2 - h) / 2;

	Scr_DrawWindow(WIN_X, y, WIN_WIDTH, h, "Environment check");

	g_Line = y + 2;
	Scr_Locate(WIN_TEXT_X, g_Line);
	PrintReport(TRUE);

	// Focused button: normal colors (white on blue) inside the gray window
	#define BTN_TEXT		"[  OK  ]"
	#define BTN_LEN			(sizeof(BTN_TEXT) - 1)
	u8 btnX = WIN_X + (WIN_WIDTH - BTN_LEN) / 2;
	u8 btnY = y + h - 2;
	Scr_PrintAt(btnX, btnY, BTN_TEXT);
	Scr_SetBlink(btnX, btnY, BTN_LEN, FALSE);

	for (;;)
	{
		u8 key = WaitKey();
		if ((key == CHR_ENTER) || (key == CHR_ESC))
			break;
	}
}

//=============================================================================
// MENUS
//=============================================================================

enum MenuAction
{
	MENU_EXIT,
	MENU_ABOUT,
	MENU_KEYS,
	MENU_UNAVAILABLE,
	MENU_WRAP,
	MENU_INSERT,
	MENU_EDITOR,
};

typedef struct MenuItem
{
	const c8* Label;
	u8 Action;
} MenuItem;

typedef struct Menu
{
	const c8* Label;
	u8 X;
	u8 Width;
	const MenuItem* Items;
	u8 Count;
} Menu;

const MenuItem g_FileItems[] = { { "Exit", MENU_EXIT } };
const MenuItem g_PendingItems[] = { { "(Not implemented)", MENU_UNAVAILABLE } };
const MenuItem g_LayoutItems[] = { { "Word Wrap", MENU_WRAP } };
const MenuItem g_ViewItems[] =
{
	{ "Text editor", MENU_EDITOR },
	{ "Word processor", MENU_UNAVAILABLE },
	{ "Spreadsheet", MENU_UNAVAILABLE },
	{ "Database", MENU_UNAVAILABLE },
};
const MenuItem g_OptionItems[] = { { "Insert / Over", MENU_INSERT } };
const MenuItem g_HelpItems[] =
{
	{ "About", MENU_ABOUT },
	{ "Keys", MENU_KEYS },
};
const Menu g_Menus[] =
{
	{ "File", 1, 12, g_FileItems, sizeof(g_FileItems) / sizeof(MenuItem) },
	{ "Block", 7, 21, g_PendingItems, 1 },
	{ "Text-layout", 14, 18, g_LayoutItems, 1 },
	{ "Search", 27, 21, g_PendingItems, 1 },
	{ "Print", 35, 21, g_PendingItems, 1 },
	{ "View", 42, 20, g_ViewItems, sizeof(g_ViewItems) / sizeof(MenuItem) },
	{ "Options", 48, 19, g_OptionItems, 1 },
	{ "HELP", SCR_WIDTH - 5, 12, g_HelpItems, sizeof(g_HelpItems) / sizeof(MenuItem) },
};

#define MENU_COUNT			(sizeof(g_Menus) / sizeof(Menu))
#define UI_SELECT			(0x100 | KEY_SELECT)

u8 g_KeyRow7;
u8 g_KeyRow8;
u8 g_KeyRow4;
u8 g_KeyRow2;
u8 g_KeyRow5;

//-----------------------------------------------------------------------------
// The BIOS interrupt also selects keyboard rows through the PPI.
u8 ReadMenuRow(u8 row)
{
	DisableInterrupt();
	u8 value = Keyboard_Read(row);
	EnableInterrupt();
	return value;
}

//-----------------------------------------------------------------------------
// Read BIOS type-ahead without DOS's global Ctrl-STOP abort check.
u8 PollKey()
{
	u8 chr = 0;
	DisableInterrupt();
	if (g_GETPNT != g_PUTPNT)
	{
		chr = *g_GETPNT++;
		if (g_GETPNT == (const c8*)(M_KEYBUF + sizeof(g_KEYBUF)))
			g_GETPNT = (const c8*)M_KEYBUF;
	}
	EnableInterrupt();
	return chr;
}

void ClearKeyBuffer()
{
	DisableInterrupt();
	g_GETPNT = g_PUTPNT;
	EnableInterrupt();
}

// The BIOS can enqueue the confirming key after the physical menu edge.
// Wait for release before returning text input to the editor.
void ReleaseMenuKeys()
{
	do
	{
		g_KeyRow2 = ReadMenuRow(2);
		g_KeyRow5 = ReadMenuRow(5);
		g_KeyRow4 = ReadMenuRow(4);
		g_KeyRow7 = ReadMenuRow(7);
		g_KeyRow8 = ReadMenuRow(8);
		PollKey();
	} while (IS_KEY_PRESSED(g_KeyRow7, KEY_ENTER)
		|| IS_KEY_PRESSED(g_KeyRow7, KEY_ESC)
		|| IS_KEY_PRESSED(g_KeyRow7, KEY_SELECT)
		|| ((g_KeyRow8 & 0xF0) != 0xF0));
	ClearKeyBuffer();
}

// BIOS translates printable keys and repeats. Menu keys use physical edges;
// the high byte distinguishes them from text characters with the same value.
u16 WaitInput(bool menu)
{
	for (;;)
	{
		u8 row7 = ReadMenuRow(7);
		u8 row8 = ReadMenuRow(8);
		u8 row4 = ReadMenuRow(4);
		u8 row2 = ReadMenuRow(2);
		u8 row5 = ReadMenuRow(5);
		u8 pushed7 = g_KeyRow7 & ~row7;
		u8 pushed8 = g_KeyRow8 & ~row8;
		u8 pushed4 = g_KeyRow4 & ~row4;
		u8 pushed2 = g_KeyRow2 & ~row2;
		u8 pushed5 = g_KeyRow5 & ~row5;
		g_KeyRow7 = row7;
		g_KeyRow8 = row8;
		g_KeyRow4 = row4;
		g_KeyRow2 = row2;
		g_KeyRow5 = row5;
		u8 chr = PollKey();

		if (pushed7 & KEY_FLAG(KEY_SELECT)) return UI_SELECT;
		if (menu)
		{
			if (pushed7 & KEY_FLAG(KEY_ESC)) return 0x100 | KEY_ESC;
			if (pushed7 & KEY_FLAG(KEY_ENTER)) return 0x100 | KEY_ENTER;
			if (pushed8 & KEY_FLAG(KEY_LEFT)) return 0x100 | KEY_LEFT;
			if (pushed8 & KEY_FLAG(KEY_RIGHT)) return 0x100 | KEY_RIGHT;
			if (pushed8 & KEY_FLAG(KEY_UP)) return 0x100 | KEY_UP;
			if (pushed8 & KEY_FLAG(KEY_DOWN)) return 0x100 | KEY_DOWN;
		}
		else
		{
			bool ctrl = IS_KEY_PRESSED(ReadMenuRow(KEY_ROW(KEY_CTRL)), KEY_CTRL);
			if (ctrl && ((pushed2 & KEY_FLAG(KEY_A)) || (pushed5 & KEY_FLAG(KEY_W))))
			{
				ClearKeyBuffer();
				return (pushed2 & KEY_FLAG(KEY_A))
					? EDITOR_DELETE_WORD_RIGHT : EDITOR_DELETE_WORD_LEFT;
			}
			if (ctrl && (pushed4 & (KEY_FLAG(KEY_O) | KEY_FLAG(KEY_K))))
			{
				ClearKeyBuffer();
				return (pushed4 & KEY_FLAG(KEY_O)) ? EDITOR_SCROLL_UP : EDITOR_SCROLL_DOWN;
			}
			if (pushed7 & KEY_FLAG(KEY_STOP))
			{
				ClearKeyBuffer();
				return ctrl ? EDITOR_TEXT_END : ASCII_CLS;
			}
			if (ctrl && (pushed8 & KEY_FLAG(KEY_HOME)))
			{
				ClearKeyBuffer();
				return EDITOR_TEXT_START;
			}
			if (ctrl && (pushed8 & (KEY_FLAG(KEY_LEFT) | KEY_FLAG(KEY_RIGHT))))
			{
				ClearKeyBuffer();
				return (pushed8 & KEY_FLAG(KEY_LEFT)) ? EDITOR_WORD_LEFT : EDITOR_WORD_RIGHT;
			}
			if (chr && (chr != ASCII_SELECT) && !IS_KEY_PRESSED(row7, KEY_STOP)
				&& !(ctrl && (IS_KEY_PRESSED(row8, KEY_LEFT) || IS_KEY_PRESSED(row8, KEY_RIGHT)
					|| IS_KEY_PRESSED(row8, KEY_HOME))))
				return chr;
		}
	}
}

//-----------------------------------------------------------------------------
void DrawDesktop()
{
	DrawBar(0, "", NULL);
	for (u8 i = 0; i < MENU_COUNT; ++i)
		Scr_PrintAt(g_Menus[i].X, 0, g_Menus[i].Label);
	Editor_Draw();
}

//-----------------------------------------------------------------------------
void DrawMenu(u8 menuIndex, u8 itemIndex)
{
	const Menu* menu = &g_Menus[menuIndex];
	u8 labelLen = 0;
	while (menu->Label[labelLen])
		labelLen++;
	u8 x = menu->X;
	if (x + menu->Width > SCR_WIDTH)
		x = SCR_WIDTH - menu->Width;

	Scr_SetBlink(menu->X, 0, labelLen, FALSE);
	Scr_DrawWindow(x, 1, menu->Width, menu->Count + 2, NULL);
	for (u8 i = 0; i < menu->Count; ++i)
		Scr_PrintAt(x + 2, i + 2, menu->Items[i].Label);
	Scr_SetBlink(x + 1, itemIndex + 2, menu->Width - 2, FALSE);
	Editor_Invalidate();
}

//-----------------------------------------------------------------------------
void ShowMessage(const c8* title, const c8* message, const c8* detail)
{
	Editor_Invalidate();
	#define ABOUT_WIDTH		40
	#define ABOUT_HEIGHT	9
	u8 x = (SCR_WIDTH - ABOUT_WIDTH) / 2;
	u8 y = (SCR_HEIGHT - ABOUT_HEIGHT) / 2;
	Scr_DrawWindow(x, y, ABOUT_WIDTH, ABOUT_HEIGHT, title);
	Scr_PrintAt(x + 3, y + 2, message);
	if (detail)
		Scr_PrintAt(x + 3, y + 3, detail);
	Scr_PrintAt(x + (ABOUT_WIDTH - 8) / 2, y + 7, "[  OK  ]");
	Scr_SetBlink(x + (ABOUT_WIDTH - 8) / 2, y + 7, 8, FALSE);

	for (;;)
	{
		u8 key = WaitInput(TRUE);
		if ((key == KEY_ENTER) || (key == KEY_ESC))
			break;
	}
	ReleaseMenuKeys();
}

//-----------------------------------------------------------------------------
void ShowKeys()
{
	#define KEYS_X		5
	#define KEYS_Y		1
	#define KEYS_WIDTH	70
	#define KEYS_HEIGHT	22
	static const c8* page1[] =
	{
		"Left / Right        Move one character",
		"Up / Down           Move one visual line",
		"Ctrl+Left / Right   Move to previous / next word",
		"Ctrl+O / Ctrl+K     Scroll up / down one line",
		"Ctrl+W              Delete word to the left",
		"Ctrl+A              Delete word to the right",
		"Home                Move to start of logical line",
		"STOP                Move to end of logical line",
		"Ctrl+Home / Ctrl+STOP  Move to start / end of document",
		"Enter               Insert a line break",
		"Tab                 Insert spaces to next 8-column stop",
		"Backspace / Delete  Delete previous / next character",
		"Insert              Toggle Insert / Over mode",
	};
	static const c8* page2[] =
	{
		"SELECT              Open or close the menu bar",
		"Left / Right        Select a menu",
		"Up / Down           Select a menu item",
		"Enter               Activate the selected menu item",
		"Esc                 Close a menu or help window",
		"Enter / Esc         Close an information message",
		"Left / Right        Choose Cancel / Discard at exit prompt",
		"Enter               Confirm the selected exit choice",
		"Esc / SELECT        Cancel the exit prompt",
		"Down                Show the next Keys help page",
		"Right               Return to the previous Keys help page",
	};
	u8 page = 0;
	Editor_Invalidate();
	for (;;)
	{
		Scr_DrawWindow(KEYS_X, KEYS_Y, KEYS_WIDTH, KEYS_HEIGHT, "Help - Keys");
		Scr_PrintAt(KEYS_X + 3, KEYS_Y + 2,
			page ? "EDITOR AND MENU KEYS (2/2)" : "EDITOR KEYS (1/2)");
		Scr_DrawSeparator(KEYS_X, KEYS_Y + 3, KEYS_WIDTH);
		const c8** lines = page ? page2 : page1;
		u8 count = page ? sizeof(page2) / sizeof(page2[0]) : sizeof(page1) / sizeof(page1[0]);
		for (u8 i = 0; i < count; ++i)
			Scr_PrintAt(KEYS_X + 3, KEYS_Y + 4 + i, lines[i]);
		Scr_PrintAt(KEYS_X + 3, KEYS_Y + KEYS_HEIGHT - 2,
			"Down: next page   Right: previous page   Esc: close");
		u8 key = WaitInput(TRUE);
		if (key == KEY_ESC)
			break;
		if ((key == KEY_DOWN) && (page == 0))
			page = 1;
		else if ((key == KEY_RIGHT) && page)
			page = 0;
	}
	ReleaseMenuKeys();
}

//-----------------------------------------------------------------------------
bool ConfirmExit()
{
	if (!g_EditorModified)
		return TRUE;
	Editor_Invalidate();
	bool discard = FALSE;
	Scr_DrawWindow(16, 8, 48, 7, "Unsaved text");
	Scr_PrintAt(19, 10, "Exit without saving the modified text?");
	Scr_PrintAt(22, 13, "[ Cancel ]     [ Discard ]");
	for (;;)
	{
		Scr_SetBlink(22, 13, 10, discard);
		Scr_SetBlink(37, 13, 11, !discard);
		u8 key = WaitInput(TRUE);
		if ((key == KEY_ESC) || (key == KEY_SELECT))
			return FALSE;
		if ((key == KEY_LEFT) || (key == KEY_RIGHT))
			discard = !discard;
		if (key == KEY_ENTER)
			return discard;
	}
}

//-----------------------------------------------------------------------------
void RunMenus()
{
	bool open = FALSE;
	u8 menuIndex = 0;
	u8 itemIndex = 0;
	g_KeyRow2 = ReadMenuRow(2);
	g_KeyRow5 = ReadMenuRow(5);
	g_KeyRow4 = ReadMenuRow(4);
	g_KeyRow7 = ReadMenuRow(7);
	g_KeyRow8 = ReadMenuRow(8);
	if (!Document_Init())
	{
		ShowMessage("Memory error", "Cannot allocate document memory.", NULL);
		return;
	}
	Editor_Init();
	DrawDesktop();
	ReleaseMenuKeys();
	g_KeyRow2 = ReadMenuRow(2);
	g_KeyRow5 = ReadMenuRow(5);
	g_KeyRow4 = ReadMenuRow(4);
	g_KeyRow7 = ReadMenuRow(7);
	g_KeyRow8 = ReadMenuRow(8);

	for (;;)
	{
		u16 input = WaitInput(open);
		u8 key = input;
		if (input == UI_SELECT)
		{
			open = !open;
			ClearKeyBuffer();
		}
		else if (!open)
		{
			if (!Editor_Input(input))
			{
				ShowMessage("Memory full", "All document segments are full.", NULL);
				DrawDesktop();
			}
			else
				Editor_Draw();
			continue;
		}
		else if (key == KEY_ESC)
			open = FALSE;
		else if ((key == KEY_LEFT) || (key == KEY_RIGHT))
		{
			if (key == KEY_LEFT)
				menuIndex = menuIndex ? menuIndex - 1 : MENU_COUNT - 1;
			else
				menuIndex = (menuIndex + 1) % MENU_COUNT;
			itemIndex = 0;
		}
		else if ((key == KEY_UP) || (key == KEY_DOWN))
		{
			u8 count = g_Menus[menuIndex].Count;
			if (key == KEY_UP)
				itemIndex = itemIndex ? itemIndex - 1 : count - 1;
			else
				itemIndex = (itemIndex + 1) % count;
		}
		else if (key == KEY_ENTER)
		{
			switch (g_Menus[menuIndex].Items[itemIndex].Action)
			{
			case MENU_EXIT:
				DrawDesktop();
				if (!ConfirmExit())
				{
					open = FALSE;
					ClearKeyBuffer();
					break;
				}
				while (IS_KEY_PRESSED(ReadMenuRow(KEY_ROW(KEY_ENTER)), KEY_ENTER)) {}
				// Discard BIOS type-ahead before returning to the DOS prompt.
				ClearKeyBuffer();
				return;
			case MENU_ABOUT:
				DrawDesktop();
				ShowMessage(g_HelpItems[0].Label, APP_NAME, "Version " APP_VERSION);
				open = FALSE;
				break;
			case MENU_KEYS:
				DrawDesktop();
				ShowKeys();
				open = FALSE;
				break;
			case MENU_UNAVAILABLE:
				DrawDesktop();
				ShowMessage("Not available", "Not implemented yet.", NULL);
				open = FALSE;
				break;
			case MENU_WRAP:
				Editor_ToggleWrap();
				open = FALSE;
				break;
			case MENU_INSERT:
				g_EditorInsert = !g_EditorInsert;
				open = FALSE;
				break;
			case MENU_EDITOR:
				open = FALSE;
				break;
			}
			ClearKeyBuffer();
		}

		DrawDesktop();
		if (open)
			DrawMenu(menuIndex, itemIndex);
		else
			ReleaseMenuKeys();
	}
}

//-----------------------------------------------------------------------------
// Program entry point. crt0 passes the value returned in A to _TERM, so main
// returns u8 instead of int (which SDCC would return in DE).
#pragma disable_warning 323
u8 main()
{
	bool envOK = CheckEnvironment();

	if (!envOK)
	{
		PrintLn(APP_NAME " " APP_VERSION);
		PrintReport(FALSE);
		return 0;
	}

	Scr_Init();
	g_ScrMode = TRUE;

	DrawBar(0, APP_NAME " " APP_VERSION, "MSX2+ / DOS 2");
	DrawBar(SCR_HEIGHT - 1, "Enter/Esc=OK", NULL);

	ShowReportWindow();
	RunMenus();
	bool memoryOK = Document_Close();

	g_ScrMode = FALSE;
	Scr_Restore();
	if (!memoryOK)
		PrintLn("Error releasing document memory.");
	return 0;
}