//─────────────────────────────────────────────────────────────────────────────
// MSX-Works - fast SCREEN 0 (80 columns) text output with blink attributes
//
// All VRAM writes go straight to the VDP ports. Only the VRAM/register
// address setup is protected with DI/EI (the BIOS ISR reads S#0 through port
// 99h, which would break the 2-byte address sequence).
// V9938/V9958 text mode VRAM access slots can be up to 100 VDP cycles apart
// (~17 Z80 T-states), so consecutive VRAM writes must be at least ~22 T-states
// apart, otherwise the VDP silently drops data (OUTI and back-to-back OUT are
// too fast; OTIR and OUT+NOP+NOP are safe).
//─────────────────────────────────────────────────────────────────────────────

#include "msxgl.h"
#include "dos.h"
#include "screen.h"

//=============================================================================
// MEMORY DATA
//=============================================================================

// Shadow copy of the blink table (VRAM is only written, never read back)
u8 g_ScrBlink[SCR_BLINK_SIZE];

// Text mode settings saved by Scr_Init
static u8 s_SavLINL40;
static u8 s_SavFORCLR;
static u8 s_SavBAKCLR;
static u8 s_SavBDRCLR;
static u8 s_SavRG12;

//=============================================================================
// LOW-LEVEL VDP ACCESS
//=============================================================================

//-----------------------------------------------------------------------------
// Write a value to a VDP register
void Scr_SetReg(u8 reg, u8 val) __NAKED
{
	reg; // A
	val; // L

__asm
	ld		b, a
	ld		a, l
	di
	out		(0x99), a
	ld		a, b
	or		#0x80
	ei								// Interrupts are enabled after the next instruction
	out		(0x99), a
	ret
__endasm;
}

//-----------------------------------------------------------------------------
// Set the VRAM write address (0000h~3FFFh). R#14 must be 0.
void Scr_SetWriteAddr(u16 addr) __NAKED
{
	addr; // HL

__asm
	ld		a, l
	di
	out		(0x99), a
	ld		a, h
	and		#0x3F
	or		#0x40
	ei								// Interrupts are enabled after the next instruction
	out		(0x99), a
	ret
__endasm;
}

//-----------------------------------------------------------------------------
// Set the VRAM write address to character position (x, y) of the name table
void Scr_Locate(u8 x, u8 y) __NAKED
{
	x; // A
	y; // L

__asm
	ld		e, a
	ld		d, #0
	ld		h, d
	add		hl, hl					// y * 2
	add		hl, hl					// y * 4
	add		hl, hl					// y * 8
	add		hl, hl					// y * 16
	ld		b, h
	ld		c, l
	add		hl, hl					// y * 32
	add		hl, hl					// y * 64
	add		hl, bc					// y * 80
	add		hl, de					// y * 80 + x (name table is at 0000h)
	jp		_Scr_SetWriteAddr
__endasm;
}

//-----------------------------------------------------------------------------
// Write one character at the current VRAM address
void Scr_PutChar(c8 chr) __NAKED
{
	chr; // A

__asm
	out		(0x98), a
	ret
__endasm;
}

//-----------------------------------------------------------------------------
// Write a zero-terminated string at the current VRAM address
void Scr_Puts(const c8* str) __NAKED
{
	str; // HL

__asm
scr_puts_loop:
	ld		a, (hl)
	or		a
	ret		z
	out		(0x98), a
	inc		hl
	ld		a, (hl)
	or		a
	ret		z
	out		(0x98), a
	inc		hl
	jp		scr_puts_loop
__endasm;
}

//-----------------------------------------------------------------------------
// Write a buffer at the current VRAM address using OTIR (23 T-states per byte;
// OUTI at 18 T is too fast for the VDP text mode access slots).
// First len % 256 bytes, then blocks of 256.
void Scr_Write(const void* src, u16 len) __NAKED
{
	src; // HL
	len; // DE

__asm
	ld		c, #0x98
	ld		b, e					// B = len % 256
	inc		b
	dec		b
	jr		z, scr_write_blocks
	otir
scr_write_blocks:
	ld		a, d					// D = number of 256-byte blocks
	or		a
	ret		z
scr_write_loop:
	otir							// B = 0 -> 256 bytes
	dec		d
	jr		nz, scr_write_loop
	ret
__endasm;
}
//-----------------------------------------------------------------------------
// Write the same byte 'len' times at the current VRAM address.
// Back-to-back OUT (n),A (12 T-states) is too fast for the VDP in text mode
// and silently drops writes; each OUT is padded with two NOPs (22 T-states).
// Remainder (len % 8) with a DJNZ loop (OUT + DJNZ = 26 T), then blocks of 8
// padded OUT.
void Scr_Fill(u8 chr, u16 len) __NAKED
{
	chr; // A
	len; // DE

__asm
	ld		c, a					// C = character
	ld		a, e
	and		#0x07
	ld		b, a					// B = len % 8
	srl		d
	rr		e
	srl		d
	rr		e
	srl		d
	rr		e						// DE = len / 8
	ld		a, c
	inc		b
	dec		b
	jr		z, scr_fill_blocks
scr_fill_rest:
	out		(0x98), a
	djnz	scr_fill_rest
scr_fill_blocks:
	ld		a, d
	or		e
	ret		z
	ld		a, c
scr_fill_loop:
	out		(0x98), a
	nop
	nop
	out		(0x98), a
	nop
	nop
	out		(0x98), a
	nop
	nop
	out		(0x98), a
	nop
	nop
	out		(0x98), a
	nop
	nop
	out		(0x98), a
	nop
	nop
	out		(0x98), a
	nop
	nop
	out		(0x98), a
	dec		de						// 7 T
	ld		a, d					// 5 T
	or		e						// 5 T
	ld		a, c					// 5 T
	jp		nz, scr_fill_loop		// 11 T
	ret
__endasm;
}

//=============================================================================
// BLINK ATTRIBUTES
//=============================================================================

//-----------------------------------------------------------------------------
// Clear all blink attributes
void Scr_ClearBlink()
{
	for (u8 i = 0; i < SCR_BLINK_SIZE; ++i)
		g_ScrBlink[i] = 0;
	Scr_SetWriteAddr(SCR_BLINK_ADDR);
	Scr_Fill(0, SCR_BLINK_SIZE);
}

//-----------------------------------------------------------------------------
// Set/clear the blink attribute of 'len' characters from (x, y).
// Updates the shadow table and uploads only the modified bytes.
void Scr_SetBlink(u8 x, u8 y, u16 len, bool on)
{
	u16 pos = (u16)y * SCR_WIDTH + x;
	u16 end = pos + len;
	if (end > SCR_WIDTH * SCR_HEIGHT)
		end = SCR_WIDTH * SCR_HEIGHT;
	if (pos >= end)
		return;

	u8 first = pos >> 3;
	u8 last = (end - 1) >> 3;
	while (pos < end)
	{
		u8* ptr = &g_ScrBlink[pos >> 3];
		u8 bit = pos & 0x07;
		if ((bit == 0) && (end - pos >= 8))
		{
			*ptr = on ? 0xFF : 0x00;
			pos += 8;
		}
		else
		{
			u8 mask = 0x80 >> bit;
			if (on)
				*ptr |= mask;
			else
				*ptr &= ~mask;
			pos++;
		}
	}

	Scr_SetWriteAddr(SCR_BLINK_ADDR + first);
	Scr_Write(&g_ScrBlink[first], last - first + 1);
}

//=============================================================================
// WINDOWS
//=============================================================================

//-----------------------------------------------------------------------------
// Draw one window line: left char, 'w-2' fill chars, right char
static void DrawWinLine(u8 x, u8 y, u8 w, c8 left, c8 fill, c8 right)
{
	Scr_Locate(x, y);
	Scr_PutChar(left);
	Scr_Fill(fill, w - 2);
	Scr_PutChar(right);
}

//-----------------------------------------------------------------------------
// Draw a framed window with the alternate colors
void Scr_DrawWindow(u8 x, u8 y, u8 w, u8 h, const c8* title)
{
	u8 last = y + h - 1;
	DrawWinLine(x, y, w, SCR_CHR_TOPLEFT, SCR_CHR_HLINE, SCR_CHR_TOPRIGHT);
	for (u8 i = y + 1; i < last; ++i)
		DrawWinLine(x, i, w, SCR_CHR_VLINE, ' ', SCR_CHR_VLINE);
	DrawWinLine(x, last, w, SCR_CHR_BOTLEFT, SCR_CHR_HLINE, SCR_CHR_BOTRIGHT);

	for (u8 i = y; i <= last; ++i)
		Scr_SetBlink(x, i, w, TRUE);

	if (title)
	{
		u8 len = 0;
		while (title[len])
			len++;
		Scr_Locate(x + (w - len - 2) / 2, y);
		Scr_PutChar(' ');
		Scr_Puts(title);
		Scr_PutChar(' ');
	}
}

//-----------------------------------------------------------------------------
// Draw a horizontal separator across a window
void Scr_DrawSeparator(u8 x, u8 y, u8 w)
{
	DrawWinLine(x, y, w, SCR_CHR_TEELEFT, SCR_CHR_HLINE, SCR_CHR_TEERIGHT);
}

//=============================================================================
// MODE HANDLING
//=============================================================================

//-----------------------------------------------------------------------------
// Clear the whole screen and all blink attributes
void Scr_Clear()
{
	Scr_SetWriteAddr(SCR_NAME_ADDR);
	Scr_Fill(' ', SCR_WIDTH * SCR_HEIGHT);
	Scr_ClearBlink();
}

//-----------------------------------------------------------------------------
// Set a VDP register and its BIOS mirror (R#12 and R#13 only)
static void SetRegMirror(u8 reg, u8 val)
{
	Scr_SetReg(reg, val);
	Poke(reg == 12 ? M_RG12SAV : M_RG13SAV, val);
}

//-----------------------------------------------------------------------------
// Console escape sequence ESC x5 (hide cursor) / ESC y5 (show cursor)
static void ConsoleCursor(c8 cmd)
{
	DOS_CharOutput(0x1B);
	DOS_CharOutput(cmd);
	DOS_CharOutput('5');
}

//-----------------------------------------------------------------------------
// Switch to SCREEN 0 WIDTH 80 using the BIOS (keeps BIOS/MSX-DOS state
// consistent), then set up blink colors with direct VDP access
void Scr_Init()
{
	s_SavLINL40 = g_LINL40;
	s_SavFORCLR = g_FORCLR;
	s_SavBAKCLR = g_BAKCLR;
	s_SavBDRCLR = g_BDRCLR;
	s_SavRG12   = Peek(M_RG12SAV);

	g_LINL40 = SCR_WIDTH;
	g_FORCLR = SCR_TEXT_COLOR;
	g_BAKCLR = SCR_BACK_COLOR;
	g_BDRCLR = SCR_BACK_COLOR;
	DOS_InterSlotCall(Peek(M_EXPTBL), R_INITXT);
	ConsoleCursor('x'); // hide the BIOS cursor (also drawn while waiting for a key)

	Scr_SetReg(14, 0);
	Poke(M_RG14SAV, 0);
	Scr_Clear();
	SetRegMirror(12, (SCR_ALT_TEXT_COLOR << 4) | SCR_ALT_BACK_COLOR);
	SetRegMirror(13, SCR_BLINK_STEADY);
}

//-----------------------------------------------------------------------------
// Restore the text mode and colors active before Scr_Init
void Scr_Restore()
{
	Scr_ClearBlink();
	SetRegMirror(13, SCR_BLINK_OFF);
	SetRegMirror(12, s_SavRG12);

	g_LINL40 = s_SavLINL40;
	g_FORCLR = s_SavFORCLR;
	g_BAKCLR = s_SavBAKCLR;
	g_BDRCLR = s_SavBDRCLR;
	DOS_InterSlotCall(Peek(M_EXPTBL), R_INITXT);
	ConsoleCursor('y');
}
