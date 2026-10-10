//─────────────────────────────────────────────────────────────────────────────
// MSX-Works - fast SCREEN 0 (80 columns) text output with blink attributes
//
// VRAM layout (MSX2 BIOS default for SCREEN 0 / WIDTH 80):
//   0000h  Name table   (80 x 24 characters)
//   0800h  Blink table  (1 bit per character, MSB = left-most column)
//   1000h  Pattern table
//
// Colors:
//   Normal characters use R#7  (text color << 4 | background color)
//   Blink  characters use R#12 (text color << 4 | background color)
//   R#13 = F0h (ON time != 0, OFF time = 0) shows blink colors permanently,
//   so the blink attribute works as a second, non-blinking color pair.
//─────────────────────────────────────────────────────────────────────────────
#pragma once

#include "msxgl.h"

//=============================================================================
// DEFINES
//=============================================================================

#define SCR_WIDTH				80
#define SCR_HEIGHT				24

#define SCR_NAME_ADDR			0x0000
#define SCR_BLINK_ADDR			0x0800
#define SCR_BLINK_SIZE			(SCR_WIDTH * SCR_HEIGHT / 8)

// Normal colors: white on blue
#define SCR_TEXT_COLOR			COLOR_WHITE
#define SCR_BACK_COLOR			COLOR_DARK_BLUE

// Blink (alternate) colors: black on gray
#define SCR_ALT_TEXT_COLOR		COLOR_BLACK
#define SCR_ALT_BACK_COLOR		COLOR_GRAY

// R#13 value: alternate colors always ON (no blinking)
#define SCR_BLINK_STEADY		0xF0
// R#13 value: alternate colors always OFF
#define SCR_BLINK_OFF			0x00

//=============================================================================
// FUNCTIONS
//=============================================================================

//.............................................................................
// Mode handling

// Switches to SCREEN 0 WIDTH 80 with MSX-Works colors and steady blink colors
void Scr_Init();

// Restores the text mode and colors that were active before Scr_Init
void Scr_Restore();

//.............................................................................
// Low-level VDP access (direct I/O, no BIOS)

// Writes a value to a VDP register
void Scr_SetReg(u8 reg, u8 val);

// Sets the VRAM write address (0000h~3FFFh)
void Scr_SetWriteAddr(u16 addr);

// Sets the VRAM write address to the given character position
void Scr_Locate(u8 x, u8 y);

// Writes a zero-terminated string at the current VRAM address
void Scr_Puts(const c8* str);

// Writes one character at the current VRAM address
void Scr_PutChar(c8 chr);

// Writes a buffer at the current VRAM address
void Scr_Write(const void* src, u16 len);

// Writes the same byte 'len' times at the current VRAM address
void Scr_Fill(u8 chr, u16 len);

//.............................................................................
// Helpers

// Clears the whole screen and all blink attributes
void Scr_Clear();

// Writes a zero-terminated string at the given position
inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }

// Fills 'len' characters starting at the given position
inline void Scr_FillAt(u8 x, u8 y, u8 chr, u16 len) { Scr_Locate(x, y); Scr_Fill(chr, len); }

// Sets/clears the blink (alternate color) attribute of 'len' characters
// starting at the given position (can span several lines)
void Scr_SetBlink(u8 x, u8 y, u16 len, bool on);

// Clears all blink attributes
void Scr_ClearBlink();

//.............................................................................
// Windows

// Box-drawing characters (pattern codes, same on international and Japanese
// MSX character sets; written directly to VRAM, no 01h graphic prefix)
#define SCR_CHR_HLINE			0x17
#define SCR_CHR_VLINE			0x16
#define SCR_CHR_TOPLEFT			0x18
#define SCR_CHR_TOPRIGHT		0x19
#define SCR_CHR_BOTLEFT			0x1A
#define SCR_CHR_BOTRIGHT		0x1B
#define SCR_CHR_TEELEFT			0x14
#define SCR_CHR_TEERIGHT		0x13

// Draws a framed window with the alternate colors (interior is cleared).
// 'title' (can be NULL) is centered on the top border.
void Scr_DrawWindow(u8 x, u8 y, u8 w, u8 h, const c8* title);

// Draws a horizontal separator (with T junctions) across a window at line y
void Scr_DrawSeparator(u8 x, u8 y, u8 w);
