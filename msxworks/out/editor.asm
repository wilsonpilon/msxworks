;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module editor
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Scr_SetBlink
	.globl _Scr_Write
	.globl _Scr_Locate
	.globl _Document_Delete
	.globl _Document_Insert
	.globl _Document_Put
	.globl _Document_Read
	.globl _Document_Get
	.globl _Document_End
	.globl _Document_Begin
	.globl _Document_Reset
	.globl _g_EditorWrap
	.globl _g_EditorInsert
	.globl _g_EditorModified
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
	.globl _Editor_Invalidate
	.globl _Editor_Init
	.globl _Editor_ToggleWrap
	.globl _Editor_DrawStatus
	.globl _Editor_Draw
	.globl _Editor_Input
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
_s_Cursor:
	.ds 4
_s_LineStart:
	.ds 4
_s_LineNumber:
	.ds 4
_s_TopRow:
	.ds 4
_s_ViewStart:
	.ds 4
_s_LeftCol:
	.ds 4
_s_GoalCol:
	.ds 4
_s_VerticalMove:
	.ds 1
_s_Screen:
	.ds 1840
_s_Row:
	.ds 80
_s_ScreenValid:
	.ds 1
_s_TextDirty:
	.ds 1
_s_DirtyFollowing:
	.ds 1
_s_DirtyStart:
	.ds 4
_s_DirtyLine:
	.ds 4
_s_PaintedRows:
	.ds 1
_s_PaintedView:
	.ds 4
_s_PaintedLeft:
	.ds 4
_s_EndStart:
	.ds 96
_s_EndPos:
	.ds 96
_s_EndValid:
	.ds 24
_s_LastEnd:
	.ds 1
_s_NextEnd:
	.ds 1
_s_Scan:
	.ds 128
_s_CursorX:
	.ds 1
_s_CursorY:
	.ds 1
_g_EditorModified::
	.ds 1
_g_EditorInsert::
	.ds 1
_g_EditorWrap::
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
;./editor.c:41: static u32 LineStart(u32 pos)
;	---------------------------------
; Function LineStart
; ---------------------------------
_LineStart:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-18
	add	iy, sp
	ld	sp, iy
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	-3 (ix), l
	ld	-2 (ix), h
;./editor.c:43: while (pos)
00104$:
	ld	a, -2 (ix)
	or	a, -3 (ix)
	or	a, -4 (ix)
	or	a, -5 (ix)
	jp	z, 00106$
;./editor.c:45: u16 size = pos > sizeof(s_Scan) ? sizeof(s_Scan) : (u16)pos;
	ld	a, #0x80
	cp	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jr	nc, 00112$
	ld	bc, #0x0080
	jr	00113$
00112$:
	ld	c, -5 (ix)
	ld	b, #0x00
00113$:
;./editor.c:46: Document_Read(pos - size, s_Scan, size);
	ld	e, c
	ld	d, b
	ld	hl, #0x0000
	ld	a, -5 (ix)
	sub	a, e
	ld	-10 (ix), a
	ld	a, -4 (ix)
	sbc	a, d
	ld	-9 (ix), a
	ld	a, -3 (ix)
	sbc	a, l
	ld	-8 (ix), a
	ld	a, -2 (ix)
	sbc	a, h
	ld	-7 (ix), a
	push	bc
	push	bc
	ld	hl, #_s_Scan
	push	hl
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	call	_Document_Read
	pop	bc
;./editor.c:47: for (u16 i = size; i; --i)
	ld	-6 (ix), c
	ld	-1 (ix), c
00108$:
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00103$
;./editor.c:48: if (s_Scan[i - 1] == '\n')
	ld	l, -1 (ix)
	dec	l
	ld	h, #0x00
	ld	de, #_s_Scan
	add	hl, de
	ld	a, (hl)
	cp	a, #0x0a
	jr	nz, 00109$
;./editor.c:49: return pos - size + i;
	ld	a, -6 (ix)
	ld	-14 (ix), a
	xor	a, a
	ld	-13 (ix), a
	ld	-12 (ix), a
	ld	-11 (ix), a
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	l, -14 (ix)
	ld	h, #0x00
	add	hl, de
	ex	(sp), hl
	ld	a, #0x00
	adc	a, -8 (ix)
	ld	-16 (ix), a
	ld	a, #0x00
	adc	a, -7 (ix)
	ld	-15 (ix), a
	pop	de
	pop	hl
	push	hl
	push	de
	jr	00110$
00109$:
;./editor.c:47: for (u16 i = size; i; --i)
	dec	-1 (ix)
	ld	a, -1 (ix)
	ld	-6 (ix), a
	jr	00108$
00103$:
;./editor.c:50: pos -= size;
	ld	hl, #13
	add	hl, sp
	ex	de, hl
	ld	hl, #8
	add	hl, sp
	ld	bc, #4
	ldir
	jp	00104$
00106$:
;./editor.c:52: return pos;
	ld	de, #0x0000
	ld	l, e
	ld	h, e
00110$:
;./editor.c:53: }
	ld	sp, ix
	pop	ix
	ret
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
;./editor.c:55: static u32 LineEnd(u32 pos)
;	---------------------------------
; Function LineEnd
; ---------------------------------
_LineEnd:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
;./editor.c:57: if (s_EndValid[s_LastEnd] && (pos >= s_EndStart[s_LastEnd]) && (pos <= s_EndPos[s_LastEnd]))
	ld	hl, #_s_EndValid
	ld	a, (_s_LastEnd)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	z, 00102$
	ld	a, (_s_LastEnd)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_s_EndStart
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
	ld	h, a
	ld	a, -4 (ix)
	sub	a, e
	ld	a, -3 (ix)
	sbc	a, d
	ld	a, -2 (ix)
	sbc	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jr	c, 00102$
	ld	hl, #_s_EndPos+0
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	a, e
	sub	a, -4 (ix)
	ld	a, d
	sbc	a, -3 (ix)
	ld	a, c
	sbc	a, -2 (ix)
	ld	a, h
	sbc	a, -1 (ix)
	jr	c, 00102$
;./editor.c:58: return s_EndPos[s_LastEnd];
	ld	l, c
	jp	00121$
00102$:
;./editor.c:59: for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
	ld	-9 (ix), #0x00
	ld	c, #0x00
00119$:
	ld	a, c
	sub	a, #0x18
	jp	nc, 00109$
;./editor.c:60: if (s_EndValid[i] && (pos >= s_EndStart[i]) && (pos <= s_EndPos[i]))
	ld	hl, #_s_EndValid
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	z, 00120$
	ld	e, c
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, #_s_EndStart
	add	iy, de
	ld	a, 0 (iy)
	ld	-8 (ix), a
	ld	a, 1 (iy)
	ld	-7 (ix), a
	ld	a, 2 (iy)
	ld	-6 (ix), a
	ld	a, 3 (iy)
	ld	-5 (ix), a
	ld	a, -4 (ix)
	sub	a, -8 (ix)
	ld	a, -3 (ix)
	sbc	a, -7 (ix)
	ld	a, -2 (ix)
	sbc	a, -6 (ix)
	ld	a, -1 (ix)
	sbc	a, -5 (ix)
	jr	c, 00120$
	ld	iy, #_s_EndPos
	add	iy, de
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, 2 (iy)
	ld	b, 3 (iy)
	ld	a, e
	sub	a, -4 (ix)
	ld	a, d
	sbc	a, -3 (ix)
	ld	a, l
	sbc	a, -2 (ix)
	ld	a, b
	sbc	a, -1 (ix)
	jr	c, 00120$
;./editor.c:62: s_LastEnd = i;
	ld	a, -9 (ix)
	ld	(#_s_LastEnd), a
;./editor.c:63: return s_EndPos[i];
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	jp	00121$
00120$:
;./editor.c:59: for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
	inc	c
	ld	-9 (ix), c
	jp	00119$
00109$:
;./editor.c:65: u32 start = pos;
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #8
	add	hl, sp
	ld	bc, #4
	ldir
;./editor.c:66: bool found = FALSE;
	ld	c, #0x00
;./editor.c:67: while ((pos < s_Length) && !found)
00115$:
	ld	hl, #_g_DocumentLength
	ld	a, -4 (ix)
	sub	a, (hl)
	ld	a, -3 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -2 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jp	nc, 00117$
	ld	a, c
	or	a, a
	jp	nz, 00117$
;./editor.c:69: u32 remaining = s_Length - pos;
	ld	a, (_g_DocumentLength+0)
	sub	a, -4 (ix)
	ld	-8 (ix), a
	ld	a, (_g_DocumentLength+1)
	sbc	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, (_g_DocumentLength+2)
	sbc	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, (_g_DocumentLength+3)
	sbc	a, -1 (ix)
	ld	-5 (ix), a
;./editor.c:70: u16 size = remaining > sizeof(s_Scan) ? sizeof(s_Scan) : (u16)remaining;
	ld	a, #0x80
	cp	a, -8 (ix)
	ld	a, #0x00
	sbc	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	ld	a, #0x00
	sbc	a, -5 (ix)
	jr	nc, 00123$
	ld	-6 (ix), #0x80
	ld	-5 (ix), #0
	jr	00124$
00123$:
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
00124$:
	ld	c, -6 (ix)
	ld	b, #0x00
;./editor.c:71: Document_Read(pos, s_Scan, size);
	push	bc
	push	bc
	ld	hl, #_s_Scan
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_Document_Read
	pop	bc
;./editor.c:73: while ((i < size) && (s_Scan[i] != '\n'))
	ld	de, #0x0000
00111$:
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	ld	a, #0x00
	rla
	ld	-5 (ix), a
	or	a, a
	jr	z, 00113$
	ld	hl, #_s_Scan
	add	hl, de
	ld	a, (hl)
	cp	a, #0x0a
	jr	z, 00113$
;./editor.c:74: ++i;
	inc	de
	jr	00111$
00113$:
;./editor.c:75: pos += i;
	ld	bc, #0x0000
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, c
	adc	a, -2 (ix)
	ld	-2 (ix), a
	ld	a, b
	adc	a, -1 (ix)
	ld	-1 (ix), a
;./editor.c:76: found = i < size;
	ld	c, -5 (ix)
	jp	00115$
00117$:
;./editor.c:78: s_LastEnd = s_NextEnd;
	ld	a, (_s_NextEnd+0)
	ld	(#_s_LastEnd), a
;./editor.c:79: s_NextEnd = (s_NextEnd + 1) % LINE_CACHE_SIZE;
	ld	a, (_s_NextEnd)
	ld	l, a
	ld	h, #0x00
	inc	hl
	ld	de, #0x0018
	call	__modsint
	ld	hl, #_s_NextEnd
	ld	(hl), e
;./editor.c:80: s_EndValid[s_LastEnd] = TRUE;
	ld	hl, #_s_EndValid
	ld	a, (_s_LastEnd)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0x01
;./editor.c:81: s_EndStart[s_LastEnd] = start;
	ld	a, (_s_LastEnd)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	de, #_s_EndStart
	add	hl, de
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	ld	bc, #0x0004
	ldir
;./editor.c:82: s_EndPos[s_LastEnd] = pos;
	ld	a, (_s_LastEnd)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	de, #_s_EndPos
	add	hl, de
	ex	de, hl
	ld	hl, #8
	add	hl, sp
	ld	bc, #0x0004
	ldir
;./editor.c:83: return pos;
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
00121$:
;./editor.c:84: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:86: static void UpdateLineCache(u32 pos, u16 count, bool insert, bool newline)
;	---------------------------------
; Function UpdateLineCache
; ---------------------------------
_UpdateLineCache:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-19
	add	iy, sp
	ld	sp, iy
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	-3 (ix), l
	ld	-2 (ix), h
;./editor.c:88: for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
	ld	-1 (ix), #0x00
00112$:
	ld	a, -1 (ix)
	sub	a, #0x18
	jp	nc, 00114$
;./editor.c:90: if (newline)
	ld	a, 7 (ix)
	or	a, a
	jr	z, 00108$
;./editor.c:91: s_EndValid[i] = FALSE;
	ld	l, -1 (ix)
	ld	h, #0x00
	ld	de, #_s_EndValid
	add	hl, de
	ld	(hl), #0x00
	jp	00113$
00108$:
;./editor.c:92: else if (s_EndValid[i])
	ld	l, -1 (ix)
	ld	h, #0x00
	ld	de, #_s_EndValid
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	z, 00113$
;./editor.c:94: if (s_EndStart[i] > pos)
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_s_EndStart
	add	hl, bc
	ex	de, hl
	push	de
	push	bc
	ld	hl, #10
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
;./editor.c:95: s_EndStart[i] = insert ? s_EndStart[i] + count : s_EndStart[i] - count;
	ld	a, 4 (ix)
	ld	-19 (ix), a
	ld	a, 5 (ix)
	ld	-18 (ix), a
	xor	a, a
	ld	-17 (ix), a
	ld	-16 (ix), a
;./editor.c:94: if (s_EndStart[i] > pos)
	ld	a, -5 (ix)
	sub	a, -13 (ix)
	ld	a, -4 (ix)
	sbc	a, -12 (ix)
	ld	a, -3 (ix)
	sbc	a, -11 (ix)
	ld	a, -2 (ix)
	sbc	a, -10 (ix)
	jr	nc, 00102$
;./editor.c:95: s_EndStart[i] = insert ? s_EndStart[i] + count : s_EndStart[i] - count;
	ld	a, 6 (ix)
	or	a, a
	jr	z, 00116$
	ld	a, -13 (ix)
	add	a, -19 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	adc	a, -18 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	adc	a, -17 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	adc	a, -16 (ix)
	ld	-6 (ix), a
	jr	00117$
00116$:
	ld	a, -13 (ix)
	sub	a, -19 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	sbc	a, -18 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	sbc	a, -17 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	sbc	a, -16 (ix)
	ld	-6 (ix), a
00117$:
	push	bc
	ld	hl, #12
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
00102$:
;./editor.c:96: if (s_EndPos[i] >= pos)
	ld	hl, #_s_EndPos
	add	hl, bc
	ex	de, hl
	push	de
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	hl
	ld	a, -15 (ix)
	sub	a, -5 (ix)
	ld	a, -14 (ix)
	sbc	a, -4 (ix)
	ld	a, -13 (ix)
	sbc	a, -3 (ix)
	ld	a, -12 (ix)
	sbc	a, -2 (ix)
	jr	c, 00113$
;./editor.c:97: s_EndPos[i] = insert ? s_EndPos[i] + count : s_EndPos[i] - count;
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, 6 (ix)
	or	a, a
	jr	z, 00118$
	pop	de
	push	de
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	add	hl, de
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -13 (ix)
	adc	a, -17 (ix)
	ld	-7 (ix), a
	ld	a, -12 (ix)
	adc	a, -16 (ix)
	ld	-6 (ix), a
	jr	00119$
00118$:
	ld	a, -15 (ix)
	sub	a, -19 (ix)
	ld	-9 (ix), a
	ld	a, -14 (ix)
	sbc	a, -18 (ix)
	ld	-8 (ix), a
	ld	a, -13 (ix)
	sbc	a, -17 (ix)
	ld	-7 (ix), a
	ld	a, -12 (ix)
	sbc	a, -16 (ix)
	ld	-6 (ix), a
00119$:
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	ld	hl, #10
	add	hl, sp
	ld	bc, #0x0004
	ldir
00113$:
;./editor.c:88: for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
	inc	-1 (ix)
	jp	00112$
00114$:
;./editor.c:100: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;./editor.c:102: static void SetCursor(u32 pos)
;	---------------------------------
; Function SetCursor
; ---------------------------------
_SetCursor:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-18
	add	iy, sp
	ld	sp, iy
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	-6 (ix), l
	ld	-5 (ix), h
;./editor.c:104: bool crossed = FALSE;
	ld	-18 (ix), #0x00
;./editor.c:105: u32 from = s_Cursor < pos ? s_Cursor : pos;
	ld	a, (_s_Cursor+0)
	sub	a, -8 (ix)
	ld	a, (_s_Cursor+1)
	sbc	a, -7 (ix)
	ld	a, (_s_Cursor+2)
	sbc	a, -6 (ix)
	ld	a, (_s_Cursor+3)
	sbc	a, -5 (ix)
	ld	a, #0x00
	rla
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	hl, #_s_Cursor
	ld	bc, #4
	ldir
	or	a, a
	jr	z, 00117$
	ld	hl, #14
	add	hl, sp
	ex	de, hl
	ld	hl, #6
	add	hl, sp
	ld	bc, #4
	ldir
	jr	00118$
00117$:
	ld	hl, #14
	add	hl, sp
	ex	de, hl
	ld	hl, #10
	add	hl, sp
	ld	bc, #4
	ldir
00118$:
;./editor.c:106: u32 end = s_Cursor < pos ? pos : s_Cursor;
	or	a, a
	jr	z, 00119$
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	hl, #10
	add	hl, sp
	ld	bc, #4
	ldir
00119$:
	ld	hl, #1
	add	hl, sp
	ex	de, hl
	ld	hl, #6
	add	hl, sp
	ld	bc, #4
	ldir
;./editor.c:107: bool forward = s_Cursor < pos;
	ld	-13 (ix), a
;./editor.c:108: while (from < end)
00107$:
	ld	a, -4 (ix)
	sub	a, -17 (ix)
	ld	a, -3 (ix)
	sbc	a, -16 (ix)
	ld	a, -2 (ix)
	sbc	a, -15 (ix)
	ld	a, -1 (ix)
	sbc	a, -14 (ix)
	jp	nc, 00109$
;./editor.c:110: u32 remaining = end - from;
	ld	a, -17 (ix)
	sub	a, -4 (ix)
	ld	-12 (ix), a
	ld	a, -16 (ix)
	sbc	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, -15 (ix)
	sbc	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -14 (ix)
	sbc	a, -1 (ix)
	ld	-9 (ix), a
;./editor.c:111: u16 size = remaining > sizeof(s_Scan) ? sizeof(s_Scan) : (u16)remaining;
	ld	a, #0x80
	cp	a, -12 (ix)
	ld	a, #0x00
	sbc	a, -11 (ix)
	ld	a, #0x00
	sbc	a, -10 (ix)
	ld	a, #0x00
	sbc	a, -9 (ix)
	jr	nc, 00121$
	ld	-10 (ix), #0x80
	ld	-9 (ix), #0
	jr	00122$
00121$:
	ld	a, -12 (ix)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
00122$:
	ld	c, -10 (ix)
	ld	b, #0x00
;./editor.c:112: Document_Read(from, s_Scan, size);
	push	bc
	push	bc
	ld	hl, #_s_Scan
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_Document_Read
	pop	bc
;./editor.c:113: for (u16 i = 0; i < size; ++i)
	ld	de, #0x0000
00113$:
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	nc, 00106$
;./editor.c:115: if (s_Scan[i] == '\n')
	ld	hl, #_s_Scan
	add	hl, de
	ld	a, (hl)
	cp	a, #0x0a
	jp	nz, 00114$
;./editor.c:117: if (forward)
	ld	a, -13 (ix)
	or	a, a
	jr	z, 00102$
;./editor.c:119: ++s_LineNumber;
	ld	iy, #_s_LineNumber
	inc	0 (iy)
	jr	nz, 00206$
	inc	1 (iy)
	jr	nz, 00206$
	inc	2 (iy)
	jr	nz, 00206$
	inc	3 (iy)
00206$:
;./editor.c:120: s_LineStart = from + i + 1;
	ld	a, e
	push	iy
	ld	-20 (ix), d
	pop	iy
	ld	hl, #0x0000
	add	a, -4 (ix)
	ld	-12 (ix), a
	push	iy
	ld	a, -20 (ix)
	pop	iy
	adc	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, l
	adc	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, h
	adc	a, -1 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	ld	hl, #_s_LineStart
	add	a, #0x01
	ld	(hl), a
	ld	a, -11 (ix)
	inc	hl
	adc	a, #0x00
	ld	(hl), a
	ld	a, -10 (ix)
	inc	hl
	adc	a, #0x00
	ld	(hl), a
	ld	a, -9 (ix)
	inc	hl
	adc	a, #0x00
	ld	(hl), a
	jr	00114$
00102$:
;./editor.c:124: --s_LineNumber;
	ld	hl, #_s_LineNumber
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;./editor.c:125: crossed = TRUE;
	ld	-18 (ix), #0x01
00114$:
;./editor.c:113: for (u16 i = 0; i < size; ++i)
	inc	de
	jp	00113$
00106$:
;./editor.c:129: from += size;
	ld	de, #0x0000
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, e
	adc	a, -2 (ix)
	ld	-2 (ix), a
	ld	a, d
	adc	a, -1 (ix)
	ld	-1 (ix), a
	jp	00107$
00109$:
;./editor.c:131: s_Cursor = pos;
	ld	de, #_s_Cursor
	ld	hl, #10
	add	hl, sp
	ld	bc, #4
	ldir
;./editor.c:132: if (crossed)
	ld	a, -18 (ix)
	or	a, a
	jr	z, 00115$
;./editor.c:133: s_LineStart = LineStart(s_Cursor);
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_LineStart
	ld	(_s_LineStart), de
	ld	(_s_LineStart + 2), hl
00115$:
;./editor.c:134: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:136: static u32 RowEnd(u32 start)
;	---------------------------------
; Function RowEnd
; ---------------------------------
_RowEnd:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-16
	add	iy, sp
	ld	sp, iy
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	-3 (ix), l
	ld	-2 (ix), h
;./editor.c:138: if (!g_EditorWrap)
	ld	a, (_g_EditorWrap+0)
	or	a, a
	jr	nz, 00102$
;./editor.c:139: return LineEnd(start);
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	call	_LineEnd
	jp	00117$
00102$:
;./editor.c:140: u32 remaining = s_Length - start;
	ld	a, (_g_DocumentLength+0)
	sub	a, -5 (ix)
	ld	c, a
	ld	a, (_g_DocumentLength+1)
	sbc	a, -4 (ix)
	ld	b, a
	ld	a, (_g_DocumentLength+2)
	sbc	a, -3 (ix)
	ld	e, a
	ld	a, (_g_DocumentLength+3)
	sbc	a, -2 (ix)
	ld	d, a
;./editor.c:141: u8 size = remaining > SCR_WIDTH ? SCR_WIDTH : (u8)remaining;
	ld	a, #0x50
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	ld	hl, #0x0000
	sbc	hl, de
	jr	nc, 00119$
	ld	c, #0x50
00119$:
;./editor.c:142: Document_Read(start, s_Scan, size);
	ld	-7 (ix), c
	ld	b, #0x00
	push	bc
	ld	hl, #_s_Scan
	push	hl
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	call	_Document_Read
;./editor.c:143: for (u8 i = 0; i < size; ++i)
	ld	-6 (ix), #0x00
	ld	-1 (ix), #0x00
00112$:
	ld	a, -1 (ix)
	sub	a, -7 (ix)
	jr	nc, 00105$
;./editor.c:144: if (s_Scan[i] == '\n')
	ld	a, #<(_s_Scan)
	add	a, -1 (ix)
	ld	l, a
	ld	a, #>(_s_Scan)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	cp	a, #0x0a
	jr	nz, 00113$
;./editor.c:145: return start + i;
	ld	a, -6 (ix)
	ld	-9 (ix), a
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), a
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -9 (ix)
	ld	h, #0x00
	add	hl, de
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, #0x00
	adc	a, -2 (ix)
	ld	-10 (ix), a
	ld	e, -13 (ix)
	ld	d, -12 (ix)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	jp	00117$
00113$:
;./editor.c:143: for (u8 i = 0; i < size; ++i)
	inc	-1 (ix)
	ld	a, -1 (ix)
	ld	-6 (ix), a
	jr	00112$
00105$:
;./editor.c:146: if (size < SCR_WIDTH)
	ld	a, -7 (ix)
	sub	a, #0x50
	jr	nc, 00107$
;./editor.c:147: return start + size;
	ld	a, -7 (ix)
	ld	-12 (ix), a
	xor	a, a
	ld	-11 (ix), a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -12 (ix)
	ld	h, #0x00
	add	hl, de
	ex	(sp), hl
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	-14 (ix), a
	ld	a, #0x00
	adc	a, -2 (ix)
	ld	-13 (ix), a
	pop	de
	pop	hl
	push	hl
	push	de
	jp	00117$
00107$:
;./editor.c:148: for (u8 i = size; i; --i)
	ld	-6 (ix), #0x50
	ld	-1 (ix), #0x50
00115$:
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00110$
;./editor.c:149: if (s_Scan[i - 1] == ' ')
	ld	l, -1 (ix)
	dec	l
	ld	h, #0x00
	ld	de, #_s_Scan
	add	hl, de
	ld	a, (hl)
	cp	a, #0x20
	jr	nz, 00116$
;./editor.c:150: return start + i;
	ld	a, -6 (ix)
	ld	-9 (ix), a
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), a
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -9 (ix)
	ld	h, #0x00
	add	hl, de
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, #0x00
	adc	a, -2 (ix)
	ld	-10 (ix), a
	ld	e, -13 (ix)
	ld	d, -12 (ix)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	jr	00117$
00116$:
;./editor.c:148: for (u8 i = size; i; --i)
	dec	-1 (ix)
	ld	a, -1 (ix)
	ld	-6 (ix), a
	jr	00115$
00110$:
;./editor.c:151: return start + size;
	ld	de, #0x0050
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, de
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
00117$:
;./editor.c:152: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:154: static bool NextRow(u32 start, u32* next)
;	---------------------------------
; Function NextRow
; ---------------------------------
_NextRow:
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	af
	ld	c, l
	ld	b, h
;./editor.c:156: u32 end = RowEnd(start);
	push	bc
	push	de
	ld	l, c
	ld	h, b
	call	_RowEnd
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
;./editor.c:160: *next = end;
;./editor.c:157: if (g_EditorWrap && (end - start == SCR_WIDTH
	ld	a, (_g_EditorWrap+0)
	or	a, a
	jr	z, 00102$
	ld	a, -4 (ix)
	sub	a, e
	ld	e, a
	ld	a, -3 (ix)
	sbc	a, d
	ld	d, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	sbc	hl, bc
	ld	a, e
	sub	a, #0x50
	or	a, d
	or	a, l
	or	a, h
	jr	z, 00101$
;./editor.c:158: || (end < s_Length && Document_Get(end) != '\n')))
	ld	hl, #_g_DocumentLength
	ld	a, -4 (ix)
	sub	a, (hl)
	ld	a, -3 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -2 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jr	nc, 00102$
	pop	de
	pop	hl
	push	hl
	push	de
	call	_Document_Get
	cp	a, #0x0a
	jr	z, 00102$
00101$:
;./editor.c:160: *next = end;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	hl, #0
	add	hl, sp
	ld	bc, #0x0004
	ldir
;./editor.c:161: return TRUE;
	ld	a, #0x01
	jr	00109$
00102$:
;./editor.c:163: if ((end < s_Length) && (Document_Get(end) == '\n'))
	ld	hl, #_g_DocumentLength
	ld	a, -4 (ix)
	sub	a, (hl)
	ld	a, -3 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -2 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jr	nc, 00107$
	pop	de
	pop	hl
	push	hl
	push	de
	call	_Document_Get
	cp	a, #0x0a
	jr	nz, 00107$
;./editor.c:165: *next = end + 1;
	ld	a, -4 (ix)
	add	a, #0x01
	ld	c, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	inc	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;./editor.c:166: return TRUE;
	ld	a, #0x01
	jr	00109$
00107$:
;./editor.c:168: return FALSE;
	xor	a, a
00109$:
;./editor.c:169: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	jp	(hl)
;./editor.c:171: static u32 PreviousRow(u32 start)
;	---------------------------------
; Function PreviousRow
; ---------------------------------
_PreviousRow:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
;./editor.c:173: if (!start)
	ld	a, b
	or	a, c
	or	a, d
	or	a, e
	jr	nz, 00102$
;./editor.c:174: return 0;
	ld	de, #0x0000
	ld	l, e
	ld	h, e
	jp	00107$
00102$:
;./editor.c:175: u32 pos = LineStart(start - 1);
	ld	a, e
	add	a, #0xff
	ld	-4 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-3 (ix), a
	ld	a, c
	adc	a, #0xff
	ld	-2 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-1 (ix), a
	push	bc
	push	de
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_LineStart
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
;./editor.c:177: while (NextRow(pos, &next) && (next < start))
00104$:
	push	bc
	push	de
	ld	hl, #4
	add	hl, sp
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_NextRow
	pop	de
	pop	bc
	or	a, a
	jr	z, 00106$
	ld	a, -8 (ix)
	sub	a, e
	ld	a, -7 (ix)
	sbc	a, d
	ld	a, -6 (ix)
	sbc	a, c
	ld	a, -5 (ix)
	sbc	a, b
	jr	nc, 00106$
;./editor.c:178: pos = next;
	push	de
	push	bc
	ld	hl, #8
	add	hl, sp
	ex	de, hl
	ld	hl, #4
	add	hl, sp
	ld	bc, #4
	ldir
	pop	bc
	pop	de
	jr	00104$
00106$:
;./editor.c:179: return pos;
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
00107$:
;./editor.c:180: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:183: static void CursorRow(u32* row, u32* start)
;	---------------------------------
; Function CursorRow
; ---------------------------------
_CursorRow:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-15
	add	iy, sp
	ld	sp, iy
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	c, e
	ld	b, d
;./editor.c:185: if (!g_EditorWrap)
	ld	a, (_g_EditorWrap+0)
	or	a, a
	jp	nz, 00109$
;./editor.c:187: *row = s_LineNumber - 1;
	ld	a, (_s_LineNumber+0)
	add	a, #0xff
	ld	-11 (ix), a
	ld	a, (_s_LineNumber+1)
	adc	a, #0xff
	ld	-10 (ix), a
	ld	a, (_s_LineNumber+2)
	adc	a, #0xff
	ld	-9 (ix), a
	ld	a, (_s_LineNumber+3)
	adc	a, #0xff
	ld	-8 (ix), a
	push	bc
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #6
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
;./editor.c:188: *start = s_LineStart;
	ld	l, c
	ld	h, b
	ld	a, (_s_LineStart)
	ld	(hl), a
	inc	hl
	ld	a, (_s_LineStart + 1)
	ld	(hl), a
	inc	hl
	ld	a, (_s_LineStart + 2)
	ld	(hl), a
	inc	hl
	ld	a, (_s_LineStart + 3)
	ld	(hl), a
;./editor.c:189: if (*row < s_TopRow)
	push	bc
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	ld	hl, #_s_TopRow
	ld	a, -15 (ix)
	sub	a, (hl)
	ld	a, -14 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -13 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -12 (ix)
	inc	hl
	sbc	a, (hl)
	jr	nc, 00105$
;./editor.c:191: s_ViewStart = *start;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	(_s_ViewStart+0), a
	ld	a, (hl)
	inc	hl
	ld	(_s_ViewStart+1), a
	ld	a, (hl)
	inc	hl
	ld	(_s_ViewStart+2), a
	ld	a, (hl)
	ld	(_s_ViewStart+3), a
;./editor.c:192: s_TopRow = *row;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	inc	hl
	ld	(_s_TopRow+0), a
	ld	a, (hl)
	inc	hl
	ld	(_s_TopRow+1), a
	ld	a, (hl)
	inc	hl
	ld	(_s_TopRow+2), a
	ld	a, (hl)
	ld	(_s_TopRow+3), a
	jp	00119$
00105$:
;./editor.c:194: else if (*row >= s_TopRow + EDITOR_ROWS)
	ld	a, (_s_TopRow+0)
	add	a, #0x16
	ld	-11 (ix), a
	ld	a, (_s_TopRow+1)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	a, (_s_TopRow+2)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, (_s_TopRow+3)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	a, -15 (ix)
	sub	a, -11 (ix)
	ld	a, -14 (ix)
	sbc	a, -10 (ix)
	ld	a, -13 (ix)
	sbc	a, -9 (ix)
	ld	a, -12 (ix)
	sbc	a, -8 (ix)
	jp	c, 00119$
;./editor.c:196: s_ViewStart = *start;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	(_s_ViewStart+0), a
	ld	a, (hl)
	inc	hl
	ld	(_s_ViewStart+1), a
	ld	a, (hl)
	inc	hl
	ld	(_s_ViewStart+2), a
	ld	a, (hl)
	ld	(_s_ViewStart+3), a
;./editor.c:197: s_TopRow = *row;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	inc	hl
	ld	(_s_TopRow+0), a
	ld	a, (hl)
	inc	hl
	ld	(_s_TopRow+1), a
	ld	a, (hl)
	inc	hl
	ld	(_s_TopRow+2), a
	ld	a, (hl)
	ld	(_s_TopRow+3), a
;./editor.c:198: for (u8 i = 1; i < EDITOR_ROWS; ++i)
	ld	-1 (ix), #0x01
00117$:
	ld	a, -1 (ix)
	sub	a, #0x16
	jp	nc, 00119$
;./editor.c:200: s_ViewStart = LineStart(s_ViewStart - 1);
	ld	a, (_s_ViewStart+0)
	add	a, #0xff
	ld	e, a
	ld	a, (_s_ViewStart+1)
	adc	a, #0xff
	ld	d, a
	ld	a, (_s_ViewStart+2)
	adc	a, #0xff
	ld	c, a
	ld	a, (_s_ViewStart+3)
	adc	a, #0xff
	ld	l, c
	ld	h, a
	call	_LineStart
	ld	(_s_ViewStart), de
	ld	(_s_ViewStart + 2), hl
;./editor.c:201: --s_TopRow;
	ld	hl, #_s_TopRow
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;./editor.c:198: for (u8 i = 1; i < EDITOR_ROWS; ++i)
	inc	-1 (ix)
;./editor.c:204: return;
	jr	00117$
;./editor.c:206: while (s_Cursor < s_ViewStart)
00109$:
	ld	hl, #_s_ViewStart
	ld	a, (_s_Cursor+0)
	sub	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+1)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+2)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+3)
	sbc	a, (hl)
	jr	nc, 00111$
;./editor.c:208: s_ViewStart = PreviousRow(s_ViewStart);
	push	bc
	ld	de, (_s_ViewStart)
	ld	hl, (_s_ViewStart + 2)
	call	_PreviousRow
	pop	bc
	ld	(_s_ViewStart), de
	ld	(_s_ViewStart + 2), hl
;./editor.c:209: --s_TopRow;
	ld	hl, #_s_TopRow
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	jr	00109$
00111$:
;./editor.c:211: *row = s_TopRow;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (_s_TopRow)
	ld	(hl), a
	inc	hl
	ld	a, (_s_TopRow + 1)
	ld	(hl), a
	inc	hl
	ld	a, (_s_TopRow + 2)
	ld	(hl), a
	inc	hl
	ld	a, (_s_TopRow + 3)
	ld	(hl), a
;./editor.c:212: *start = s_ViewStart;
	ld	l, c
	ld	h, b
	ld	a, (_s_ViewStart)
	ld	(hl), a
	inc	hl
	ld	a, (_s_ViewStart + 1)
	ld	(hl), a
	inc	hl
	ld	a, (_s_ViewStart + 2)
	ld	(hl), a
	inc	hl
	ld	a, (_s_ViewStart + 3)
	ld	(hl), a
;./editor.c:214: while (NextRow(*start, &next) && (next <= s_Cursor))
00113$:
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	push	bc
	push	hl
	ld	hl, #12
	add	hl, sp
	ex	(sp), hl
	ld	l, a
	call	_NextRow
	pop	bc
	or	a, a
	jr	z, 00119$
	ld	hl, #_s_Cursor
	ld	a, (hl)
	sub	a, -7 (ix)
	inc	hl
	ld	a, (hl)
	sbc	a, -6 (ix)
	inc	hl
	ld	a, (hl)
	sbc	a, -5 (ix)
	inc	hl
	ld	a, (hl)
	sbc	a, -4 (ix)
	jr	c, 00119$
;./editor.c:216: *start = next;
	push	bc
	ld	e, c
	ld	d, b
	ld	hl, #10
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
;./editor.c:217: ++*row;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	l, (hl)
	add	a, #0x01
	ld	-11 (ix), a
	ld	a, e
	adc	a, #0x00
	ld	-10 (ix), a
	ld	a, d
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, l
	adc	a, #0x00
	ld	-8 (ix), a
	push	bc
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #6
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	jr	00113$
00119$:
;./editor.c:219: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:221: static void PrepareEdit()
;	---------------------------------
; Function PrepareEdit
; ---------------------------------
_PrepareEdit:
;./editor.c:223: while (s_Cursor < s_ViewStart)
00101$:
	ld	hl, #_s_ViewStart
	ld	a, (_s_Cursor+0)
	sub	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+1)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+2)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+3)
	sbc	a, (hl)
	jr	nc, 00106$
;./editor.c:225: s_ViewStart = PreviousRow(s_ViewStart);
	ld	de, (_s_ViewStart)
	ld	hl, (_s_ViewStart + 2)
	call	_PreviousRow
	ld	(_s_ViewStart), de
	ld	(_s_ViewStart + 2), hl
;./editor.c:226: --s_TopRow;
	ld	hl, #_s_TopRow
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	jr	00101$
;./editor.c:229: while (g_EditorWrap && s_ViewStart && (Document_Get(s_ViewStart - 1) != '\n'))
00106$:
	ld	a, (_g_EditorWrap+0)
	or	a, a
	ret	z
	ld	a, (_s_ViewStart+3)
	ld	iy, #_s_ViewStart
	or	a, 2 (iy)
	or	a, 1 (iy)
	or	a, 0 (iy)
	ret	z
	ld	a, (_s_ViewStart+0)
	add	a, #0xff
	ld	e, a
	ld	a, (_s_ViewStart+1)
	adc	a, #0xff
	ld	d, a
	ld	a, (_s_ViewStart+2)
	adc	a, #0xff
	ld	c, a
	ld	a, (_s_ViewStart+3)
	adc	a, #0xff
	ld	l, c
	ld	h, a
	call	_Document_Get
	cp	a, #0x0a
	ret	z
;./editor.c:231: s_ViewStart = PreviousRow(s_ViewStart);
	ld	de, (_s_ViewStart)
	ld	hl, (_s_ViewStart + 2)
	call	_PreviousRow
	ld	(_s_ViewStart), de
	ld	(_s_ViewStart + 2), hl
;./editor.c:232: --s_TopRow;
	ld	hl, #_s_TopRow
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
;./editor.c:234: }
	jr	00106$
;./editor.c:236: void Editor_Invalidate()
;	---------------------------------
; Function Editor_Invalidate
; ---------------------------------
_Editor_Invalidate::
;./editor.c:238: s_ScreenValid = FALSE;
	xor	a, a
	ld	(#_s_ScreenValid), a
;./editor.c:239: }
	ret
;./editor.c:242: static void UploadRow(u8 y)
;	---------------------------------
; Function UploadRow
; ---------------------------------
_UploadRow:
	call	___sdcc_enter_ix
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
;./editor.c:244: c8* old = &s_Screen[(u16)(y - 1) * SCR_WIDTH];
	ld	-6 (ix), a
	ld	c, a
	ld	b, #0x00
	dec	bc
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, #<(_s_Screen)
	add	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, #>(_s_Screen)
	adc	a, -1 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-3 (ix), a
	ld	a, -7 (ix)
	ld	-2 (ix), a
;./editor.c:245: u8 first = 0;
	ld	-1 (ix), #0x00
;./editor.c:246: u8 last = SCR_WIDTH;
	ld	-7 (ix), #0x50
;./editor.c:247: if (s_ScreenValid)
	ld	a, (_s_ScreenValid+0)
	or	a, a
	jp	z, 00110$
;./editor.c:250: const c8* after = s_Row;
	ld	-8 (ix), #<(_s_Row)
	ld	-7 (ix), #>(_s_Row)
;./editor.c:251: while ((first < last) && (*before == *after))
	ld	-1 (ix), #0x00
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
00102$:
	ld	a, -1 (ix)
	sub	a, #0x50
	jr	nc, 00139$
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	sub	a, -9 (ix)
	jr	nz, 00139$
;./editor.c:253: ++first;
	inc	-1 (ix)
;./editor.c:254: ++before;
	inc	-5 (ix)
	jr	nz, 00204$
	inc	-4 (ix)
00204$:
;./editor.c:255: ++after;
	inc	-8 (ix)
	jr	nz, 00102$
	inc	-7 (ix)
	jr	00102$
00139$:
;./editor.c:257: before = old + last;
	ld	de, #0x0050
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
;./editor.c:258: after = s_Row + last;
	ld	-5 (ix), #<((_s_Row + 80))
	ld	-4 (ix), #>((_s_Row + 80))
;./editor.c:259: while ((last > first) && (before[-1] == after[-1]))
	ld	c, #0x50
00106$:
	ld	a, -1 (ix)
	sub	a, c
	jr	nc, 00140$
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	dec	hl
	ld	a, (hl)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	dec	hl
	sub	a, (hl)
	jr	nz, 00140$
;./editor.c:261: --last;
	dec	c
;./editor.c:262: --before;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	dec	hl
	ld	-8 (ix), l
	ld	-7 (ix), h
;./editor.c:263: --after;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	dec	hl
	ld	-5 (ix), l
	ld	-4 (ix), h
	jr	00106$
00140$:
	ld	-7 (ix), c
00110$:
;./editor.c:266: if (first != last)
	ld	a, -1 (ix)
	sub	a, -7 (ix)
	jr	z, 00117$
;./editor.c:268: Scr_Locate(first, y);
	ld	l, -6 (ix)
	ld	a, -1 (ix)
	call	_Scr_Locate
;./editor.c:269: Scr_Write(&s_Row[first], last - first);
	ld	l, -7 (ix)
	ld	h, #0x00
	ld	c, -1 (ix)
	ld	b, #0x00
	cp	a, a
	sbc	hl, bc
	ex	de, hl
	ld	bc, #_s_Row+0
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	push	hl
	ld	l, c
	ld	h, b
	call	_Scr_Write
	pop	hl
;./editor.c:270: c8* dest = old + first;
	ld	a, -3 (ix)
	add	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;./editor.c:271: const c8* src = s_Row + first;
	ld	-3 (ix), l
	ld	-2 (ix), h
;./editor.c:272: for (u8 i = first; i < last; ++i)
00115$:
	ld	a, -1 (ix)
	sub	a, -7 (ix)
	jr	nc, 00117$
;./editor.c:273: *dest++ = *src++;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	inc	-3 (ix)
	jr	nz, 00209$
	inc	-2 (ix)
00209$:
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), a
	inc	-5 (ix)
	jr	nz, 00210$
	inc	-4 (ix)
00210$:
;./editor.c:272: for (u8 i = first; i < last; ++i)
	inc	-1 (ix)
	jr	00115$
00117$:
;./editor.c:275: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:277: static void PutStatus(u8 x, const c8* text)
;	---------------------------------
; Function PutStatus
; ---------------------------------
_PutStatus:
	ld	c, a
;./editor.c:279: while (*text)
00101$:
	ld	a, (de)
	ld	b, a
	or	a, a
	ret	z
;./editor.c:280: s_Row[x++] = *text++;
	ld	a, #<(_s_Row)
	add	a, c
	ld	l, a
	ld	a, #>(_s_Row)
	adc	a, #0x00
	inc	c
	inc	de
	ld	h, a
	ld	(hl), b
;./editor.c:281: }
	jr	00101$
;./editor.c:283: static void PutNumber(u8 x, u32 value)
;	---------------------------------
; Function PutNumber
; ---------------------------------
_PutNumber:
	call	___sdcc_enter_ix
	dec	sp
	ld	c, a
;./editor.c:286: if (value > 9999)
	ld	a, #0x0f
	cp	a, 4 (ix)
	ld	a, #0x27
	sbc	a, 5 (ix)
	ld	a, #0x00
	sbc	a, 6 (ix)
	ld	a, #0x00
	sbc	a, 7 (ix)
	jr	nc, 00102$
;./editor.c:288: PutStatus(x, "####");
	ld	de, #___str_1
	ld	a, c
	call	_PutStatus
;./editor.c:289: return;
	jr	00110$
00102$:
;./editor.c:292: u16 remaining = (u16)value;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
;./editor.c:293: for (u8 i = 0; i < 4; ++i)
	ld	b, #0x00
00108$:
	ld	a, b
	sub	a, #0x04
	jr	nc, 00110$
;./editor.c:296: while (remaining >= places[i])
	ld	-1 (ix), #0x30
00103$:
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	push	de
	ld	de, #_PutNumber_places_10001_1181
	add	hl, de
	pop	de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	c, 00105$
;./editor.c:298: remaining -= places[i];
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
;./editor.c:299: ++digit;
	inc	-1 (ix)
	jr	00103$
00105$:
;./editor.c:301: s_Row[x++] = digit;
	ld	a, c
	add	a, #<(_s_Row)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_s_Row)
	inc	c
	ld	h, a
	ld	a, -1 (ix)
	ld	(hl), a
;./editor.c:293: for (u8 i = 0; i < 4; ++i)
	inc	b
	jr	00108$
00110$:
;./editor.c:303: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
_PutNumber_places_10001_1181:
	.dw #0x03e8
	.dw #0x0064
	.dw #0x000a
	.dw #0x0001
___str_1:
	.ascii "####"
	.db 0x00
;./editor.c:305: static void ClearRow()
;	---------------------------------
; Function ClearRow
; ---------------------------------
_ClearRow:
;./editor.c:307: c8* dest = s_Row;
	ld	bc, #_s_Row+0
;./editor.c:308: for (u8 i = 0; i < SCR_WIDTH; ++i)
	ld	e, #0x00
00103$:
	ld	a, e
	sub	a, #0x50
	ret	nc
;./editor.c:309: *dest++ = ' ';
	ld	a, #0x20
	ld	(bc), a
	inc	bc
;./editor.c:308: for (u8 i = 0; i < SCR_WIDTH; ++i)
	inc	e
;./editor.c:310: }
	jr	00103$
;./editor.c:312: static void DrawTextRow(u8 y, u32 pos, bool hasRow)
;	---------------------------------
; Function DrawTextRow
; ---------------------------------
_DrawTextRow:
	call	___sdcc_enter_ix
	push	af
	dec	sp
	ld	-1 (ix), a
;./editor.c:314: ClearRow();
	call	_ClearRow
;./editor.c:315: if (hasRow)
	ld	a, 8 (ix)
	or	a, a
	jp	z, 00106$
;./editor.c:317: u32 end = RowEnd(pos);
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	call	_RowEnd
;./editor.c:318: if (end - pos > s_LeftCol)
	ld	a, e
	sub	a, 4 (ix)
	ld	c, a
	ld	a, d
	sbc	a, 5 (ix)
	ld	b, a
	ld	a, l
	sbc	a, 6 (ix)
	ld	e, a
	ld	a, h
	sbc	a, 7 (ix)
	ld	d, a
	ld	hl, #_s_LeftCol
	ld	a, (hl)
	inc	hl
	sub	a, c
	ld	a, (hl)
	inc	hl
	sbc	a, b
	ld	a, (hl)
	inc	hl
	sbc	a, e
	ld	a, (hl)
	sbc	a, d
	jr	nc, 00106$
;./editor.c:320: u32 size = end - pos - s_LeftCol;
	ld	hl, #_s_LeftCol
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	sbc	a, (hl)
	inc	hl
	ld	b, a
	ld	a, e
	sbc	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	sbc	a, (hl)
	ld	d, a
;./editor.c:321: if (size > SCR_WIDTH)
	ld	a, #0x50
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	ld	hl, #0x0000
	sbc	hl, de
	jr	nc, 00102$
;./editor.c:322: size = SCR_WIDTH;
	ld	bc, #0x0050
00102$:
;./editor.c:323: Document_Read(pos + s_LeftCol, s_Row, (u16)size);
	pop	hl
	push	bc
	ld	a, 4 (ix)
	ld	hl, #_s_LeftCol
	add	a, (hl)
	ld	e, a
	ld	a, 5 (ix)
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	a, 6 (ix)
	inc	hl
	adc	a, (hl)
	ld	c, a
	ld	a, 7 (ix)
	inc	hl
	adc	a, (hl)
	ld	b, a
	pop	hl
	push	hl
	push	hl
	ld	hl, #_s_Row
	push	hl
	ld	l, c
	ld	h, b
	call	_Document_Read
00106$:
;./editor.c:326: UploadRow(y);
	ld	a, -1 (ix)
	call	_UploadRow
;./editor.c:327: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	inc	sp
	jp	(hl)
;./editor.c:329: void Editor_Init()
;	---------------------------------
; Function Editor_Init
; ---------------------------------
_Editor_Init::
;./editor.c:331: Document_Reset();
	call	_Document_Reset
;./editor.c:332: s_Cursor = s_LineStart = s_ViewStart = s_TopRow = s_LeftCol = s_GoalCol = 0;
	xor	a, a
	ld	(_s_GoalCol+0), a
	ld	(_s_GoalCol+1), a
	ld	(_s_GoalCol+2), a
	ld	(_s_GoalCol+3), a
	xor	a, a
	ld	(_s_LeftCol+0), a
	ld	(_s_LeftCol+1), a
	ld	(_s_LeftCol+2), a
	ld	(_s_LeftCol+3), a
	xor	a, a
	ld	(_s_TopRow+0), a
	ld	(_s_TopRow+1), a
	ld	(_s_TopRow+2), a
	ld	(_s_TopRow+3), a
	xor	a, a
	ld	(_s_ViewStart+0), a
	ld	(_s_ViewStart+1), a
	ld	(_s_ViewStart+2), a
	ld	(_s_ViewStart+3), a
	xor	a, a
	ld	(_s_LineStart+0), a
	ld	(_s_LineStart+1), a
	ld	(_s_LineStart+2), a
	ld	(_s_LineStart+3), a
	xor	a, a
	ld	(_s_Cursor+0), a
	ld	(_s_Cursor+1), a
	ld	(_s_Cursor+2), a
	ld	(_s_Cursor+3), a
;./editor.c:333: s_LineNumber = 1;
	ld	hl, #_s_LineNumber
	ld	(hl), #0x01
	xor	a, a
	ld	(_s_LineNumber+1), a
	ld	(_s_LineNumber+2), a
	ld	(_s_LineNumber+3), a
;./editor.c:334: s_VerticalMove = FALSE;
;./editor.c:335: g_EditorModified = FALSE;
	xor	a, a
	ld	(#_s_VerticalMove), a
	ld	(#_g_EditorModified), a
;./editor.c:336: g_EditorInsert = TRUE;
	ld	hl, #_g_EditorInsert
	ld	(hl), #0x01
;./editor.c:337: g_EditorWrap = FALSE;
;./editor.c:338: s_TextDirty = s_DirtyFollowing = FALSE;
	xor	a, a
	ld	(#_g_EditorWrap), a
	ld	(#_s_DirtyFollowing), a
;./editor.c:339: s_LastEnd = s_NextEnd = 0;
	xor	a, a
	ld	(#_s_TextDirty), a
	ld	(#_s_NextEnd), a
	xor	a, a
	ld	(#_s_LastEnd), a
;./editor.c:340: for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x18
	jp	nc, _Editor_Invalidate
;./editor.c:341: s_EndValid[i] = FALSE;
	ld	hl, #_s_EndValid
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;./editor.c:340: for (u8 i = 0; i < LINE_CACHE_SIZE; ++i)
	inc	c
;./editor.c:342: Editor_Invalidate();
;./editor.c:343: }
	jr	00103$
;./editor.c:345: void Editor_ToggleWrap()
;	---------------------------------
; Function Editor_ToggleWrap
; ---------------------------------
_Editor_ToggleWrap::
;./editor.c:347: g_EditorWrap = !g_EditorWrap;
	ld	a, (_g_EditorWrap+0)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(#_g_EditorWrap), a
;./editor.c:348: s_ViewStart = s_TopRow = 0;
	xor	a, a
	ld	(_s_TopRow+0), a
	ld	(_s_TopRow+1), a
	ld	(_s_TopRow+2), a
	ld	(_s_TopRow+3), a
	xor	a, a
	ld	(_s_ViewStart+0), a
	ld	(_s_ViewStart+1), a
	ld	(_s_ViewStart+2), a
	ld	(_s_ViewStart+3), a
;./editor.c:349: s_VerticalMove = FALSE;
	xor	a, a
	ld	(#_s_VerticalMove), a
;./editor.c:350: Editor_Invalidate();
;./editor.c:351: }
	jp	_Editor_Invalidate
;./editor.c:353: void Editor_DrawStatus()
;	---------------------------------
; Function Editor_DrawStatus
; ---------------------------------
_Editor_DrawStatus::
	call	___sdcc_enter_ix
	push	af
	push	af
;./editor.c:355: ClearRow();
	call	_ClearRow
;./editor.c:356: s_Row[0] = ASCII_LEFT;
	ld	bc, #_s_Row+0
	ld	a, #0x1d
	ld	(bc), a
;./editor.c:357: s_Row[2] = g_EditorModified ? '*' : ' ';
	ld	a, (_g_EditorModified+0)
	or	a, a
	ld	a, #0x2a
	jr	nz, 00106$
	ld	a, #0x20
00106$:
	ld	(#(_s_Row + 2)), a
;./editor.c:358: PutStatus(4, "Line=");
	push	bc
	ld	de, #___str_2
	ld	a, #0x04
	call	_PutStatus
;./editor.c:359: PutNumber(9, s_LineNumber);
	ld	hl, (_s_LineNumber + 2)
	push	hl
	ld	hl, (_s_LineNumber)
	push	hl
	ld	a, #0x09
	call	_PutNumber
;./editor.c:360: PutStatus(16, "Col=");
	ld	de, #___str_3
	ld	a, #0x10
	call	_PutStatus
	pop	bc
;./editor.c:361: PutNumber(20, s_Cursor - s_LineStart + 1);
	ld	hl, #_s_LineStart
	ld	a, (_s_Cursor+0)
	sub	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (_s_Cursor+1)
	sbc	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (_s_Cursor+2)
	sbc	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (_s_Cursor+3)
	sbc	a, (hl)
	ld	-1 (ix), a
	ld	a, -4 (ix)
	add	a, #0x01
	ld	e, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	l, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	h, a
	push	bc
	push	hl
	push	de
	ld	a, #0x14
	call	_PutNumber
;./editor.c:362: PutStatus((SCR_WIDTH - 8) / 2, "untitled");
	ld	de, #___str_4
	ld	a, #0x24
	call	_PutStatus
	pop	bc
;./editor.c:363: PutStatus(65, g_EditorInsert ? "Insert" : "Over");
	ld	a, (_g_EditorInsert+0)
	or	a, a
	jr	z, 00107$
	ld	de, #___str_5+0
	jr	00108$
00107$:
	ld	de, #___str_6+0
00108$:
	push	bc
	ld	a, #0x41
	call	_PutStatus
	pop	bc
;./editor.c:364: PutStatus(72, g_EditorWrap ? "WW=On" : "WW=Off");
	ld	a, (_g_EditorWrap+0)
	or	a, a
	jr	z, 00109$
	ld	de, #___str_7+0
	jr	00110$
00109$:
	ld	de, #___str_8+0
00110$:
	push	bc
	ld	a, #0x48
	call	_PutStatus
	pop	bc
;./editor.c:365: s_Row[SCR_WIDTH - 1] = ASCII_RIGHT;
	ld	hl, #(_s_Row + 79)
	ld	(hl), #0x1c
;./editor.c:366: UploadRow(SCR_HEIGHT - 1);
	ld	a, #0x17
	call	_UploadRow
;./editor.c:367: if (!s_ScreenValid)
	ld	a, (_s_ScreenValid+0)
	or	a, a
	jr	nz, 00103$
;./editor.c:368: Scr_SetBlink(0, SCR_HEIGHT - 1, SCR_WIDTH, TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #0x0050
	push	hl
	ld	l, #0x17
	xor	a, a
	call	_Scr_SetBlink
00103$:
;./editor.c:369: }
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "Line="
	.db 0x00
___str_3:
	.ascii "Col="
	.db 0x00
___str_4:
	.ascii "untitled"
	.db 0x00
___str_5:
	.ascii "Insert"
	.db 0x00
___str_6:
	.ascii "Over"
	.db 0x00
___str_7:
	.ascii "WW=On"
	.db 0x00
___str_8:
	.ascii "WW=Off"
	.db 0x00
;./editor.c:371: void Editor_Draw()
;	---------------------------------
; Function Editor_Draw
; ---------------------------------
_Editor_Draw::
	call	___sdcc_enter_ix
	ld	hl, #-21
	add	hl, sp
	ld	sp, hl
;./editor.c:373: Document_Begin();
	call	_Document_Begin
;./editor.c:375: CursorRow(&row, &start);
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	hl, #0
	add	hl, sp
	call	_CursorRow
;./editor.c:376: u32 col = s_Cursor - start;
	ld	a, (_s_Cursor+0)
	sub	a, -17 (ix)
	ld	-9 (ix), a
	ld	a, (_s_Cursor+1)
	sbc	a, -16 (ix)
	ld	-8 (ix), a
	ld	a, (_s_Cursor+2)
	sbc	a, -15 (ix)
	ld	-7 (ix), a
	ld	a, (_s_Cursor+3)
	sbc	a, -14 (ix)
	ld	-6 (ix), a
;./editor.c:377: while (row >= s_TopRow + EDITOR_ROWS)
00101$:
	ld	a, (_s_TopRow+0)
	add	a, #0x16
	ld	c, a
	ld	a, (_s_TopRow+1)
	adc	a, #0x00
	ld	b, a
	ld	a, (_s_TopRow+2)
	adc	a, #0x00
	ld	e, a
	ld	a, (_s_TopRow+3)
	adc	a, #0x00
	ld	d, a
	ld	a, -21 (ix)
	sub	a, c
	ld	a, -20 (ix)
	sbc	a, b
	ld	a, -19 (ix)
	sbc	a, e
	ld	a, -18 (ix)
	sbc	a, d
	jr	c, 00103$
;./editor.c:379: NextRow(s_ViewStart, &next);
	ld	hl, #8
	add	hl, sp
	push	hl
	ld	de, (_s_ViewStart)
	ld	hl, (_s_ViewStart + 2)
	call	_NextRow
;./editor.c:380: s_ViewStart = next;
	ld	de, #_s_ViewStart
	ld	hl, #8
	add	hl, sp
	ld	bc, #4
	ldir
;./editor.c:381: ++s_TopRow;
	ld	iy, #_s_TopRow
	inc	0 (iy)
	jr	nz, 00101$
	inc	1 (iy)
	jr	nz, 00101$
	inc	2 (iy)
	jr	nz, 00101$
	inc	3 (iy)
	jr	00101$
00103$:
;./editor.c:383: if (g_EditorWrap)
	ld	a, (_g_EditorWrap+0)
	or	a, a
	jr	z, 00110$
;./editor.c:384: s_LeftCol = 0;
	xor	a, a
	ld	(_s_LeftCol+0), a
	ld	(_s_LeftCol+1), a
	ld	(_s_LeftCol+2), a
	ld	(_s_LeftCol+3), a
	jr	00111$
00110$:
;./editor.c:385: else if (col < s_LeftCol)
	ld	hl, #_s_LeftCol
	ld	a, -9 (ix)
	sub	a, (hl)
	ld	a, -8 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -7 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -6 (ix)
	inc	hl
	sbc	a, (hl)
	jr	nc, 00107$
;./editor.c:386: s_LeftCol = col;
	ld	de, #_s_LeftCol
	ld	hl, #12
	add	hl, sp
	ld	bc, #4
	ldir
	jr	00111$
00107$:
;./editor.c:387: else if (col >= s_LeftCol + SCR_WIDTH)
	ld	a, (_s_LeftCol+0)
	add	a, #0x50
	ld	c, a
	ld	a, (_s_LeftCol+1)
	adc	a, #0x00
	ld	b, a
	ld	a, (_s_LeftCol+2)
	adc	a, #0x00
	ld	e, a
	ld	a, (_s_LeftCol+3)
	adc	a, #0x00
	ld	d, a
	ld	a, -9 (ix)
	sub	a, c
	ld	a, -8 (ix)
	sbc	a, b
	ld	a, -7 (ix)
	sbc	a, e
	ld	a, -6 (ix)
	sbc	a, d
	jr	c, 00111$
;./editor.c:388: s_LeftCol = col - SCR_WIDTH + 1;
	ld	a, -9 (ix)
	ld	hl, #_s_LeftCol
	add	a, #0xb1
	ld	(hl), a
	ld	a, -8 (ix)
	inc	hl
	adc	a, #0xff
	ld	(hl), a
	ld	a, -7 (ix)
	inc	hl
	adc	a, #0xff
	ld	(hl), a
	ld	a, -6 (ix)
	inc	hl
	adc	a, #0xff
	ld	(hl), a
00111$:
;./editor.c:390: bool all = !s_ScreenValid || (s_PaintedView != s_ViewStart) || (s_PaintedLeft != s_LeftCol);
	ld	a, (_s_ScreenValid+0)
	or	a, a
	jr	z, 00151$
	ld	a, (_s_PaintedView)
	ld	iy, #_s_ViewStart
	sub	a, 0 (iy)
	jr	nz, 00151$
	ld	a, (_s_PaintedView + 1)
	sub	a, 1 (iy)
	jr	nz, 00151$
	ld	a, (_s_PaintedView + 2)
	sub	a, 2 (iy)
	jr	nz, 00151$
	ld	a, (_s_PaintedView + 3)
	sub	a, 3 (iy)
	jr	nz, 00151$
	ld	a, (_s_PaintedLeft)
	ld	iy, #_s_LeftCol
	sub	a, 0 (iy)
	jr	nz, 00151$
	ld	a, (_s_PaintedLeft + 1)
	sub	a, 1 (iy)
	jr	nz, 00151$
	ld	a, (_s_PaintedLeft + 2)
	sub	a, 2 (iy)
	jr	nz, 00151$
	ld	a, (_s_PaintedLeft + 3)
	sub	a, 3 (iy)
	ld	c, #0x00
	jr	z, 00152$
00151$:
	ld	c, #0x01
00152$:
;./editor.c:391: if (!all && s_TextDirty && !s_DirtyFollowing)
	ld	a, c
	or	a, a
	jr	nz, 00131$
	ld	a, (_s_TextDirty+0)
	or	a, a
	jr	z, 00131$
	ld	a, (_s_DirtyFollowing+0)
	or	a, a
	jr	nz, 00131$
;./editor.c:394: u32 dirtyRow = s_DirtyLine - 1 - s_TopRow;
	ld	a, (_s_DirtyLine+0)
	add	a, #0xff
	ld	c, a
	ld	a, (_s_DirtyLine+1)
	adc	a, #0xff
	ld	b, a
	ld	a, (_s_DirtyLine+2)
	adc	a, #0xff
	ld	e, a
	ld	a, (_s_DirtyLine+3)
	adc	a, #0xff
	ld	d, a
	ld	hl, #_s_TopRow
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	sbc	a, (hl)
	inc	hl
	ld	b, a
	ld	a, e
	sbc	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	sbc	a, (hl)
	ld	d, a
;./editor.c:395: if (dirtyRow < EDITOR_ROWS)
	ld	a, c
	sub	a, #0x16
	ld	a, b
	sbc	a, #0x00
	ld	a, e
	sbc	a, #0x00
	ld	a, d
	sbc	a, #0x00
	jp	nc, 00132$
;./editor.c:396: DrawTextRow((u8)dirtyRow + 1, s_DirtyStart, TRUE);
	inc	c
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, (_s_DirtyStart + 2)
	push	hl
	ld	hl, (_s_DirtyStart)
	push	hl
	ld	a, c
	call	_DrawTextRow
	jp	00132$
00131$:
;./editor.c:398: else if (all || s_TextDirty)
	ld	a, c
	or	a, a
	jr	nz, 00127$
	ld	a, (_s_TextDirty+0)
	or	a, a
	jp	z, 00132$
00127$:
;./editor.c:400: u32 pos = s_ViewStart;
	push	bc
	ld	hl, #18
	add	hl, sp
	ex	de, hl
	ld	hl, #_s_ViewStart
	ld	bc, #4
	ldir
	pop	bc
;./editor.c:401: bool hasRow = TRUE;
	ld	-1 (ix), #0x01
;./editor.c:402: u8 paintedRows = 0;
	ld	e, #0x00
;./editor.c:403: for (u8 y = 1; y <= EDITOR_ROWS; ++y)
	ld	b, #0x01
00146$:
	ld	a, #0x16
	sub	a, b
	jp	c, 00126$
;./editor.c:405: if (hasRow)
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00118$
;./editor.c:406: paintedRows = y;
	ld	e, b
	jr	00119$
00118$:
;./editor.c:407: else if (s_ScreenValid && (y > s_PaintedRows))
	ld	a, (_s_ScreenValid+0)
	or	a, a
	jr	z, 00119$
	ld	a, (_s_PaintedRows+0)
	sub	a, b
	jp	c, 00126$
;./editor.c:408: break;
00119$:
;./editor.c:409: bool draw = all || s_DirtyFollowing || (pos == s_DirtyStart);
	ld	a, c
	or	a, a
	jr	nz, 00157$
	ld	a, (_s_DirtyFollowing+0)
	or	a, a
	jr	nz, 00157$
	ld	a, -5 (ix)
	ld	iy, #_s_DirtyStart
	sub	a, 0 (iy)
	jr	nz, 00384$
	ld	a, -4 (ix)
	sub	a, 1 (iy)
	jr	nz, 00384$
	ld	a, -3 (ix)
	sub	a, 2 (iy)
	jr	nz, 00384$
	ld	a, -2 (ix)
	sub	a, 3 (iy)
	jr	z, 00157$
00384$:
	xor	a, a
	jr	00158$
00157$:
	ld	a, #0x01
00158$:
;./editor.c:410: if (draw)
	or	a, a
	jr	z, 00121$
;./editor.c:411: DrawTextRow(y, pos, hasRow);
	push	bc
	push	de
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	ld	a, b
	call	_DrawTextRow
	pop	de
	pop	bc
00121$:
;./editor.c:412: if (hasRow)
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00147$
;./editor.c:414: hasRow = NextRow(pos, &next);
	push	bc
	push	de
	ld	hl, #12
	add	hl, sp
	push	hl
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	call	_NextRow
	ld	-1 (ix), a
	pop	de
	pop	bc
;./editor.c:415: if (hasRow)
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00147$
;./editor.c:416: pos = next;
	push	de
	push	bc
	ld	hl, #20
	add	hl, sp
	ex	de, hl
	ld	hl, #12
	add	hl, sp
	ld	bc, #4
	ldir
	pop	bc
	pop	de
00147$:
;./editor.c:403: for (u8 y = 1; y <= EDITOR_ROWS; ++y)
	inc	b
	jp	00146$
00126$:
;./editor.c:419: s_PaintedRows = paintedRows;
	ld	hl, #_s_PaintedRows
	ld	(hl), e
00132$:
;./editor.c:421: u8 x = col - s_LeftCol;
	ld	a, -9 (ix)
	ld	hl, (_s_LeftCol)
	sub	a, l
	ld	b, a
;./editor.c:422: u8 y = row - s_TopRow + 1;
	ld	a, -21 (ix)
	ld	hl, (_s_TopRow)
	sub	a, l
	ld	c, a
	inc	c
;./editor.c:423: if (!s_ScreenValid)
	ld	a, (_s_ScreenValid+0)
	or	a, a
	jr	nz, 00139$
;./editor.c:424: Scr_SetBlink(0, 1, SCR_WIDTH * EDITOR_ROWS, FALSE);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x06e0
	push	hl
	ld	l, #0x01
	xor	a, a
	call	_Scr_SetBlink
	pop	bc
	jr	00140$
00139$:
;./editor.c:425: else if ((x != s_CursorX) || (y != s_CursorY))
	ld	a, (_s_CursorX)
	sub	a, b
	jr	nz, 00135$
	ld	a, (_s_CursorY)
	sub	a, c
	jr	z, 00140$
00135$:
;./editor.c:426: Scr_SetBlink(s_CursorX, s_CursorY, 1, FALSE);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x0001
	push	hl
	ld	a, (_s_CursorY)
	ld	l, a
	ld	a, (_s_CursorX)
	call	_Scr_SetBlink
	pop	bc
00140$:
;./editor.c:427: if (!s_ScreenValid || (x != s_CursorX) || (y != s_CursorY))
	ld	a, (_s_ScreenValid+0)
	or	a, a
	jr	z, 00141$
	ld	a, (_s_CursorX)
	sub	a, b
	jr	nz, 00141$
	ld	a, (_s_CursorY)
	sub	a, c
	jr	z, 00142$
00141$:
;./editor.c:428: Scr_SetBlink(x, y, 1, TRUE);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #0x0001
	push	hl
	ld	l, c
	ld	a, b
	call	_Scr_SetBlink
	pop	bc
00142$:
;./editor.c:429: s_CursorX = x;
	ld	hl, #_s_CursorX
	ld	(hl), b
;./editor.c:430: s_CursorY = y;
	ld	hl, #_s_CursorY
	ld	(hl), c
;./editor.c:431: Editor_DrawStatus();
	call	_Editor_DrawStatus
;./editor.c:432: s_ScreenValid = TRUE;
	ld	hl, #_s_ScreenValid
	ld	(hl), #0x01
;./editor.c:433: s_PaintedView = s_ViewStart;
	ld	de, #_s_PaintedView
	ld	hl, #_s_ViewStart
	ld	bc, #4
	ldir
;./editor.c:434: s_PaintedLeft = s_LeftCol;
	ld	de, #_s_PaintedLeft
	ld	hl, #_s_LeftCol
	ld	bc, #4
	ldir
;./editor.c:435: s_TextDirty = s_DirtyFollowing = FALSE;
	xor	a, a
	ld	(#_s_DirtyFollowing), a
	ld	(#_s_TextDirty), a
;./editor.c:436: Document_End();
	call	_Document_End
;./editor.c:437: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:439: static void MarkChanged(bool newline)
;	---------------------------------
; Function MarkChanged
; ---------------------------------
_MarkChanged:
	ld	c, a
;./editor.c:441: if (s_TextDirty && (s_LineStart != s_DirtyStart))
	ld	a, (_s_TextDirty+0)
	or	a, a
	jr	z, 00102$
	ld	a, (_s_LineStart)
	ld	iy, #_s_DirtyStart
	sub	a, 0 (iy)
	jr	nz, 00152$
	ld	a, (_s_LineStart + 1)
	sub	a, 1 (iy)
	jr	nz, 00152$
	ld	a, (_s_LineStart + 2)
	sub	a, 2 (iy)
	jr	nz, 00152$
	ld	a, (_s_LineStart + 3)
	sub	a, 3 (iy)
	jr	z, 00102$
00152$:
;./editor.c:442: s_DirtyFollowing = TRUE;
	ld	hl, #_s_DirtyFollowing
	ld	(hl), #0x01
00102$:
;./editor.c:443: if (!s_TextDirty || (s_LineStart < s_DirtyStart))
	ld	a, (_s_TextDirty+0)
	or	a, a
	jr	z, 00104$
	ld	hl, #_s_DirtyStart
	ld	a, (_s_LineStart+0)
	sub	a, (hl)
	inc	hl
	ld	a, (_s_LineStart+1)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_LineStart+2)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_LineStart+3)
	sbc	a, (hl)
	jr	nc, 00105$
00104$:
;./editor.c:445: s_DirtyStart = s_LineStart;
	push	bc
	ld	de, #_s_DirtyStart
	ld	hl, #_s_LineStart
	ld	bc, #4
	ldir
;./editor.c:446: s_DirtyLine = s_LineNumber;
	ld	de, #_s_DirtyLine
	ld	hl, #_s_LineNumber
	ld	bc, #4
	ldir
	pop	bc
00105$:
;./editor.c:448: s_TextDirty = TRUE;
	ld	hl, #_s_TextDirty
	ld	(hl), #0x01
;./editor.c:449: s_DirtyFollowing |= newline || g_EditorWrap;
	ld	a, c
	or	a, a
	jr	nz, 00110$
	ld	a, (_g_EditorWrap+0)
	or	a, a
	jr	nz, 00110$
	ld	c, a
	jr	00111$
00110$:
	ld	c, #0x01
00111$:
	ld	a, (_s_DirtyFollowing+0)
	or	a, c
	ld	(_s_DirtyFollowing+0), a
;./editor.c:450: }
	ret
;./editor.c:452: static bool Insert(u8 chr, u16 count)
;	---------------------------------
; Function Insert
; ---------------------------------
_Insert:
	call	___sdcc_enter_ix
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
	ld	c, e
	ld	b, d
;./editor.c:454: if (count > g_DocumentCapacity - s_Length)
	ld	hl, #_g_DocumentLength
	ld	a, (_g_DocumentCapacity+0)
	sub	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (_g_DocumentCapacity+1)
	sbc	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (_g_DocumentCapacity+2)
	sbc	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (_g_DocumentCapacity+3)
	sbc	a, (hl)
	ld	-6 (ix), a
	ld	-5 (ix), c
	ld	-4 (ix), b
	xor	a, a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	a, -9 (ix)
	sub	a, -5 (ix)
	ld	a, -8 (ix)
	sbc	a, -4 (ix)
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	a, -6 (ix)
	sbc	a, -2 (ix)
	jr	nc, 00102$
;./editor.c:455: return FALSE;
	xor	a, a
	jp	00107$
00102$:
;./editor.c:456: PrepareEdit();
	push	bc
	call	_PrepareEdit
	pop	bc
;./editor.c:457: if (!Document_Insert(s_Cursor, chr, count))
	push	bc
	push	bc
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_Document_Insert
	pop	bc
;./editor.c:458: return FALSE;
	or	a,a
	jr	z, 00107$
;./editor.c:459: UpdateLineCache(s_Cursor, count, TRUE, chr == '\n');
	ld	a, -1 (ix)
	sub	a, #0x0a
	ld	a, #0x01
	jr	z, 00134$
	xor	a, a
00134$:
	ld	d, a
	push	de
	ld	e, #0x01
	push	de
	push	bc
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_UpdateLineCache
	pop	de
;./editor.c:460: MarkChanged(chr == '\n');
	push	de
	ld	a, d
	call	_MarkChanged
	pop	de
;./editor.c:461: s_Cursor += count;
	ld	hl, #_s_Cursor
	ld	a, (hl)
	add	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, -3 (ix)
	ld	(hl), a
	jr	nc, 00135$
	inc	hl
	inc	(hl)
00135$:
;./editor.c:462: if (chr == '\n')
	ld	a, d
	or	a, a
	jr	z, 00106$
;./editor.c:464: s_LineNumber += count;
	ld	a, -5 (ix)
	ld	hl, #_s_LineNumber
	add	a, (hl)
	ld	(hl), a
	ld	a, -4 (ix)
	inc	hl
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, #0x00
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, #0x00
	adc	a, (hl)
	ld	(hl), a
;./editor.c:465: s_LineStart = s_Cursor;
	ld	de, #_s_LineStart
	ld	hl, #_s_Cursor
	ld	bc, #4
	ldir
00106$:
;./editor.c:467: g_EditorModified = TRUE;
	ld	hl, #_g_EditorModified
;./editor.c:468: return TRUE;
	ld	a,#0x01
	ld	(hl),a
00107$:
;./editor.c:469: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:471: static void Delete()
;	---------------------------------
; Function Delete
; ---------------------------------
_Delete:
;./editor.c:473: if (s_Cursor == s_Length)
	ld	a, (_s_Cursor)
	ld	iy, #_g_DocumentLength
	sub	a, 0 (iy)
	jr	nz, 00102$
	ld	a, (_s_Cursor + 1)
	sub	a, 1 (iy)
	jr	nz, 00102$
	ld	a, (_s_Cursor + 2)
	sub	a, 2 (iy)
	jr	nz, 00102$
	ld	a, (_s_Cursor + 3)
	sub	a, 3 (iy)
	ret	z
;./editor.c:474: return;
00102$:
;./editor.c:475: PrepareEdit();
	call	_PrepareEdit
;./editor.c:476: bool newline = Document_Get(s_Cursor) == '\n';
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_Document_Get
	cp	a, #0x0a
	ld	a, #0x01
	jr	z, 00116$
	xor	a, a
00116$:
	ld	b, a
;./editor.c:477: MarkChanged(newline);
	push	bc
	ld	a, b
	call	_MarkChanged
;./editor.c:478: UpdateLineCache(s_Cursor, 1, FALSE, newline);
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x0001
	push	hl
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_UpdateLineCache
;./editor.c:479: Document_Delete(s_Cursor);
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_Document_Delete
;./editor.c:480: g_EditorModified = TRUE;
	ld	hl, #_g_EditorModified
	ld	(hl), #0x01
;./editor.c:481: }
	ret
;./editor.c:483: static void MoveVertical(bool down)
;	---------------------------------
; Function MoveVertical
; ---------------------------------
_MoveVertical:
	call	___sdcc_enter_ix
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
	ld	c, a
;./editor.c:486: CursorRow(&row, &start);
	push	bc
	ld	hl, #6
	add	hl, sp
	ex	de, hl
	ld	hl, #2
	add	hl, sp
	call	_CursorRow
	pop	bc
;./editor.c:487: if (!s_VerticalMove)
	ld	a, (_s_VerticalMove+0)
	or	a, a
	jr	nz, 00102$
;./editor.c:488: s_GoalCol = s_Cursor - start;
	ld	hl, #_s_GoalCol
	ld	a, (_s_Cursor+0)
	sub	a, -12 (ix)
	ld	(hl), a
	ld	a, (_s_Cursor+1)
	sbc	a, -11 (ix)
	inc	hl
	ld	(hl), a
	ld	a, (_s_Cursor+2)
	sbc	a, -10 (ix)
	inc	hl
	ld	(hl), a
	ld	a, (_s_Cursor+3)
	sbc	a, -9 (ix)
	inc	hl
	ld	(hl), a
00102$:
;./editor.c:489: s_VerticalMove = TRUE;
	ld	hl, #_s_VerticalMove
	ld	(hl), #0x01
;./editor.c:490: if (down)
	ld	a, c
	or	a, a
	jr	z, 00108$
;./editor.c:492: if (!NextRow(start, &next))
	ld	hl, #8
	add	hl, sp
	push	hl
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	call	_NextRow
	or	a, a
;./editor.c:493: return;
	jp	z, 00114$
;./editor.c:494: start = next;
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	hl, #8
	add	hl, sp
	ld	bc, #4
	ldir
	jr	00109$
00108$:
;./editor.c:498: if (!row)
	ld	a, -13 (ix)
	or	a, -14 (ix)
	or	a, -15 (ix)
	or	a, -16 (ix)
;./editor.c:499: return;
	jp	z, 00114$
;./editor.c:500: start = PreviousRow(start);
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	call	_PreviousRow
	ld	-12 (ix), e
	ld	-11 (ix), d
	ld	-10 (ix), l
	ld	-9 (ix), h
00109$:
;./editor.c:502: u32 end = RowEnd(start);
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	call	_RowEnd
	ld	c, l
	ld	b, h
;./editor.c:503: if (g_EditorWrap && NextRow(start, &next) && (next == end))
	ld	a, (_g_EditorWrap+0)
	or	a, a
	jr	z, 00111$
	push	bc
	push	de
	ld	hl, #12
	add	hl, sp
	push	hl
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	call	_NextRow
	pop	de
	pop	bc
	or	a, a
	jr	z, 00111$
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	xor	a, a
	sbc	hl, de
	jr	nz, 00111$
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	xor	a, a
	sbc	hl, bc
	jr	nz, 00111$
;./editor.c:504: --end;
	ld	a, e
	add	a, #0xff
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	ld	a, c
	adc	a, #0xff
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
00111$:
;./editor.c:505: u32 pos = start + s_GoalCol;
	ld	a, -12 (ix)
	ld	hl, #_s_GoalCol
	add	a, (hl)
	ld	-4 (ix), a
	ld	a, -11 (ix)
	inc	hl
	adc	a, (hl)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	inc	hl
	adc	a, (hl)
	ld	-2 (ix), a
	ld	a, -9 (ix)
	inc	hl
	adc	a, (hl)
	ld	-1 (ix), a
;./editor.c:506: SetCursor(pos > end ? end : pos);
	ld	a, e
	sub	a, -4 (ix)
	ld	a, d
	sbc	a, -3 (ix)
	ld	a, c
	sbc	a, -2 (ix)
	ld	a, b
	sbc	a, -1 (ix)
	jr	nc, 00116$
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), c
	ld	-1 (ix), b
00116$:
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_SetCursor
00114$:
;./editor.c:507: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:509: static bool IsWordChar(u8 chr)
;	---------------------------------
; Function IsWordChar
; ---------------------------------
_IsWordChar:
;./editor.c:511: return ((chr >= 'a') && (chr <= 'z'))
	cp	a, #0x61
	jr	c, 00117$
	cp	a, #0x7b
	jr	c, 00104$
00117$:
;./editor.c:512: || ((chr >= 'A') && (chr <= 'Z'))
	cp	a, #0x41
	jr	c, 00114$
	cp	a, #0x5b
	jr	c, 00104$
00114$:
;./editor.c:513: || ((chr >= '0') && (chr <= '9'))
	cp	a, #0x30
	jr	c, 00111$
	cp	a, #0x3a
	jr	c, 00104$
00111$:
;./editor.c:514: || (chr == '_') || (chr >= 128);
	cp	a, #0x5f
	jr	z, 00104$
	sub	a, #0x80
	jr	nc, 00104$
	xor	a, a
	ret
00104$:
	ld	a, #0x01
;./editor.c:515: }
	ret
;./editor.c:517: static bool Input(u16 key)
;	---------------------------------
; Function Input
; ---------------------------------
_Input:
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	af
	push	af
	ld	-2 (ix), l
	ld	-1 (ix), h
;./editor.c:519: if ((key == ASCII_UP) || (key == ASCII_DOWN))
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sub	a, #0x1e
	or	a, -3 (ix)
	jr	z, 00101$
	ld	a, -4 (ix)
	sub	a, #0x1f
	or	a, -3 (ix)
	jr	nz, 00102$
00101$:
;./editor.c:521: MoveVertical(key == ASCII_DOWN);
	ld	a, -4 (ix)
	sub	a, #0x1f
	or	a, -3 (ix)
	ld	a, #0x01
	jr	z, 00448$
	xor	a, a
00448$:
	call	_MoveVertical
;./editor.c:522: return TRUE;
	ld	a, #0x01
	jp	00152$
00102$:
;./editor.c:524: s_VerticalMove = FALSE;
	xor	a, a
	ld	(#_s_VerticalMove), a
;./editor.c:525: u32 pos = s_Cursor;
	ld	de, (_s_Cursor)
	ld	bc, (_s_Cursor + 2)
;./editor.c:526: switch (key)
	ld	a, -4 (ix)
	sub	a, #0x08
	or	a, -3 (ix)
	jp	z, 00133$
	ld	a, -4 (ix)
	sub	a, #0x09
	or	a, -3 (ix)
	jp	z, 00138$
	ld	a, -4 (ix)
	sub	a, #0x0b
	or	a, -3 (ix)
	jp	z, 00130$
	ld	a, -4 (ix)
	sub	a, #0x0c
	or	a, -3 (ix)
	jp	z, 00131$
	ld	a, -4 (ix)
	sub	a, #0x0d
	or	a, -3 (ix)
	jp	z, 00137$
	ld	a, -4 (ix)
	sub	a, #0x12
	or	a, -3 (ix)
	jp	z, 00132$
	ld	a, -4 (ix)
	sub	a, #0x1c
	or	a, -3 (ix)
	jp	z, 00127$
	ld	a, -4 (ix)
	sub	a, #0x1d
	or	a, -3 (ix)
	jp	z, 00124$
	ld	a, -4 (ix)
	sub	a, #0x7f
	or	a, -3 (ix)
	jp	z, 00136$
	ld	a, -4 (ix)
	dec	a
	jr	nz, 00458$
	ld	a, -3 (ix)
	sub	a, #0x02
	jr	z, 00108$
00458$:
	ld	a, -4 (ix)
	sub	a, #0x02
	jr	nz, 00459$
	ld	a, -3 (ix)
	sub	a, #0x02
	jp	z, 00212$
00459$:
	ld	a, -4 (ix)
	sub	a, #0x03
	jr	nz, 00460$
	ld	a, -3 (ix)
	sub	a, #0x02
	jr	z, 00104$
00460$:
	ld	a, -4 (ix)
	sub	a, #0x04
	jp	nz, 00139$
	ld	a, -3 (ix)
	sub	a, #0x02
	jr	z, 00105$
	jp	00139$
;./editor.c:528: case EDITOR_TEXT_START:
00104$:
;./editor.c:529: SetCursor(0);
	ld	de, #0x0000
	ld	h, d
	ld	l, e
	call	_SetCursor
;./editor.c:530: break;
	jp	00151$
;./editor.c:531: case EDITOR_TEXT_END:
00105$:
;./editor.c:532: SetCursor(s_Length);
	ld	de, (_g_DocumentLength)
	ld	hl, (_g_DocumentLength + 2)
	call	_SetCursor
;./editor.c:533: break;
	jp	00151$
;./editor.c:535: while (pos && !IsWordChar(Document_Get(pos - 1))) --pos;
00108$:
	ld	a, b
	or	a, c
	or	a, d
	or	a, e
	jr	z, 00112$
	ld	a, e
	add	a, #0xff
	ld	-6 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-5 (ix), a
	ld	a, c
	adc	a, #0xff
	ld	-4 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-3 (ix), a
	push	bc
	push	de
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	call	_Document_Get
	call	_IsWordChar
	pop	de
	pop	bc
	or	a, a
	jr	nz, 00112$
	pop	de
	pop	bc
	push	bc
	push	de
	jr	00108$
;./editor.c:536: while (pos && IsWordChar(Document_Get(pos - 1))) --pos;
00112$:
	ld	a, b
	or	a, c
	or	a, d
	or	a, e
	jr	z, 00114$
	ld	a, e
	add	a, #0xff
	ld	-6 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-5 (ix), a
	ld	a, c
	adc	a, #0xff
	ld	-4 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-3 (ix), a
	push	bc
	push	de
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	call	_Document_Get
	call	_IsWordChar
	pop	de
	pop	bc
	or	a, a
	jr	z, 00114$
	pop	de
	pop	bc
	push	bc
	push	de
	jr	00112$
00114$:
;./editor.c:537: SetCursor(pos);
	ld	l, c
	ld	h, b
	call	_SetCursor
;./editor.c:538: break;
	jp	00151$
;./editor.c:540: while ((pos < s_Length) && IsWordChar(Document_Get(pos))) ++pos;
00212$:
00117$:
	ld	hl, #_g_DocumentLength
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	inc	hl
	ld	a, c
	sbc	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	nc, 00215$
	push	bc
	push	de
	ld	l, c
	ld	h, b
	call	_Document_Get
	call	_IsWordChar
	pop	de
	pop	bc
	or	a, a
	jr	z, 00215$
	inc	e
	jr	nz, 00117$
	inc	d
	jr	nz, 00117$
	inc	bc
	jr	00117$
;./editor.c:541: while ((pos < s_Length) && !IsWordChar(Document_Get(pos))) ++pos;
00215$:
00121$:
	ld	hl, #_g_DocumentLength
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	inc	hl
	ld	a, c
	sbc	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	nc, 00123$
	push	bc
	push	de
	ld	l, c
	ld	h, b
	call	_Document_Get
	call	_IsWordChar
	pop	de
	pop	bc
	or	a, a
	jr	nz, 00123$
	inc	e
	jr	nz, 00121$
	inc	d
	jr	nz, 00121$
	inc	bc
	jr	00121$
00123$:
;./editor.c:542: SetCursor(pos);
	ld	l, c
	ld	h, b
	call	_SetCursor
;./editor.c:543: break;
	jp	00151$
;./editor.c:544: case ASCII_LEFT:
00124$:
;./editor.c:545: if (s_Cursor) SetCursor(s_Cursor - 1);
	ld	a, (_s_Cursor+3)
	ld	iy, #_s_Cursor
	or	a, 2 (iy)
	or	a, 1 (iy)
	or	a, 0 (iy)
	jp	z, 00151$
	ld	a, (_s_Cursor+0)
	add	a, #0xff
	ld	e, a
	ld	a, (_s_Cursor+1)
	adc	a, #0xff
	ld	d, a
	ld	a, (_s_Cursor+2)
	adc	a, #0xff
	ld	c, a
	ld	a, (_s_Cursor+3)
	adc	a, #0xff
	ld	l, c
	ld	h, a
	call	_SetCursor
;./editor.c:546: break;
	jp	00151$
;./editor.c:547: case ASCII_RIGHT:
00127$:
;./editor.c:548: if (s_Cursor < s_Length) SetCursor(s_Cursor + 1);
	ld	hl, #_g_DocumentLength
	ld	a, (_s_Cursor+0)
	sub	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+1)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+2)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+3)
	sbc	a, (hl)
	jp	nc, 00151$
	ld	a, (_s_Cursor+0)
	add	a, #0x01
	ld	e, a
	ld	a, (_s_Cursor+1)
	adc	a, #0x00
	ld	d, a
	ld	a, (_s_Cursor+2)
	adc	a, #0x00
	ld	c, a
	ld	a, (_s_Cursor+3)
	adc	a, #0x00
	ld	b, a
	ld	l, c
	ld	h, b
	call	_SetCursor
;./editor.c:549: break;
	jp	00151$
;./editor.c:550: case ASCII_HOME:
00130$:
;./editor.c:551: SetCursor(s_LineStart);
	ld	de, (_s_LineStart)
	ld	hl, (_s_LineStart + 2)
	call	_SetCursor
;./editor.c:552: break;
	jp	00151$
;./editor.c:553: case ASCII_CLS:
00131$:
;./editor.c:554: SetCursor(LineEnd(s_Cursor));
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_LineEnd
	call	_SetCursor
;./editor.c:555: break;
	jp	00151$
;./editor.c:556: case ASCII_INSERT:
00132$:
;./editor.c:557: g_EditorInsert = !g_EditorInsert;
	ld	a, (_g_EditorInsert+0)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(#_g_EditorInsert), a
;./editor.c:558: break;
	jp	00151$
;./editor.c:559: case ASCII_BS:
00133$:
;./editor.c:560: if (s_Cursor) { SetCursor(s_Cursor - 1); Delete(); }
	ld	a, (_s_Cursor+3)
	ld	iy, #_s_Cursor
	or	a, 2 (iy)
	or	a, 1 (iy)
	or	a, 0 (iy)
	jp	z, 00151$
	ld	a, (_s_Cursor+0)
	add	a, #0xff
	ld	e, a
	ld	a, (_s_Cursor+1)
	adc	a, #0xff
	ld	d, a
	ld	a, (_s_Cursor+2)
	adc	a, #0xff
	ld	c, a
	ld	a, (_s_Cursor+3)
	adc	a, #0xff
	ld	l, c
	ld	h, a
	call	_SetCursor
	call	_Delete
;./editor.c:561: break;
	jp	00151$
;./editor.c:562: case 127:
00136$:
;./editor.c:563: Delete();
	call	_Delete
;./editor.c:564: break;
	jp	00151$
;./editor.c:565: case ASCII_RET:
00137$:
;./editor.c:566: return Insert('\n', 1);
	ld	de, #0x0001
	ld	a, #0x0a
	call	_Insert
	jp	00152$
;./editor.c:567: case ASCII_TAB:
00138$:
;./editor.c:568: return Insert(' ', 8 - (s_Cursor - s_LineStart) % 8);
	ld	hl, #_s_LineStart
	ld	a, (_s_Cursor+0)
	sub	a, (hl)
	and	a, #0x07
	ld	l, a
	ld	a, #0x08
	sub	a, l
	ld	e, a
	sbc	a, a
	ld	d, a
	ld	a, #0x20
	call	_Insert
	jp	00152$
;./editor.c:569: default:
00139$:
;./editor.c:570: if ((key >= ASCII_SPACE) && (key <= 255) && (key != 127))
	ld	a, -4 (ix)
	sub	a, #0x20
	ld	a, -3 (ix)
	sbc	a, #0x00
	jp	c, 00151$
	ld	a, #0xff
	cp	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	jp	c, 00151$
	ld	a, -4 (ix)
	sub	a, #0x7f
	or	a, -3 (ix)
	jp	z, 00151$
;./editor.c:572: if (!g_EditorInsert && (s_Cursor < s_Length) && (Document_Get(s_Cursor) != '\n'))
	ld	a, (_g_EditorInsert+0)
	or	a, a
	jr	nz, 00143$
	ld	hl, #_g_DocumentLength
	ld	a, (_s_Cursor+0)
	sub	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+1)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+2)
	sbc	a, (hl)
	inc	hl
	ld	a, (_s_Cursor+3)
	sbc	a, (hl)
	jr	nc, 00143$
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_Document_Get
	cp	a, #0x0a
	jr	z, 00143$
;./editor.c:574: if (Document_Get(s_Cursor) != key)
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_Document_Get
	sub	a, -2 (ix)
	jr	nz, 00466$
	xor	a, a
	sub	a, -1 (ix)
	jr	z, 00141$
00466$:
;./editor.c:575: g_EditorModified = TRUE;
	ld	hl, #_g_EditorModified
	ld	(hl), #0x01
00141$:
;./editor.c:576: PrepareEdit();
	call	_PrepareEdit
;./editor.c:577: MarkChanged(FALSE);
	xor	a, a
	call	_MarkChanged
;./editor.c:578: Document_Put(s_Cursor, key);
	ld	a, -2 (ix)
	push	af
	inc	sp
	ld	de, (_s_Cursor)
	ld	hl, (_s_Cursor + 2)
	call	_Document_Put
;./editor.c:579: ++s_Cursor;
	ld	iy, #_s_Cursor
	inc	0 (iy)
	jr	nz, 00151$
	inc	1 (iy)
	jr	nz, 00151$
	inc	2 (iy)
	jr	nz, 00151$
	inc	3 (iy)
	jr	00151$
00143$:
;./editor.c:582: return Insert(key, 1);
	ld	a, -2 (ix)
	ld	de, #0x0001
	call	_Insert
	jr	00152$
;./editor.c:585: }
00151$:
;./editor.c:586: return TRUE;
	ld	a, #0x01
00152$:
;./editor.c:587: }
	ld	sp, ix
	pop	ix
	ret
;./editor.c:589: bool Editor_Input(u16 key)
;	---------------------------------
; Function Editor_Input
; ---------------------------------
_Editor_Input::
;./editor.c:591: Document_Begin();
	push	hl
	call	_Document_Begin
	pop	hl
;./editor.c:592: bool ok = Input(key);
	call	_Input
	ld	c, a
;./editor.c:593: Document_End();
	push	bc
	call	_Document_End
	pop	bc
;./editor.c:594: return ok;
	ld	a, c
;./editor.c:595: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
