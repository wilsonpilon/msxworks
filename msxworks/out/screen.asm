;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module screen
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DOS_InterSlotCall
	.globl _DOS_CharOutput
	.globl _g_ScrBlink
	.globl _DOS_TPAUpperAddr
	.globl _g_SLTSL
	.globl _g_GRPACY
	.globl _g_GRPACX
	.globl _g_LOGOPR
	.globl _g_CMASK
	.globl _g_CLOC
	.globl _g_FNKSTR
	.globl _g_GETPNT
	.globl _g_PUTPNT
	.globl _g_ATRBYT
	.globl _g_BDRCLR
	.globl _g_BAKCLR
	.globl _g_FORCLR
	.globl _g_CSRX
	.globl _g_CSRY
	.globl _g_CLIKSW
	.globl _g_MLTPAT
	.globl _g_MLTATR
	.globl _g_MLTCGP
	.globl _g_MLTCOL
	.globl _g_MLTNAM
	.globl _g_GRPPAT
	.globl _g_GRPATR
	.globl _g_GRPCGP
	.globl _g_GRPCOL
	.globl _g_GRPNAM
	.globl _g_T32PAT
	.globl _g_T32ATR
	.globl _g_T32CGP
	.globl _g_T32COL
	.globl _g_T32NAM
	.globl _g_TXTPAT
	.globl _g_TXTATR
	.globl _g_TXTCGP
	.globl _g_TXTCOL
	.globl _g_TXTNAM
	.globl _g_CLMLST
	.globl _g_CRTCNT
	.globl _g_LINLEN
	.globl _g_LINL32
	.globl _g_LINL40
	.globl _g_BDOS
	.globl _g_MASTER
	.globl _g_RAMAD3
	.globl _g_RAMAD2
	.globl _g_RAMAD1
	.globl _g_RAMAD0
	.globl _g_BREAKV
	.globl _g_DISKVE
	.globl _g_KANJTABLE
	.globl _g_STRSRC
	.globl _g_SUBRID
	.globl _g_CHAR_16
	.globl _g_MSXMID
	.globl _g_MSXVER
	.globl _g_ROMVersion
	.globl _g_BASRVN
	.globl _g_VDP_DW
	.globl _g_VDP_DR
	.globl _g_CGTABL
	.globl _g_SVFFFD
	.globl _g_RG27SAV
	.globl _g_RG26SAV
	.globl _g_RG25SAV
	.globl _g_SVFFF8
	.globl _g_MINROM
	.globl _g_RG23SAV
	.globl _g_RG22SAV
	.globl _g_RG21SAV
	.globl _g_RG20SAV
	.globl _g_RG19SAV
	.globl _g_RG18SAV
	.globl _g_RG17SAV
	.globl _g_RG16SAV
	.globl _g_RG15SAV
	.globl _g_RG14SAV
	.globl _g_RG13SAV
	.globl _g_RG12SAV
	.globl _g_RG11SAV
	.globl _g_RG10SAV
	.globl _g_RG09SAV
	.globl _g_RG08SAV
	.globl _g_PROCNM
	.globl _g_SLTWRK
	.globl _g_SLTATR
	.globl _g_SLTTBL
	.globl _g_EXPTBL
	.globl _g_MNROM
	.globl _g_DRWANG
	.globl _g_DRWSCL
	.globl _g_DRWFLG
	.globl _g_GYPOS
	.globl _g_GXPOS
	.globl _g_BRDATR
	.globl _g_CASPRV
	.globl _g_OLDSCR
	.globl _g_SCRMOD
	.globl _g_FLBMEM
	.globl _g_KANAMD
	.globl _g_KANAST
	.globl _g_CAPST
	.globl _g_CSTYLE
	.globl _g_CSRSW
	.globl _g_INSFLG
	.globl _g_ESCCNT
	.globl _g_GRPHED
	.globl _g_WINWID
	.globl _g_LOWLIM
	.globl _g_INTCNT
	.globl _g_INTVAL
	.globl _g_JIFFY
	.globl _g_PADX
	.globl _g_PADY
	.globl _g_INTFLG
	.globl _g_RTYCNT
	.globl _g_TRPTBL
	.globl _g_HIMEM
	.globl _g_BOTTOM
	.globl _g_PATWRK
	.globl _g_LINWRK
	.globl _g_KEYBUF
	.globl _g_NEWKEY
	.globl _g_OLDKEY
	.globl _g_CLIKFL
	.globl _g_ONGSBF
	.globl _g_FNKFLG
	.globl _g_FNKSWI
	.globl _g_CODSAV
	.globl _g_FSTPOS
	.globl _g_LINTTB
	.globl _g_BASROM
	.globl _g_ENSTOP
	.globl _g_VCBC
	.globl _g_VCBB
	.globl _g_VCBA
	.globl _g_PLYCNT
	.globl _g_MUSICF
	.globl _g_QUEUEN
	.globl _g_MCLPTR
	.globl _g_MCLLEN
	.globl _g_SAVVOL
	.globl _g_VOICEN
	.globl _g_SAVSP
	.globl _g_PRSCNT
	.globl _g_LSTMOD
	.globl _g_LSTCOM
	.globl _g_COMMSK
	.globl _g_ESTBLS
	.globl _g_FLAGS
	.globl _g_ERRORS
	.globl _g_DATCNT
	.globl _g_DEVNUM
	.globl _g_OLDINT
	.globl _g_OLDSTT
	.globl _g_MEXBIh
	.globl _g_RSIQLN
	.globl _g_RSFCB
	.globl _g_TOCNT
	.globl _g_RSTMP
	.globl _g_YSAVE
	.globl _g_XSAVE
	.globl _g_NORUSE
	.globl _g_MODE
	.globl _g_ROMA
	.globl _g_CHRCNT
	.globl _g_EXBRSA
	.globl _g_AVCSAV
	.globl _g_ACPAGE
	.globl _g_DPPAGE
	.globl _g_RS2IQ
	.globl _g_VOICCQ
	.globl _g_VOICBQ
	.globl _g_VOICAQ
	.globl _g_QUEBAK
	.globl _g_QUETAB
	.globl _g_ASPCT2
	.globl _g_ASPCT1
	.globl _g_HEADER
	.globl _g_HIGH
	.globl _g_LOW
	.globl _g_CS240
	.globl _g_CS120
	.globl _g_REPCNT
	.globl _g_SCNCNT
	.globl _g_FRCNEW
	.globl _g_QUEUES
	.globl _g_MINUPD
	.globl _g_MAXUPD
	.globl _g_TRGFLG
	.globl _g_STATFL
	.globl _g_RG7SAV
	.globl _g_RG6SAV
	.globl _g_RG5SAV
	.globl _g_RG4SAV
	.globl _g_RG3SAV
	.globl _g_RG2SAV
	.globl _g_RG1SAV
	.globl _g_RG0SAV
	.globl _g_CNSDFG
	.globl _g_USRTAB
	.globl _g_CLPRIM
	.globl _g_WRPRIM
	.globl _g_RDPRIM
	.globl _Scr_SetReg
	.globl _Scr_SetWriteAddr
	.globl _Scr_Locate
	.globl _Scr_PutChar
	.globl _Scr_Puts
	.globl _Scr_Write
	.globl _Scr_Fill
	.globl _Scr_ClearBlink
	.globl _Scr_SetBlink
	.globl _Scr_DrawWindow
	.globl _Scr_DrawSeparator
	.globl _Scr_Clear
	.globl _Scr_Init
	.globl _Scr_Restore
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PSG_RegPort	=	0x00a0
_g_PSG_DataPort	=	0x00a1
_g_PSG_StatPort	=	0x00a2
_g_PSG_Ext_RegPort	=	0x0010
_g_PSG_Ext_DataPort	=	0x0011
_g_PSG_Ext_StatPort	=	0x0012
_g_Printer_ControlPort	=	0x0090
_g_Printer_DataPort	=	0x0091
_g_MSXMusic_IndexPort	=	0x007c
_g_MSXMusic_DataPort	=	0x007d
_g_VDP_DataPort	=	0x0098
_g_VDP_RegPort	=	0x0099
_g_VDP_AddrPort	=	0x0099
_g_VDP_StatPort	=	0x0099
_g_VDP_PalPort	=	0x009a
_g_VDP_IRegPort	=	0x009b
_g_PortPrimarySlot	=	0x00a8
_g_PortReadKeyboard	=	0x00a9
_g_PortAccessKeyboard	=	0x00aa
_g_PortControl	=	0x00ab
_g_RTC_AddrPort	=	0x00b4
_g_RTC_DataPort	=	0x00b5
_g_MSXAudio_IndexPort	=	0x00c0
_g_MSXAudio_DataPort	=	0x00c1
_g_MSXAudio_IndexPort2	=	0x00c2
_g_MSXAudio_DataPort2	=	0x00c3
_g_Kanji_Level1LowPort	=	0x00d8
_g_Kanji_Level1HighPort	=	0x00d9
_g_Kanji_Level2LowPort	=	0x00da
_g_Kanji_Level2HighPort	=	0x00db
_g_TimerLowPort	=	0x00e6
_g_TimerHighPort	=	0x00e7
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_LINL40	=	0xf3ae
_g_LINL32	=	0xf3af
_g_LINLEN	=	0xf3b0
_g_CRTCNT	=	0xf3b1
_g_CLMLST	=	0xf3b2
_g_TXTNAM	=	0xf3b3
_g_TXTCOL	=	0xf3b5
_g_TXTCGP	=	0xf3b7
_g_TXTATR	=	0xf3b9
_g_TXTPAT	=	0xf3bb
_g_T32NAM	=	0xf3bd
_g_T32COL	=	0xf3bf
_g_T32CGP	=	0xf3c1
_g_T32ATR	=	0xf3c3
_g_T32PAT	=	0xf3c5
_g_GRPNAM	=	0xf3c7
_g_GRPCOL	=	0xf3c9
_g_GRPCGP	=	0xf3cb
_g_GRPATR	=	0xf3cd
_g_GRPPAT	=	0xf3cf
_g_MLTNAM	=	0xf3d1
_g_MLTCOL	=	0xf3d3
_g_MLTCGP	=	0xf3d5
_g_MLTATR	=	0xf3d7
_g_MLTPAT	=	0xf3d9
_g_CLIKSW	=	0xf3db
_g_CSRY	=	0xf3dc
_g_CSRX	=	0xf3dd
_g_FORCLR	=	0xf3e9
_g_BAKCLR	=	0xf3ea
_g_BDRCLR	=	0xf3eb
_g_ATRBYT	=	0xf3f2
_g_PUTPNT	=	0xf3f8
_g_GETPNT	=	0xf3fa
_g_FNKSTR	=	0xf87f
_g_CLOC	=	0xf92a
_g_CMASK	=	0xf92c
_g_LOGOPR	=	0xfb02
_g_GRPACX	=	0xfcb7
_g_GRPACY	=	0xfcb9
_g_SLTSL	=	0xffff
_DOS_TPAUpperAddr	=	0x0006
_g_ScrBlink::
	.ds 240
_s_SavLINL40:
	.ds 1
_s_SavFORCLR:
	.ds 1
_s_SavBAKCLR:
	.ds 1
_s_SavBDRCLR:
	.ds 1
_s_SavRG12:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute ram data
;--------------------------------------------------------
	.area _DABS (ABS)
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;./screen.c:37: void Scr_SetReg(u8 reg, u8 val) __NAKED
;	---------------------------------
; Function Scr_SetReg
; ---------------------------------
_Scr_SetReg::
;./screen.c:52: __endasm;
	ld b, a
	ld a, l
	di
	out (0x99), a
	ld a, b
	or #0x80
	ei
	out (0x99), a
	ret
;./screen.c:53: }
;./screen.c:57: void Scr_SetWriteAddr(u16 addr) __NAKED
;	---------------------------------
; Function Scr_SetWriteAddr
; ---------------------------------
_Scr_SetWriteAddr::
;./screen.c:71: __endasm;
	ld a, l
	di
	out (0x99), a
	ld a, h
	and #0x3F
	or #0x40
	ei
	out (0x99), a
	ret
;./screen.c:72: }
;./screen.c:76: void Scr_Locate(u8 x, u8 y) __NAKED
;	---------------------------------
; Function Scr_Locate
; ---------------------------------
_Scr_Locate::
;./screen.c:96: __endasm;
	ld e, a
	ld d, #0
	ld h, d
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, de
	jp _Scr_SetWriteAddr
;./screen.c:97: }
;./screen.c:101: void Scr_PutChar(c8 chr) __NAKED
;	---------------------------------
; Function Scr_PutChar
; ---------------------------------
_Scr_PutChar::
;./screen.c:108: __endasm;
	out (0x98), a
	ret
;./screen.c:109: }
;./screen.c:113: void Scr_Puts(const c8* str) __NAKED
;	---------------------------------
; Function Scr_Puts
; ---------------------------------
_Scr_Puts::
;./screen.c:130: __endasm;
scr_puts_loop:
	ld a, (hl)
	or a
	ret z
	out (0x98), a
	inc hl
	ld a, (hl)
	or a
	ret z
	out (0x98), a
	inc hl
	jp scr_puts_loop
;./screen.c:131: }
;./screen.c:137: void Scr_Write(const void* src, u16 len) __NAKED
;	---------------------------------
; Function Scr_Write
; ---------------------------------
_Scr_Write::
;./screen.c:158: __endasm;
	ld c, #0x98
	ld b, e
	inc b
	dec b
	jr z, scr_write_blocks
	otir
scr_write_blocks:
	ld a, d
	or a
	ret z
scr_write_loop:
	otir
	dec d
	jr nz, scr_write_loop
	ret
;./screen.c:159: }
;./screen.c:166: void Scr_Fill(u8 chr, u16 len) __NAKED
;	---------------------------------
; Function Scr_Fill
; ---------------------------------
_Scr_Fill::
;./screen.c:223: __endasm;
	ld c, a
	ld a, e
	and #0x07
	ld b, a
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	ld a, c
	inc b
	dec b
	jr z, scr_fill_blocks
scr_fill_rest:
	out (0x98), a
	djnz scr_fill_rest
scr_fill_blocks:
	ld a, d
	or e
	ret z
	ld a, c
scr_fill_loop:
	out (0x98), a
	nop
	nop
	out (0x98), a
	nop
	nop
	out (0x98), a
	nop
	nop
	out (0x98), a
	nop
	nop
	out (0x98), a
	nop
	nop
	out (0x98), a
	nop
	nop
	out (0x98), a
	nop
	nop
	out (0x98), a
	dec de
	ld a, d
	or e
	ld a, c
	jp nz, scr_fill_loop
	ret
;./screen.c:224: }
;./screen.c:232: void Scr_ClearBlink()
;	---------------------------------
; Function Scr_ClearBlink
; ---------------------------------
_Scr_ClearBlink::
;./screen.c:234: for (u8 i = 0; i < SCR_BLINK_SIZE; ++i)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0xf0
	jr	nc, 00101$
;./screen.c:235: g_ScrBlink[i] = 0;
	ld	hl, #_g_ScrBlink
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;./screen.c:234: for (u8 i = 0; i < SCR_BLINK_SIZE; ++i)
	inc	c
	jr	00103$
00101$:
;./screen.c:236: Scr_SetWriteAddr(SCR_BLINK_ADDR);
	ld	hl, #0x0800
	call	_Scr_SetWriteAddr
;./screen.c:237: Scr_Fill(0, SCR_BLINK_SIZE);
	ld	de, #0x00f0
	xor	a, a
;./screen.c:238: }
	jp	_Scr_Fill
_g_RDPRIM	=	0xf380
_g_WRPRIM	=	0xf385
_g_CLPRIM	=	0xf38c
_g_USRTAB	=	0xf39a
_g_CNSDFG	=	0xf3de
_g_RG0SAV	=	0xf3df
_g_RG1SAV	=	0xf3e0
_g_RG2SAV	=	0xf3e1
_g_RG3SAV	=	0xf3e2
_g_RG4SAV	=	0xf3e3
_g_RG5SAV	=	0xf3e4
_g_RG6SAV	=	0xf3e5
_g_RG7SAV	=	0xf3e6
_g_STATFL	=	0xf3e7
_g_TRGFLG	=	0xf3e8
_g_MAXUPD	=	0xf3ec
_g_MINUPD	=	0xf3ef
_g_QUEUES	=	0xf3f3
_g_FRCNEW	=	0xf3f5
_g_SCNCNT	=	0xf3f6
_g_REPCNT	=	0xf3f7
_g_CS120	=	0xf3fc
_g_CS240	=	0xf401
_g_LOW	=	0xf406
_g_HIGH	=	0xf408
_g_HEADER	=	0xf40a
_g_ASPCT1	=	0xf40b
_g_ASPCT2	=	0xf40d
_g_QUETAB	=	0xf959
_g_QUEBAK	=	0xf971
_g_VOICAQ	=	0xf975
_g_VOICBQ	=	0xf9f5
_g_VOICCQ	=	0xfa75
_g_RS2IQ	=	0xfaf5
_g_DPPAGE	=	0xfaf5
_g_ACPAGE	=	0xfaf6
_g_AVCSAV	=	0xfaf7
_g_EXBRSA	=	0xfaf8
_g_CHRCNT	=	0xfaf9
_g_ROMA	=	0xfafa
_g_MODE	=	0xfafc
_g_NORUSE	=	0xfafd
_g_XSAVE	=	0xfafe
_g_YSAVE	=	0xfb00
_g_RSTMP	=	0xfb03
_g_TOCNT	=	0xfb03
_g_RSFCB	=	0xfb04
_g_RSIQLN	=	0xfb06
_g_MEXBIh	=	0xfb07
_g_OLDSTT	=	0xfb0c
_g_OLDINT	=	0xfb0c
_g_DEVNUM	=	0xfb16
_g_DATCNT	=	0xfb17
_g_ERRORS	=	0xfb1a
_g_FLAGS	=	0xfb1b
_g_ESTBLS	=	0xfb1c
_g_COMMSK	=	0xfb1d
_g_LSTCOM	=	0xfb1e
_g_LSTMOD	=	0xfb1f
_g_PRSCNT	=	0xfb35
_g_SAVSP	=	0xfb36
_g_VOICEN	=	0xfb38
_g_SAVVOL	=	0xfb39
_g_MCLLEN	=	0xfb3b
_g_MCLPTR	=	0xfb3c
_g_QUEUEN	=	0xfb3e
_g_MUSICF	=	0xfb3f
_g_PLYCNT	=	0xfb40
_g_VCBA	=	0xfb41
_g_VCBB	=	0xfb66
_g_VCBC	=	0xfb8b
_g_ENSTOP	=	0xfbb0
_g_BASROM	=	0xfbb1
_g_LINTTB	=	0xfbb2
_g_FSTPOS	=	0xfbca
_g_CODSAV	=	0xfbcc
_g_FNKSWI	=	0xfbcd
_g_FNKFLG	=	0xfbce
_g_ONGSBF	=	0xfbd8
_g_CLIKFL	=	0xfbd9
_g_OLDKEY	=	0xfbda
_g_NEWKEY	=	0xfbe5
_g_KEYBUF	=	0xfbf0
_g_LINWRK	=	0xfc18
_g_PATWRK	=	0xfc40
_g_BOTTOM	=	0xfc48
_g_HIMEM	=	0xfc4a
_g_TRPTBL	=	0xfc4c
_g_RTYCNT	=	0xfc9a
_g_INTFLG	=	0xfc9b
_g_PADY	=	0xfc9c
_g_PADX	=	0xfc9d
_g_JIFFY	=	0xfc9e
_g_INTVAL	=	0xfca0
_g_INTCNT	=	0xfca2
_g_LOWLIM	=	0xfca4
_g_WINWID	=	0xfca5
_g_GRPHED	=	0xfca6
_g_ESCCNT	=	0xfca7
_g_INSFLG	=	0xfca8
_g_CSRSW	=	0xfca9
_g_CSTYLE	=	0xfcaa
_g_CAPST	=	0xfcab
_g_KANAST	=	0xfcac
_g_KANAMD	=	0xfcad
_g_FLBMEM	=	0xfcae
_g_SCRMOD	=	0xfcaf
_g_OLDSCR	=	0xfcb0
_g_CASPRV	=	0xfcb1
_g_BRDATR	=	0xfcb2
_g_GXPOS	=	0xfcb3
_g_GYPOS	=	0xfcb5
_g_DRWFLG	=	0xfcbb
_g_DRWSCL	=	0xfcbc
_g_DRWANG	=	0xfcbd
_g_MNROM	=	0xfcc1
_g_EXPTBL	=	0xfcc1
_g_SLTTBL	=	0xfcc5
_g_SLTATR	=	0xfcc9
_g_SLTWRK	=	0xfd09
_g_PROCNM	=	0xfd89
_g_RG08SAV	=	0xffe7
_g_RG09SAV	=	0xffe8
_g_RG10SAV	=	0xffe9
_g_RG11SAV	=	0xffea
_g_RG12SAV	=	0xffeb
_g_RG13SAV	=	0xffec
_g_RG14SAV	=	0xffed
_g_RG15SAV	=	0xffee
_g_RG16SAV	=	0xffef
_g_RG17SAV	=	0xfff0
_g_RG18SAV	=	0xfff1
_g_RG19SAV	=	0xfff2
_g_RG20SAV	=	0xfff3
_g_RG21SAV	=	0xfff4
_g_RG22SAV	=	0xfff5
_g_RG23SAV	=	0xfff6
_g_MINROM	=	0xfff7
_g_SVFFF8	=	0xfff8
_g_RG25SAV	=	0xfffa
_g_RG26SAV	=	0xfffb
_g_RG27SAV	=	0xfffc
_g_SVFFFD	=	0xfffd
_g_CGTABL	=	0x0004
_g_VDP_DR	=	0x0006
_g_VDP_DW	=	0x0007
_g_BASRVN	=	0x002b
_g_ROMVersion	=	0x002b
_g_MSXVER	=	0x002d
_g_MSXMID	=	0x002e
_g_CHAR_16	=	0x0034
___str_0:
	.db 0x0a
	.db 0x0d
	.ascii "$"
	.db 0x00
_g_SUBRID	=	0x0000
_g_STRSRC	=	0x0002
_g_KANJTABLE	=	0xf30f
_g_DISKVE	=	0xf323
_g_BREAKV	=	0xf325
_g_RAMAD0	=	0xf341
_g_RAMAD1	=	0xf342
_g_RAMAD2	=	0xf343
_g_RAMAD3	=	0xf344
_g_MASTER	=	0xf348
_g_BDOS	=	0xf37d
;./screen.c:243: void Scr_SetBlink(u8 x, u8 y, u16 len, bool on)
;	---------------------------------
; Function Scr_SetBlink
; ---------------------------------
_Scr_SetBlink::
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	af
	push	af
	dec	sp
	ld	c, a
	ld	e, l
;./screen.c:245: u16 pos = (u16)y * SCR_WIDTH + x;
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	b, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;./screen.c:246: u16 end = pos + len;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, bc
	ex	(sp), hl
;./screen.c:247: if (end > SCR_WIDTH * SCR_HEIGHT)
	pop	de
	push	de
	ld	a, #0x80
	cp	a, e
	ld	a, #0x07
	sbc	a, d
	jr	nc, 00102$
;./screen.c:248: end = SCR_WIDTH * SCR_HEIGHT;
	ld	hl, #0x0780
	ex	(sp), hl
00102$:
;./screen.c:249: if (pos >= end)
	ld	a, c
	sub	a, -7 (ix)
	ld	a, b
	sbc	a, -6 (ix)
;./screen.c:250: return;
	jp	nc, 00115$
;./screen.c:252: u8 first = pos >> 3;
	ld	e, c
	ld	a, b
	ld	l, #0x03
00183$:
	srl	a
	rr	e
	dec	l
	jr	nz, 00183$
;./screen.c:253: u8 last = (end - 1) >> 3;
	pop	hl
	push	hl
	dec	hl
	ld	a, #0x03
00184$:
	srl	h
	rr	l
	dec	a
	jr	nz, 00184$
	ld	-5 (ix), l
;./screen.c:254: while (pos < end)
00112$:
	ld	a, c
	sub	a, -7 (ix)
	ld	a, b
	sbc	a, -6 (ix)
	jp	nc, 00114$
;./screen.c:256: u8* ptr = &g_ScrBlink[pos >> 3];
	ld	a, c
	ld	d, b
	ld	l, #0x03
00185$:
	srl	d
	rr	a
	dec	l
	jr	nz, 00185$
	add	a, #<(_g_ScrBlink)
	ld	l, a
	ld	a, d
	adc	a, #>(_g_ScrBlink)
	ld	-4 (ix), l
	ld	-3 (ix), a
;./screen.c:257: u8 bit = pos & 0x07;
	ld	a, c
	and	a, #0x07
	ld	-1 (ix), a
;./screen.c:258: if ((bit == 0) && (end - pos >= 8))
	or	a, a
	jr	nz, 00109$
	pop	hl
	push	hl
	cp	a, a
	sbc	hl, bc
	ld	a, l
	sub	a, #0x08
	ld	a, h
	sbc	a, #0x00
	jr	c, 00109$
;./screen.c:260: *ptr = on ? 0xFF : 0x00;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, 6 (ix)
	or	a, a
	jr	z, 00117$
	ld	d, #0xff
	jr	00118$
00117$:
	ld	d, #0x00
00118$:
	ld	(hl), d
;./screen.c:261: pos += 8;
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	jr	00112$
00109$:
;./screen.c:265: u8 mask = 0x80 >> bit;
	ld	a, -1 (ix)
	ld	hl, #0x0080
	inc	a
	jr	00187$
00186$:
	sra	h
	rr	l
00187$:
	dec	a
	jr	nz, 00186$
	ld	-2 (ix), l
;./screen.c:267: *ptr |= mask;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
;./screen.c:266: if (on)
	ld	a, 6 (ix)
	or	a, a
	jr	z, 00106$
;./screen.c:267: *ptr |= mask;
	ld	a, -1 (ix)
	or	a, -2 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
	jr	00107$
00106$:
;./screen.c:269: *ptr &= ~mask;
	ld	a, -2 (ix)
	cpl
	and	a, -1 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
00107$:
;./screen.c:270: pos++;
	inc	bc
	jp	00112$
00114$:
;./screen.c:274: Scr_SetWriteAddr(SCR_BLINK_ADDR + first);
	ld	c, e
	ld	b, #0x00
	ld	hl, #0x0800
	add	hl, bc
	push	bc
	push	de
	call	_Scr_SetWriteAddr
	pop	de
	pop	bc
;./screen.c:275: Scr_Write(&g_ScrBlink[first], last - first + 1);
	ld	a, -5 (ix)
	sub	a, c
	ld	c, a
	sbc	a, a
	ld	b, a
	inc	bc
	ld	hl, #_g_ScrBlink
	ld	d, #0x00
	add	hl, de
	ld	e, c
	ld	d, b
	call	_Scr_Write
00115$:
;./screen.c:276: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;./screen.c:284: static void DrawWinLine(u8 x, u8 y, u8 w, c8 left, c8 fill, c8 right)
;	---------------------------------
; Function DrawWinLine
; ---------------------------------
_DrawWinLine:
;./screen.c:286: Scr_Locate(x, y);
	call	_Scr_Locate
;./screen.c:287: Scr_PutChar(left);
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	call	_Scr_PutChar
;./screen.c:288: Scr_Fill(fill, w - 2);
	ld	iy, #2
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, #0x00
	dec	de
	dec	de
	ld	a, 2 (iy)
	call	_Scr_Fill
;./screen.c:289: Scr_PutChar(right);
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	call	_Scr_PutChar
;./screen.c:290: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;./screen.c:294: void Scr_DrawWindow(u8 x, u8 y, u8 w, u8 h, const c8* title)
;	---------------------------------
; Function Scr_DrawWindow
; ---------------------------------
_Scr_DrawWindow::
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	ld	c, a
	ld	b, l
;./screen.c:296: u8 last = y + h - 1;
	ld	a, b
	add	a, 5 (ix)
	ld	e, a
	dec	e
;./screen.c:297: DrawWinLine(x, y, w, SCR_CHR_TOPLEFT, SCR_CHR_HLINE, SCR_CHR_TOPRIGHT);
	push	bc
	push	de
	ld	hl, #0x1917
	push	hl
	ld	h, #0x18
	ld	l, 4 (ix)
	push	hl
	ld	l, b
	ld	a, c
	call	_DrawWinLine
	pop	de
	pop	bc
;./screen.c:298: for (u8 i = y + 1; i < last; ++i)
	ld	d, b
	inc	d
00109$:
	ld	a, d
	sub	a, e
	jr	nc, 00101$
;./screen.c:299: DrawWinLine(x, i, w, SCR_CHR_VLINE, ' ', SCR_CHR_VLINE);
	push	bc
	push	de
	ld	hl, #0x1620
	push	hl
	ld	h, #0x16
	ld	l, 4 (ix)
	push	hl
	ld	l, d
	ld	a, c
	call	_DrawWinLine
	pop	de
	pop	bc
;./screen.c:298: for (u8 i = y + 1; i < last; ++i)
	inc	d
	jr	00109$
00101$:
;./screen.c:300: DrawWinLine(x, last, w, SCR_CHR_BOTLEFT, SCR_CHR_HLINE, SCR_CHR_BOTRIGHT);
	push	bc
	push	de
	ld	hl, #0x1b17
	push	hl
	ld	h, #0x1a
	ld	l, 4 (ix)
	push	hl
	ld	l, e
	ld	a, c
	call	_DrawWinLine
	pop	de
	pop	bc
;./screen.c:302: for (u8 i = y; i <= last; ++i)
	ld	d, b
00112$:
	ld	a, e
	sub	a, d
	jr	c, 00102$
;./screen.c:303: Scr_SetBlink(x, i, w, TRUE);
	ld	l, 4 (ix)
	ld	h, #0x00
	push	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	hl
	ld	l, d
	ld	a, c
	call	_Scr_SetBlink
	pop	de
	pop	bc
;./screen.c:302: for (u8 i = y; i <= last; ++i)
	inc	d
	jr	00112$
00102$:
;./screen.c:305: if (title)
	ld	a, 7 (ix)
	or	a, 6 (ix)
	jr	z, 00114$
;./screen.c:308: while (title[len])
	ld	e, #0x00
00103$:
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	z, 00105$
;./screen.c:309: len++;
	inc	e
	jr	00103$
00105$:
;./screen.c:310: Scr_Locate(x + (w - len - 2) / 2, y);
	ld	a, 4 (ix)
	sub	a, e
	ld	e, a
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, #0xfe
	ld	-2 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-1 (ix), a
	pop	hl
	push	hl
	bit	7, -1 (ix)
	jr	z, 00116$
	ld	hl, #0xffff
	add	hl, de
00116$:
	sra	h
	rr	l
	ld	a, l
	add	a, c
	ld	l, b
	call	_Scr_Locate
;./screen.c:311: Scr_PutChar(' ');
	ld	a, #0x20
	call	_Scr_PutChar
;./screen.c:312: Scr_Puts(title);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	call	_Scr_Puts
;./screen.c:313: Scr_PutChar(' ');
	ld	a, #0x20
	call	_Scr_PutChar
00114$:
;./screen.c:315: }
	pop	af
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;./screen.c:319: void Scr_DrawSeparator(u8 x, u8 y, u8 w)
;	---------------------------------
; Function Scr_DrawSeparator
; ---------------------------------
_Scr_DrawSeparator::
;./screen.c:321: DrawWinLine(x, y, w, SCR_CHR_TEELEFT, SCR_CHR_HLINE, SCR_CHR_TEERIGHT);
	ld	h, #0x13
	push	hl
	inc	sp
	ld	h, #0x17
	push	hl
	inc	sp
	ld	h, #0x14
	push	hl
	inc	sp
	ld	iy, #5
	add	iy, sp
	ld	h, 0 (iy)
	push	hl
	inc	sp
	call	_DrawWinLine
;./screen.c:322: }
	pop	hl
	inc	sp
	jp	(hl)
;./screen.c:330: void Scr_Clear()
;	---------------------------------
; Function Scr_Clear
; ---------------------------------
_Scr_Clear::
;./screen.c:332: Scr_SetWriteAddr(SCR_NAME_ADDR);
	ld	hl, #0x0000
	call	_Scr_SetWriteAddr
;./screen.c:333: Scr_Fill(' ', SCR_WIDTH * SCR_HEIGHT);
	ld	de, #0x0780
	ld	a, #0x20
	call	_Scr_Fill
;./screen.c:334: Scr_ClearBlink();
;./screen.c:335: }
	jp	_Scr_ClearBlink
;./screen.c:339: static void SetRegMirror(u8 reg, u8 val)
;	---------------------------------
; Function SetRegMirror
; ---------------------------------
_SetRegMirror:
	ld	h, a
;./screen.c:341: Scr_SetReg(reg, val);
	push	hl
	ld	a, h
	call	_Scr_SetReg
	pop	hl
;./screen.c:342: Poke(reg == 12 ? M_RG12SAV : M_RG13SAV, val);
	ld	c, l
	ld	a, h
	sub	a, #0x0c
	jr	nz, 00104$
	ld	hl, #0xffeb
	jr	00105$
00104$:
	ld	hl, #0xffec
00105$:
;E:\msxworks\MSXgl\engine/src/system.h:101: inline void Poke(u16 addr, u8 val) { *(u8*)addr = val; }
	ld	(hl), c
;./screen.c:342: Poke(reg == 12 ? M_RG12SAV : M_RG13SAV, val);
;./screen.c:343: }
	ret
;./screen.c:347: static void ConsoleCursor(c8 cmd)
;	---------------------------------
; Function ConsoleCursor
; ---------------------------------
_ConsoleCursor:
	ld	c, a
;./screen.c:349: DOS_CharOutput(0x1B);
	push	bc
	ld	a, #0x1b
	call	_DOS_CharOutput
	pop	bc
;./screen.c:350: DOS_CharOutput(cmd);
	ld	a, c
	call	_DOS_CharOutput
;./screen.c:351: DOS_CharOutput('5');
	ld	a, #0x35
;./screen.c:352: }
	jp	_DOS_CharOutput
;./screen.c:357: void Scr_Init()
;	---------------------------------
; Function Scr_Init
; ---------------------------------
_Scr_Init::
;./screen.c:359: s_SavLINL40 = g_LINL40;
	ld	a, (_g_LINL40+0)
	ld	(#_s_SavLINL40), a
;./screen.c:360: s_SavFORCLR = g_FORCLR;
	ld	a, (_g_FORCLR+0)
	ld	(#_s_SavFORCLR), a
;./screen.c:361: s_SavBAKCLR = g_BAKCLR;
	ld	a, (_g_BAKCLR+0)
	ld	(#_s_SavBAKCLR), a
;./screen.c:362: s_SavBDRCLR = g_BDRCLR;
	ld	a, (_g_BDRCLR+0)
	ld	(#_s_SavBDRCLR), a
;E:\msxworks\MSXgl\engine/src/system.h:119: inline u8 Peek(u16 addr) { return *(u8*)addr; }
	ld	a, (#0xffeb)
	ld	(#_s_SavRG12), a
;./screen.c:365: g_LINL40 = SCR_WIDTH;
	ld	hl, #_g_LINL40
	ld	(hl), #0x50
;./screen.c:366: g_FORCLR = SCR_TEXT_COLOR;
	ld	hl, #_g_FORCLR
	ld	(hl), #0x0f
;./screen.c:367: g_BAKCLR = SCR_BACK_COLOR;
	ld	hl, #_g_BAKCLR
	ld	(hl), #0x04
;./screen.c:368: g_BDRCLR = SCR_BACK_COLOR;
	ld	hl, #_g_BDRCLR
	ld	(hl), #0x04
;E:\msxworks\MSXgl\engine/src/system.h:119: inline u8 Peek(u16 addr) { return *(u8*)addr; }
	ld	a, (#0xfcc1)
;./screen.c:369: DOS_InterSlotCall(Peek(M_EXPTBL), R_INITXT);
	ld	de, #0x006c
	call	_DOS_InterSlotCall
;./screen.c:370: ConsoleCursor('x'); // hide the BIOS cursor (also drawn while waiting for a key)
	ld	a, #0x78
	call	_ConsoleCursor
;./screen.c:372: Scr_SetReg(14, 0);
	ld	l, #0x00
	ld	a, #0x0e
	call	_Scr_SetReg
;E:\msxworks\MSXgl\engine/src/system.h:101: inline void Poke(u16 addr, u8 val) { *(u8*)addr = val; }
	ld	hl, #0xffed
	ld	(hl), #0x00
;./screen.c:374: Scr_Clear();
	call	_Scr_Clear
;./screen.c:375: SetRegMirror(12, (SCR_ALT_TEXT_COLOR << 4) | SCR_ALT_BACK_COLOR);
	ld	l, #0x1e
	ld	a, #0x0c
	call	_SetRegMirror
;./screen.c:376: SetRegMirror(13, SCR_BLINK_STEADY);
	ld	l, #0xf0
	ld	a, #0x0d
;./screen.c:377: }
	jp	_SetRegMirror
;./screen.c:381: void Scr_Restore()
;	---------------------------------
; Function Scr_Restore
; ---------------------------------
_Scr_Restore::
;./screen.c:383: Scr_ClearBlink();
	call	_Scr_ClearBlink
;./screen.c:384: SetRegMirror(13, SCR_BLINK_OFF);
	ld	l, #0x00
	ld	a, #0x0d
	call	_SetRegMirror
;./screen.c:385: SetRegMirror(12, s_SavRG12);
	ld	a, (_s_SavRG12)
	ld	l, a
	ld	a, #0x0c
	call	_SetRegMirror
;./screen.c:387: g_LINL40 = s_SavLINL40;
	ld	a, (_s_SavLINL40+0)
	ld	(#_g_LINL40), a
;./screen.c:388: g_FORCLR = s_SavFORCLR;
	ld	a, (_s_SavFORCLR+0)
	ld	(#_g_FORCLR), a
;./screen.c:389: g_BAKCLR = s_SavBAKCLR;
	ld	a, (_s_SavBAKCLR+0)
	ld	(#_g_BAKCLR), a
;./screen.c:390: g_BDRCLR = s_SavBDRCLR;
	ld	a, (_s_SavBDRCLR+0)
	ld	(#_g_BDRCLR), a
;E:\msxworks\MSXgl\engine/src/system.h:119: inline u8 Peek(u16 addr) { return *(u8*)addr; }
	ld	a, (#0xfcc1)
;./screen.c:391: DOS_InterSlotCall(Peek(M_EXPTBL), R_INITXT);
	ld	de, #0x006c
	call	_DOS_InterSlotCall
;./screen.c:392: ConsoleCursor('y');
	ld	a, #0x79
;./screen.c:393: }
	jp	_ConsoleCursor
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
