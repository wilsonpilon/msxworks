;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module document
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DOSMapper_GetPage2
	.globl _DOSMapper_SetPage2
	.globl _DOSMapper_Free
	.globl _DOSMapper_Alloc
	.globl _Sys_GetPageSlot
	.globl _g_DocumentLength
	.globl _g_DocumentCapacity
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
	.globl _Document_Close
	.globl _Document_Reset
	.globl _Document_Init
	.globl _Document_Begin
	.globl _Document_End
	.globl _Document_Read
	.globl _Document_Get
	.globl _Document_Put
	.globl _Document_Insert
	.globl _Document_Delete
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
_s_Segments:
	.ds 8192
_s_Count:
	.ds 2
_s_GapStart:
	.ds 4
_s_GapEnd:
	.ds 4
_s_SavedPage:
	.ds 1
_s_SavedSlot:
	.ds 1
_s_Slot:
	.ds 1
_s_Mapped:
	.ds 2
_s_Copy:
	.ds 128
_g_DocumentCapacity::
	.ds 4
_g_DocumentLength::
	.ds 4
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
;./document.c:23: static bool Document_MemorySafe() __NAKED
;	---------------------------------
; Function Document_MemorySafe
; ---------------------------------
_Document_MemorySafe:
;./document.c:33: __endasm;
	ld hl, #s__HEAP
	ld a, h
	cp #0x80
	ld a, #0
	ret nc
	inc a
	ret
;./document.c:34: }
;./document.c:36: static void Document_SelectSlot(u8 slot) __NAKED
;	---------------------------------
; Function Document_SelectSlot
; ---------------------------------
_Document_SelectSlot:
;./document.c:46: __endasm;
	push ix
	ld h, #0x80
	call 0x0024
	ei
	pop ix
	ret
;./document.c:47: }
;./document.c:49: static u8* Document_Page() { return (u8*)0x8000; }
;	---------------------------------
; Function Document_Page
; ---------------------------------
_Document_Page:
	ld	de, #0x8000
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
;./document.c:57: bool Document_Close()
;	---------------------------------
; Function Document_Close
; ---------------------------------
_Document_Close::
;./document.c:59: bool ok = TRUE;
	ld	c, #0x01
;./document.c:60: while (s_Count)
00103$:
	ld	a, (_s_Count+1)
	ld	hl, #_s_Count
	or	a, (hl)
	jr	z, 00105$
;./document.c:62: --s_Count;
	ld	hl, (_s_Count)
	dec	hl
;./document.c:63: if (!DOSMapper_FreeStruct(&s_Segments[s_Count]))
	ld	(_s_Count), hl
	add	hl, hl
	ld	de, #_s_Segments
	add	hl, de
;E:\msxworks\MSXgl\engine/src/dos_mapper.h:140: inline bool DOSMapper_FreeStruct(DOS_Segment* seg) { return DOSMapper_Free(seg->Number, seg->Slot); }
	ld	e, l
	ld	d, h
	inc	hl
	ld	l, (hl)
	ld	a, (de)
	push	bc
	call	_DOSMapper_Free
	pop	bc
;./document.c:63: if (!DOSMapper_FreeStruct(&s_Segments[s_Count]))
;./document.c:64: ok = FALSE;
	or	a, a
	jr	nz, 00103$
	ld	c, a
	jr	00103$
00105$:
;./document.c:66: g_DocumentCapacity = g_DocumentLength = 0;
	xor	a, a
	ld	(_g_DocumentLength+0), a
	ld	(_g_DocumentLength+1), a
	ld	(_g_DocumentLength+2), a
	ld	(_g_DocumentLength+3), a
	xor	a, a
	ld	(_g_DocumentCapacity+0), a
	ld	(_g_DocumentCapacity+1), a
	ld	(_g_DocumentCapacity+2), a
	ld	(_g_DocumentCapacity+3), a
;./document.c:67: return ok;
	ld	a, c
;./document.c:68: }
	ret
;./document.c:70: void Document_Reset()
;	---------------------------------
; Function Document_Reset
; ---------------------------------
_Document_Reset::
;./document.c:72: g_DocumentLength = s_GapStart = 0;
	xor	a, a
	ld	(_s_GapStart+0), a
	ld	(_s_GapStart+1), a
	ld	(_s_GapStart+2), a
	ld	(_s_GapStart+3), a
	xor	a, a
	ld	(_g_DocumentLength+0), a
	ld	(_g_DocumentLength+1), a
	ld	(_g_DocumentLength+2), a
	ld	(_g_DocumentLength+3), a
;./document.c:73: s_GapEnd = g_DocumentCapacity;
	ld	de, #_s_GapEnd
	ld	hl, #_g_DocumentCapacity
	ld	bc, #4
	ldir
;./document.c:74: }
	ret
;./document.c:76: bool Document_Init()
;	---------------------------------
; Function Document_Init
; ---------------------------------
_Document_Init::
	call	___sdcc_enter_ix
	push	af
;./document.c:78: s_Count = 0;
	ld	hl, #0x0000
	ld	(_s_Count), hl
;./document.c:79: g_DocumentCapacity = 0;
	xor	a, a
	ld	(_g_DocumentCapacity+0), a
	ld	(_g_DocumentCapacity+1), a
	ld	(_g_DocumentCapacity+2), a
	ld	(_g_DocumentCapacity+3), a
;./document.c:80: if (!Document_MemorySafe())
	call	_Document_MemorySafe
;./document.c:81: return FALSE;
	or	a,a
	jp	z, 00113$
;./document.c:82: const DOS_VarTable* tab = DOSMapper_GetVarTable();
	ld	bc, (_g_DOS_VarTable)
;./document.c:83: while (tab->Slot)
00109$:
	ld	e, c
	ld	d, b
	ld	a, (de)
	or	a, a
	jr	z, 00111$
;./document.c:85: u16 free = tab->FreeSeg;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;./document.c:86: while (free--)
00106$:
	pop	hl
	push	hl
	ld	a, -2 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	a, h
	or	a, l
	jr	z, 00108$
;./document.c:88: if ((s_Count == MAX_SEGMENTS)
	ld	hl, (_s_Count)
	ld	a, l
	or	a, a
	jr	nz, 00163$
	ld	a, h
	sub	a, #0x10
	jr	z, 00103$
00163$:
;./document.c:89: || !DOSMapper_Alloc(DOS_ALLOC_USER, tab->Slot, &s_Segments[s_Count]))
	ld	hl, (_s_Count)
	add	hl, hl
	push	de
	ld	de, #_s_Segments
	add	hl, de
	pop	de
	ld	a, (de)
	push	bc
	push	de
	push	hl
	ld	l, a
	xor	a, a
	call	_DOSMapper_Alloc
	pop	de
	pop	bc
	or	a, a
	jr	nz, 00104$
00103$:
;./document.c:90: return FALSE;
	xor	a, a
	jr	00113$
00104$:
;./document.c:91: ++s_Count;
	ld	hl, (_s_Count)
	inc	hl
	ld	(_s_Count), hl
;./document.c:92: g_DocumentCapacity += SEGMENT_SIZE;
	ld	hl, #_g_DocumentCapacity
	inc	hl
	ld	a, (hl)
	add	a, #0x40
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
	jr	nc, 00106$
	inc	hl
	inc	(hl)
	jr	00106$
00108$:
;./document.c:94: ++tab;
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	jr	00109$
00111$:
;./document.c:96: Document_Reset();
	call	_Document_Reset
;./document.c:97: return s_Count != 0;
	ld	a, (_s_Count+1)
	ld	hl, #_s_Count
	or	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
00113$:
;./document.c:98: }
	pop	bc
	pop	ix
	ret
;./document.c:100: void Document_Begin()
;	---------------------------------
; Function Document_Begin
; ---------------------------------
_Document_Begin::
;./document.c:102: s_SavedPage = DOSMapper_GetPage2();
	call	_DOSMapper_GetPage2
	ld	(#_s_SavedPage), a
;./document.c:103: s_SavedSlot = s_Slot = Sys_GetPageSlot(2);
	ld	a, #0x02
	call	_Sys_GetPageSlot
	ld	(#_s_Slot), a
	ld	(#_s_SavedSlot), a
;./document.c:104: s_Mapped = MAX_SEGMENTS;
	ld	hl, #0x1000
	ld	(_s_Mapped), hl
;./document.c:105: }
	ret
;./document.c:107: void Document_End()
;	---------------------------------
; Function Document_End
; ---------------------------------
_Document_End::
;./document.c:109: DOSMapper_SetPage2(s_SavedPage);
	ld	a, (_s_SavedPage)
	call	_DOSMapper_SetPage2
;./document.c:110: if (s_Slot != s_SavedSlot)
	ld	a, (_s_Slot)
	ld	hl, #_s_SavedSlot
	sub	a, (hl)
	ret	z
;./document.c:111: Document_SelectSlot(s_SavedSlot);
	ld	a, (_s_SavedSlot+0)
;./document.c:112: }
	jp	_Document_SelectSlot
;./document.c:114: static u8* Address(u32 pos)
;	---------------------------------
; Function Address
; ---------------------------------
_Address:
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	de
	ld	-2 (ix), l
	ld	-1 (ix), h
;./document.c:116: u16 index = pos >> 14;
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	c, -1 (ix)
	ld	b, #0x06
00123$:
	srl	c
	rr	d
	rr	e
	djnz	00123$
;./document.c:117: if (index != s_Mapped)
	ld	hl, (_s_Mapped)
	xor	a, a
	sbc	hl, de
	jr	z, 00104$
;./document.c:119: DOSMapper_SetPage2(s_Segments[index].Number);
	ld	bc, #_s_Segments+0
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	push	hl
	push	de
	call	_DOSMapper_SetPage2
	pop	de
	pop	hl
;./document.c:120: if (s_Slot != s_Segments[index].Slot)
	inc	hl
	ld	c, (hl)
	ld	a, (_s_Slot)
	sub	a, c
	jr	z, 00102$
;./document.c:122: s_Slot = s_Segments[index].Slot;
	ld	hl, #_s_Slot
	ld	(hl), c
;./document.c:123: Document_SelectSlot(s_Slot);
	push	de
	ld	a, (_s_Slot)
	call	_Document_SelectSlot
	pop	de
00102$:
;./document.c:125: s_Mapped = index;
	ld	(_s_Mapped), de
00104$:
;./document.c:127: return Document_Page() + (u16)(pos & (SEGMENT_SIZE - 1));
	call	_Document_Page
	ld	l, -4 (ix)
	ld	a, -3 (ix)
	and	a, #0x3f
	ld	h, a
	add	hl, de
	ex	de, hl
;./document.c:128: }
	ld	sp, ix
	pop	ix
	ret
;./document.c:130: static u16 BankCount(u32 pos, u16 count)
;	---------------------------------
; Function BankCount
; ---------------------------------
_BankCount:
	push	ix
	ld	ix,	#0
	add	ix, sp
;./document.c:132: u16 available = (u16)(SEGMENT_SIZE - (pos & (SEGMENT_SIZE - 1)));
	ld	a, d
	and	a, #0x3f
	ld	d, a
	ld	hl, #0x4000
	cp	a, a
	sbc	hl, de
;./document.c:133: return count < available ? count : available;
	ld	a, 4 (ix)
	sub	a, l
	ld	a, 5 (ix)
	sbc	a, h
	jr	nc, 00103$
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	jr	00104$
00103$:
	ex	de, hl
00104$:
;./document.c:134: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./document.c:136: void Document_Read(u32 pos, c8* dest, u16 count)
;	---------------------------------
; Function Document_Read
; ---------------------------------
_Document_Read::
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-14
	add	iy, sp
	ld	sp, iy
	ld	-10 (ix), e
	ld	-9 (ix), d
	ld	-8 (ix), l
	ld	-7 (ix), h
;./document.c:138: while (count)
00107$:
	ld	a, 7 (ix)
	or	a, 6 (ix)
	jp	z, 00113$
;./document.c:140: u32 physical = pos;
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	c, -8 (ix)
	ld	b, -7 (ix)
;./document.c:141: u16 size = count;
	ld	a, 6 (ix)
	ld	-6 (ix), a
	ld	a, 7 (ix)
	ld	-5 (ix), a
;./document.c:142: if (pos >= s_GapStart)
	ld	hl, #_s_GapStart
	ld	a, -10 (ix)
	sub	a, (hl)
	ld	a, -9 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -8 (ix)
	inc	hl
	sbc	a, (hl)
	ld	a, -7 (ix)
	inc	hl
	sbc	a, (hl)
	jr	c, 00104$
;./document.c:143: physical += s_GapEnd - s_GapStart;
	ld	hl, #_s_GapStart
	ld	a, (_s_GapEnd+0)
	sub	a, (hl)
	inc	hl
	ld	e, a
	ld	a, (_s_GapEnd+1)
	sbc	a, (hl)
	inc	hl
	ld	d, a
	ld	a, (_s_GapEnd+2)
	sbc	a, (hl)
	inc	hl
	ld	c, a
	ld	a, (_s_GapEnd+3)
	sbc	a, (hl)
	ld	b, a
	ld	a, e
	add	a, -10 (ix)
	ld	e, a
	ld	a, d
	adc	a, -9 (ix)
	ld	d, a
	ld	a, c
	adc	a, -8 (ix)
	ld	c, a
	ld	a, b
	adc	a, -7 (ix)
	ld	b, a
	jr	00105$
00104$:
;./document.c:144: else if (s_GapStart - pos < size)
	ld	a, (_s_GapStart+0)
	sub	a, -10 (ix)
	ld	-14 (ix), a
	ld	a, (_s_GapStart+1)
	sbc	a, -9 (ix)
	ld	-13 (ix), a
	ld	a, (_s_GapStart+2)
	sbc	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, (_s_GapStart+3)
	sbc	a, -7 (ix)
	ld	-11 (ix), a
	ld	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	a, -14 (ix)
	sub	a, -4 (ix)
	ld	a, -13 (ix)
	sbc	a, -3 (ix)
	ld	a, -12 (ix)
	sbc	a, -2 (ix)
	ld	a, -11 (ix)
	sbc	a, -1 (ix)
	jr	nc, 00105$
;./document.c:145: size = (u16)(s_GapStart - pos);
	ld	hl, (_s_GapStart)
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, -2 (ix)
	sub	a, l
	ld	-6 (ix), a
	ld	a, -1 (ix)
	sbc	a, h
	ld	-5 (ix), a
00105$:
;./document.c:146: size = BankCount(physical, size);
	push	bc
	push	de
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, c
	ld	h, b
	call	_BankCount
	ld	-12 (ix), e
	ld	-11 (ix), d
	pop	de
;./document.c:147: const u8* src = Address(physical);
	pop	hl
	call	_Address
	ld	-6 (ix), e
	ld	-5 (ix), d
;./document.c:148: for (u16 i = 0; i < size; ++i)
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00111$:
	ld	a, -2 (ix)
	sub	a, -12 (ix)
	ld	a, -1 (ix)
	sbc	a, -11 (ix)
	jr	nc, 00127$
;./document.c:149: *dest++ = *src++;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	inc	-6 (ix)
	jr	nz, 00164$
	inc	-5 (ix)
00164$:
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
	inc	-4 (ix)
	jr	nz, 00165$
	inc	-3 (ix)
00165$:
;./document.c:148: for (u16 i = 0; i < size; ++i)
	inc	-2 (ix)
	jr	nz, 00111$
	inc	-1 (ix)
	jr	00111$
00127$:
	ld	a, -4 (ix)
	ld	4 (ix), a
	ld	a, -3 (ix)
	ld	5 (ix), a
;./document.c:150: pos += size;
	ld	a, -12 (ix)
	ld	c, -11 (ix)
	ld	de, #0x0000
	add	a, -10 (ix)
	ld	-10 (ix), a
	ld	a, c
	adc	a, -9 (ix)
	ld	-9 (ix), a
	ld	a, e
	adc	a, -8 (ix)
	ld	-8 (ix), a
	ld	a, d
	adc	a, -7 (ix)
	ld	-7 (ix), a
;./document.c:151: count -= size;
	ld	a, 6 (ix)
	sub	a, -12 (ix)
	ld	6 (ix), a
	ld	a, 7 (ix)
	sbc	a, -11 (ix)
	ld	7 (ix), a
	jp	00107$
00113$:
;./document.c:153: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;./document.c:155: u8 Document_Get(u32 pos)
;	---------------------------------
; Function Document_Get
; ---------------------------------
_Document_Get::
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	af
	ld	c, l
	ld	b, h
;./document.c:157: if (pos >= s_GapStart)
	ld	hl, #_s_GapStart
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
	jr	c, 00102$
;./document.c:158: pos += s_GapEnd - s_GapStart;
	ld	hl, #_s_GapStart
	ld	a, (_s_GapEnd+0)
	sub	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (_s_GapEnd+1)
	sbc	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (_s_GapEnd+2)
	sbc	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (_s_GapEnd+3)
	sbc	a, (hl)
	ld	-1 (ix), a
	ld	a, e
	add	a, -4 (ix)
	ld	e, a
	ld	a, d
	adc	a, -3 (ix)
	ld	d, a
	ld	a, c
	adc	a, -2 (ix)
	ld	c, a
	ld	a, b
	adc	a, -1 (ix)
	ld	b, a
00102$:
;./document.c:159: return *Address(pos);
	ld	l, c
	ld	h, b
	call	_Address
	ld	a, (de)
;./document.c:160: }
	ld	sp, ix
	pop	ix
	ret
;./document.c:162: void Document_Put(u32 pos, u8 chr)
;	---------------------------------
; Function Document_Put
; ---------------------------------
_Document_Put::
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	af
	ld	c, l
	ld	b, h
;./document.c:164: if (pos >= s_GapStart)
	ld	hl, #_s_GapStart
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
	jr	c, 00102$
;./document.c:165: pos += s_GapEnd - s_GapStart;
	ld	hl, #_s_GapStart
	ld	a, (_s_GapEnd+0)
	sub	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (_s_GapEnd+1)
	sbc	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (_s_GapEnd+2)
	sbc	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (_s_GapEnd+3)
	sbc	a, (hl)
	ld	-1 (ix), a
	ld	a, e
	add	a, -4 (ix)
	ld	e, a
	ld	a, d
	adc	a, -3 (ix)
	ld	d, a
	ld	a, c
	adc	a, -2 (ix)
	ld	c, a
	ld	a, b
	adc	a, -1 (ix)
	ld	b, a
00102$:
;./document.c:166: *Address(pos) = chr;
	ld	l, c
	ld	h, b
	call	_Address
	ld	a, 4 (ix)
	ld	(de), a
;./document.c:167: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./document.c:169: static void ReadPhysical(u32 pos, u16 count)
;	---------------------------------
; Function ReadPhysical
; ---------------------------------
_ReadPhysical:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	-4 (ix), l
	ld	-3 (ix), h
;./document.c:171: u16 done = 0;
	ld	bc, #0x0000
;./document.c:172: while (done < count)
00102$:
	ld	a, c
	sub	a, 4 (ix)
	ld	a, b
	sbc	a, 5 (ix)
	jp	nc, 00108$
;./document.c:174: u16 size = BankCount(pos, count - done);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	cp	a, a
	sbc	hl, bc
	push	bc
	push	hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	call	_BankCount
	ld	-8 (ix), e
	ld	-7 (ix), d
;./document.c:175: const u8* src = Address(pos);
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	call	_Address
	pop	bc
;./document.c:176: for (u16 i = 0; i < size; ++i)
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00106$:
	ld	a, -2 (ix)
	sub	a, -8 (ix)
	ld	a, -1 (ix)
	sbc	a, -7 (ix)
	jr	nc, 00101$
;./document.c:177: s_Copy[done + i] = *src++;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	add	hl, bc
	push	de
	ld	de, #_s_Copy
	add	hl, de
	pop	de
	ld	a, (de)
	inc	de
	ld	(hl), a
;./document.c:176: for (u16 i = 0; i < size; ++i)
	inc	-2 (ix)
	jr	nz, 00106$
	inc	-1 (ix)
	jr	00106$
00101$:
;./document.c:178: pos += size;
	pop	de
	push	de
	ld	hl, #0x0000
	ld	a, e
	add	a, -6 (ix)
	ld	-6 (ix), a
	ld	a, d
	adc	a, -5 (ix)
	ld	-5 (ix), a
	ld	a, l
	adc	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, h
	adc	a, -3 (ix)
	ld	-3 (ix), a
;./document.c:179: done += size;
	ld	a, -8 (ix)
	add	a, c
	ld	c, a
	ld	a, -7 (ix)
	adc	a, b
	ld	b, a
	jp	00102$
00108$:
;./document.c:181: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./document.c:183: static void WritePhysical(u32 pos, u16 count)
;	---------------------------------
; Function WritePhysical
; ---------------------------------
_WritePhysical:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	-4 (ix), l
	ld	-3 (ix), h
;./document.c:185: u16 done = 0;
	ld	bc, #0x0000
;./document.c:186: while (done < count)
00102$:
	ld	a, c
	sub	a, 4 (ix)
	ld	a, b
	sbc	a, 5 (ix)
	jp	nc, 00108$
;./document.c:188: u16 size = BankCount(pos, count - done);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	cp	a, a
	sbc	hl, bc
	push	bc
	push	hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	call	_BankCount
	ld	-8 (ix), e
	ld	-7 (ix), d
;./document.c:189: u8* dest = Address(pos);
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	call	_Address
	pop	bc
;./document.c:190: for (u16 i = 0; i < size; ++i)
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00106$:
	ld	a, -2 (ix)
	sub	a, -8 (ix)
	ld	a, -1 (ix)
	sbc	a, -7 (ix)
	jr	nc, 00101$
;./document.c:191: *dest++ = s_Copy[done + i];
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	add	hl, bc
	push	de
	ld	de, #_s_Copy
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	(de), a
	inc	de
;./document.c:190: for (u16 i = 0; i < size; ++i)
	inc	-2 (ix)
	jr	nz, 00106$
	inc	-1 (ix)
	jr	00106$
00101$:
;./document.c:192: pos += size;
	pop	de
	push	de
	ld	hl, #0x0000
	ld	a, e
	add	a, -6 (ix)
	ld	-6 (ix), a
	ld	a, d
	adc	a, -5 (ix)
	ld	-5 (ix), a
	ld	a, l
	adc	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, h
	adc	a, -3 (ix)
	ld	-3 (ix), a
;./document.c:193: done += size;
	ld	a, -8 (ix)
	add	a, c
	ld	c, a
	ld	a, -7 (ix)
	adc	a, b
	ld	b, a
	jp	00102$
00108$:
;./document.c:195: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./document.c:197: static void MoveGap(u32 pos)
;	---------------------------------
; Function MoveGap
; ---------------------------------
_MoveGap:
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
;./document.c:199: while (s_GapStart > pos)
00101$:
	ld	a, -4 (ix)
	ld	iy, #_s_GapStart
	sub	a, 0 (iy)
	ld	a, -3 (ix)
	sbc	a, 1 (iy)
	ld	a, -2 (ix)
	sbc	a, 2 (iy)
	ld	a, -1 (ix)
	sbc	a, 3 (iy)
	jp	nc, 00104$
;./document.c:201: u32 distance = s_GapStart - pos;
	ld	a, (_s_GapStart+0)
	sub	a, -4 (ix)
	ld	c, a
	ld	a, (_s_GapStart+1)
	sbc	a, -3 (ix)
	ld	b, a
	ld	a, (_s_GapStart+2)
	sbc	a, -2 (ix)
	ld	e, a
	ld	a, (_s_GapStart+3)
	sbc	a, -1 (ix)
	ld	d, a
;./document.c:202: u16 count = distance > COPY_SIZE ? COPY_SIZE : (u16)distance;
	ld	a, #0x80
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	ld	hl, #0x0000
	sbc	hl, de
	jr	nc, 00109$
	ld	bc, #0x0080
00109$:
	pop	de
	push	bc
;./document.c:203: ReadPhysical(s_GapStart - count, count);
	ld	a, -10 (ix)
	ld	-8 (ix), a
	xor	a, a
	ld	-7 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), a
	ld	a, (_s_GapStart+0)
	sub	a, -8 (ix)
	ld	e, a
	ld	a, (_s_GapStart+1)
	sbc	a, -7 (ix)
	ld	d, a
	ld	a, (_s_GapStart+2)
	sbc	a, -6 (ix)
	ld	c, a
	ld	a, (_s_GapStart+3)
	sbc	a, -5 (ix)
	pop	hl
	push	hl
	push	hl
	ld	l, c
	ld	h, a
	call	_ReadPhysical
;./document.c:204: WritePhysical(s_GapEnd - count, count);
	ld	a, (_s_GapEnd+0)
	sub	a, -8 (ix)
	ld	e, a
	ld	a, (_s_GapEnd+1)
	sbc	a, -7 (ix)
	ld	d, a
	ld	a, (_s_GapEnd+2)
	sbc	a, -6 (ix)
	ld	c, a
	ld	a, (_s_GapEnd+3)
	sbc	a, -5 (ix)
	pop	hl
	push	hl
	push	hl
	ld	l, c
	ld	h, a
	call	_WritePhysical
;./document.c:205: s_GapStart -= count;
	ld	hl, #_s_GapStart
	ld	a, (hl)
	sub	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, -5 (ix)
	ld	(hl), a
;./document.c:206: s_GapEnd -= count;
	ld	hl, #_s_GapEnd
	ld	a, (hl)
	sub	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, -5 (ix)
	ld	(hl), a
	jp	00101$
;./document.c:208: while (s_GapStart < pos)
00104$:
	ld	a, (_s_GapStart+0)
	sub	a, -4 (ix)
	ld	a, (_s_GapStart+1)
	sbc	a, -3 (ix)
	ld	a, (_s_GapStart+2)
	sbc	a, -2 (ix)
	ld	a, (_s_GapStart+3)
	sbc	a, -1 (ix)
	jp	nc, 00107$
;./document.c:210: u32 distance = pos - s_GapStart;
	ld	hl, #_s_GapStart
	ld	a, -4 (ix)
	sub	a, (hl)
	ld	-8 (ix), a
	ld	a, -3 (ix)
	inc	hl
	sbc	a, (hl)
	ld	-7 (ix), a
	ld	a, -2 (ix)
	inc	hl
	sbc	a, (hl)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	ld	-5 (ix), a
;./document.c:211: u16 count = distance > COPY_SIZE ? COPY_SIZE : (u16)distance;
	ld	a, #0x80
	cp	a, -8 (ix)
	ld	a, #0x00
	sbc	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	ld	a, #0x00
	sbc	a, -5 (ix)
	jr	nc, 00111$
	ld	bc, #0x0080
	jr	00112$
00111$:
	pop	hl
	pop	bc
	push	bc
	push	hl
00112$:
;./document.c:212: ReadPhysical(s_GapEnd, count);
	push	bc
	push	bc
	ld	de, (_s_GapEnd)
	ld	hl, (_s_GapEnd + 2)
	call	_ReadPhysical
	pop	bc
;./document.c:213: WritePhysical(s_GapStart, count);
	push	bc
	push	bc
	ld	de, (_s_GapStart)
	ld	hl, (_s_GapStart + 2)
	call	_WritePhysical
	pop	bc
;./document.c:214: s_GapStart += count;
	ld	de, #0x0000
	ld	a, c
	ld	hl, #_s_GapStart
	add	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, b
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, d
	adc	a, (hl)
	ld	(hl), a
;./document.c:215: s_GapEnd += count;
	ld	a, c
	ld	hl, #_s_GapEnd
	add	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, b
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, d
	adc	a, (hl)
	ld	(hl), a
	jp	00104$
00107$:
;./document.c:217: }
	ld	sp, ix
	pop	ix
	ret
;./document.c:219: bool Document_Insert(u32 pos, u8 chr, u16 count)
;	---------------------------------
; Function Document_Insert
; ---------------------------------
_Document_Insert::
	push	ix
	ld	ix,	#0
	add	ix, sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
;./document.c:221: if (count > g_DocumentCapacity - g_DocumentLength)
	ld	hl, #_g_DocumentLength
	ld	a, (_g_DocumentCapacity+0)
	sub	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (_g_DocumentCapacity+1)
	sbc	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (_g_DocumentCapacity+2)
	sbc	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (_g_DocumentCapacity+3)
	sbc	a, (hl)
	ld	-5 (ix), a
	ld	a, 5 (ix)
	ld	-4 (ix), a
	ld	a, 6 (ix)
	ld	-3 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	ld	a, -8 (ix)
	sub	a, -4 (ix)
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	a, -6 (ix)
	sbc	a, -2 (ix)
	ld	a, -5 (ix)
	sbc	a, -1 (ix)
	jr	nc, 00102$
;./document.c:222: return FALSE;
	xor	a, a
	jp	00110$
00102$:
;./document.c:223: MoveGap(pos);
	ld	l, c
	ld	h, b
	call	_MoveGap
;./document.c:224: while (count)
00104$:
	ld	a, 6 (ix)
	or	a, 5 (ix)
	jr	z, 00106$
;./document.c:226: u16 size = BankCount(s_GapStart, count);
	ld	l, 5 (ix)
	ld	h, 6 (ix)
	push	hl
	ld	de, (_s_GapStart)
	ld	hl, (_s_GapStart + 2)
	call	_BankCount
	ld	-2 (ix), e
	ld	-1 (ix), d
;./document.c:227: u8* dest = Address(s_GapStart);
	ld	de, (_s_GapStart)
	ld	hl, (_s_GapStart + 2)
	call	_Address
;./document.c:228: for (u16 i = 0; i < size; ++i)
	ld	bc, #0x0000
00108$:
	ld	a, c
	sub	a, -2 (ix)
	ld	a, b
	sbc	a, -1 (ix)
	jr	nc, 00103$
;./document.c:229: *dest++ = chr;
	ld	a, 4 (ix)
	ld	(de), a
	inc	de
;./document.c:228: for (u16 i = 0; i < size; ++i)
	inc	bc
	jr	00108$
00103$:
;./document.c:230: s_GapStart += size;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	de, #0x0000
	ld	a, c
	ld	hl, #_s_GapStart
	add	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, b
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, d
	adc	a, (hl)
	ld	(hl), a
;./document.c:231: g_DocumentLength += size;
	ld	a, c
	ld	hl, #_g_DocumentLength
	add	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, b
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, d
	adc	a, (hl)
	ld	(hl), a
;./document.c:232: count -= size;
	ld	a, 5 (ix)
	sub	a, -2 (ix)
	ld	5 (ix), a
	ld	a, 6 (ix)
	sbc	a, -1 (ix)
	ld	6 (ix), a
	jp	00104$
00106$:
;./document.c:234: return TRUE;
	ld	a, #0x01
00110$:
;./document.c:235: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	inc	sp
	jp	(hl)
;./document.c:237: void Document_Delete(u32 pos)
;	---------------------------------
; Function Document_Delete
; ---------------------------------
_Document_Delete::
	ld	c, l
	ld	b, h
;./document.c:239: if (pos == g_DocumentLength)
	ld	hl, (_g_DocumentLength)
	xor	a, a
	sbc	hl, de
	jr	nz, 00102$
	ld	hl, (_g_DocumentLength + 2)
	xor	a, a
	sbc	hl, bc
	ret	z
;./document.c:240: return;
00102$:
;./document.c:241: MoveGap(pos);
	ld	l, c
	ld	h, b
	call	_MoveGap
;./document.c:242: ++s_GapEnd;
	ld	iy, #_s_GapEnd
	inc	0 (iy)
	jr	nz, 00115$
	inc	1 (iy)
	jr	nz, 00115$
	inc	2 (iy)
	jr	nz, 00115$
	inc	3 (iy)
00115$:
;./document.c:243: --g_DocumentLength;
	ld	hl, #_g_DocumentLength
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
;./document.c:244: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
