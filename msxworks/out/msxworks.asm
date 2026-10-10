;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module msxworks
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _RunMenus
	.globl _ConfirmExit
	.globl _ShowMessage
	.globl _DrawMenu
	.globl _DrawDesktop
	.globl _WaitInput
	.globl _ReleaseMenuKeys
	.globl _ClearKeyBuffer
	.globl _PollKey
	.globl _ReadMenuRow
	.globl _ShowReportWindow
	.globl _DrawBar
	.globl _WaitKey
	.globl _PrintReport
	.globl _CheckEnvironment
	.globl _PrintCheck
	.globl _PrintSegments
	.globl _PrintSlot
	.globl _PrintBCD
	.globl _PrintU16
	.globl _PrintSeparator
	.globl _PrintLn
	.globl _Print
	.globl _PrintChar
	.globl _GetOSInfo
	.globl _Document_Close
	.globl _Document_Init
	.globl _Editor_Input
	.globl _Editor_ToggleWrap
	.globl _Editor_Invalidate
	.globl _Editor_Draw
	.globl _Editor_Init
	.globl _Scr_DrawSeparator
	.globl _Scr_DrawWindow
	.globl _Scr_SetBlink
	.globl _Scr_Fill
	.globl _Scr_PutChar
	.globl _Scr_Puts
	.globl _Scr_Locate
	.globl _Scr_Restore
	.globl _Scr_Init
	.globl _DOSMapper_Init
	.globl _VDP_GetVersion
	.globl _DOS_InterSlotRead
	.globl _DOS_CharOutput
	.globl _Keyboard_Read
	.globl _g_ScrMode
	.globl _g_KeyRow8
	.globl _g_KeyRow7
	.globl _g_NumMappers
	.globl _g_FreeSeg
	.globl _g_TotalSeg
	.globl _g_MapperOK
	.globl _g_VDPVer
	.globl _g_MSXVer
	.globl _g_DOS2
	.globl _g_Line
	.globl _g_OS
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
	.globl _g_Menus
	.globl _g_HelpItems
	.globl _g_OptionItems
	.globl _g_ViewItems
	.globl _g_LayoutItems
	.globl _g_PendingItems
	.globl _g_FileItems
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
_g_OS::
	.ds 9
_g_Line::
	.ds 1
_g_DOS2::
	.ds 1
_g_MSXVer::
	.ds 1
_g_VDPVer::
	.ds 1
_g_MapperOK::
	.ds 1
_g_TotalSeg::
	.ds 2
_g_FreeSeg::
	.ds 2
_g_NumMappers::
	.ds 1
_g_KeyRow7::
	.ds 1
_g_KeyRow8::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_ScrMode::
	.ds 1
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
;./msxworks.c:62: void GetOSInfo(OSInfo* info) __NAKED
;	---------------------------------
; Function GetOSInfo
; ---------------------------------
_GetOSInfo::
;./msxworks.c:118: __endasm;
	push ix
	push iy
	push hl
	ld b, #0
	ld c, #0x6F
	call 0x0005
	pop hl
	ld (hl), a
	inc hl
	ld (hl), b
	or a
	jr nz, getosinfo_end
	ld a, b
	cp #2
	jr c, getosinfo_end
	push hl
	ld ix, #0
	ld b, #0x5A
	ld hl, #0x1234
	ld de, #0xABCD
	ld c, #0x6F
	call 0x0005
	pop hl
	ld (hl), b
	inc hl
	ld (hl), c
	inc hl
	ld (hl), d
	inc hl
	ld (hl), e
	inc hl
	push ix
	pop de
	ld (hl), d
	inc hl
	ld (hl), e
	inc hl
	push iy
	pop de
	ld (hl), d
	inc hl
	ld (hl), e
getosinfo_end:
	pop iy
	pop ix
	ret
;./msxworks.c:119: }
;./msxworks.c:139: void PrintChar(c8 chr)
;	---------------------------------
; Function PrintChar
; ---------------------------------
_PrintChar::
	ld	c, a
;./msxworks.c:141: if (g_ScrMode)
	ld	a, (_g_ScrMode+0)
	or	a, a
	jr	z, 00102$
;./msxworks.c:142: Scr_PutChar(chr);
	ld	a, c
	jp	_Scr_PutChar
00102$:
;./msxworks.c:144: DOS_CharOutput(chr);
	ld	a, c
;./msxworks.c:145: }
	jp	_DOS_CharOutput
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
;./msxworks.c:149: void Print(const c8* str)
;	---------------------------------
; Function Print
; ---------------------------------
_Print::
	ex	de, hl
;./msxworks.c:151: if (g_ScrMode)
	ld	a, (_g_ScrMode+0)
	or	a, a
	jr	z, 00114$
;./msxworks.c:152: Scr_Puts(str);
	ex	de, hl
	jp	_Scr_Puts
;./msxworks.c:154: while (*str)
00114$:
00101$:
	ld	a, (de)
	or	a, a
	ret	z
;./msxworks.c:155: DOS_CharOutput(*str++);
	inc	de
	push	de
	call	_DOS_CharOutput
	pop	de
;./msxworks.c:156: }
	jr	00101$
;./msxworks.c:160: void PrintLn(const c8* str)
;	---------------------------------
; Function PrintLn
; ---------------------------------
_PrintLn::
;./msxworks.c:162: Print(str);
	call	_Print
;./msxworks.c:163: if (g_ScrMode)
	ld	a, (_g_ScrMode+0)
	or	a, a
	jr	z, 00102$
;./msxworks.c:164: Scr_Locate(WIN_TEXT_X, ++g_Line);
	ld	hl, #_g_Line
	inc	(hl)
	ld	a, (_g_Line)
	ld	l, a
	ld	a, #0x13
	jp	_Scr_Locate
00102$:
;./msxworks.c:166: Print("\r\n");
	ld	hl, #___str_1
;./msxworks.c:167: }
	jp	_Print
___str_1:
	.db 0x0d
	.db 0x0a
	.db 0x00
;./msxworks.c:171: void PrintSeparator()
;	---------------------------------
; Function PrintSeparator
; ---------------------------------
_PrintSeparator::
;./msxworks.c:173: if (g_ScrMode)
	ld	a, (_g_ScrMode+0)
	or	a, a
	jr	z, 00102$
;./msxworks.c:175: Scr_DrawSeparator(WIN_X, g_Line, WIN_WIDTH);
	ld	a, #0x30
	push	af
	inc	sp
	ld	a, (_g_Line)
	ld	l, a
	ld	a, #0x10
	call	_Scr_DrawSeparator
;./msxworks.c:176: Scr_Locate(WIN_TEXT_X, ++g_Line);
	ld	hl, #_g_Line
	inc	(hl)
	ld	a, (_g_Line)
	ld	l, a
	ld	a, #0x13
	jp	_Scr_Locate
00102$:
;./msxworks.c:179: PrintLn("-----------------------------------");
	ld	hl, #___str_2
;./msxworks.c:180: }
	jp	_PrintLn
___str_2:
	.ascii "-----------------------------------"
	.db 0x00
;./msxworks.c:184: void PrintU16(u16 val)
;	---------------------------------
; Function PrintU16
; ---------------------------------
_PrintU16::
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	af
	push	af
	dec	sp
	ld	c, l
	ld	b, h
;./msxworks.c:188: buf[5] = 0;
	ld	-2 (ix), #0x00
;./msxworks.c:189: do
	ld	-1 (ix), #0x05
00101$:
;./msxworks.c:191: buf[--i] = '0' + (val % 10);
	dec	-1 (ix)
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	push	hl
	push	bc
	ld	de, #0x000a
	ld	l, c
	ld	h, b
	call	__moduint
	pop	bc
	pop	hl
	ld	a, e
	add	a, #0x30
	ld	(hl), a
;./msxworks.c:192: val /= 10;
	push	hl
	ld	de, #0x000a
	ld	l, c
	ld	h, b
	call	__divuint
	pop	hl
	ld	a, e
	ld	c, a
	ld	b, d
;./msxworks.c:193: } while (val);
	or	a, d
	jr	nz, 00101$
;./msxworks.c:194: Print(&buf[i]);
	call	_Print
;./msxworks.c:195: }
	ld	sp, ix
	pop	ix
	ret
;./msxworks.c:199: void PrintBCD(u8 val)
;	---------------------------------
; Function PrintBCD
; ---------------------------------
_PrintBCD::
;./msxworks.c:201: PrintChar('0' + (val >> 4));
	ld	c, a
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	add	a, #0x30
	push	bc
	call	_PrintChar
	pop	bc
;./msxworks.c:202: PrintChar('0' + (val & 0x0F));
	ld	a, c
	and	a, #0x0f
	add	a, #0x30
;./msxworks.c:203: }
	jp	_PrintChar
;./msxworks.c:207: void PrintSlot(u8 slot)
;	---------------------------------
; Function PrintSlot
; ---------------------------------
_PrintSlot::
;./msxworks.c:209: PrintChar('0' + (slot & 0x03));
	ld	c, a
	and	a, #0x03
	add	a, #0x30
	push	bc
	call	_PrintChar
	pop	bc
;./msxworks.c:210: if (slot & 0x80)
	bit	7, c
	ret	z
;./msxworks.c:212: PrintChar('-');
	push	bc
	ld	a, #0x2d
	call	_PrintChar
	pop	bc
;./msxworks.c:213: PrintChar('0' + ((slot >> 2) & 0x03));
	ld	a, c
	rrca
	rrca
	and	a, #0x3
	add	a, #0x30
;./msxworks.c:215: }
	jp	_PrintChar
;./msxworks.c:219: void PrintSegments(const c8* label, u16 seg)
;	---------------------------------
; Function PrintSegments
; ---------------------------------
_PrintSegments::
;./msxworks.c:221: Print(label);
	push	de
	call	_Print
	pop	de
;./msxworks.c:222: PrintU16(seg);
	ex	de, hl
	push	hl
	call	_PrintU16
;./msxworks.c:223: Print(" segments (");
	ld	hl, #___str_3
	call	_Print
	pop	de
;./msxworks.c:224: PrintU16(seg * SEGMENT_KB);
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	call	_PrintU16
;./msxworks.c:225: PrintLn(" KB)");
	ld	hl, #___str_4
;./msxworks.c:226: }
	jp	_PrintLn
___str_3:
	.ascii " segments ("
	.db 0x00
___str_4:
	.ascii " KB)"
	.db 0x00
;./msxworks.c:230: void PrintCheck(bool ok)
;	---------------------------------
; Function PrintCheck
; ---------------------------------
_PrintCheck::
;./msxworks.c:232: PrintLn(ok ? " [OK]" : " [FAIL]");
	or	a, a
	jr	z, 00103$
	ld	hl, #___str_5+0
	jp	_PrintLn
00103$:
	ld	hl, #___str_6+0
;./msxworks.c:233: }
	jp	_PrintLn
___str_5:
	.ascii " [OK]"
	.db 0x00
___str_6:
	.ascii " [FAIL]"
	.db 0x00
;./msxworks.c:249: bool CheckEnvironment()
;	---------------------------------
; Function CheckEnvironment
; ---------------------------------
_CheckEnvironment::
;./msxworks.c:251: GetOSInfo(&g_OS);
	ld	hl, #_g_OS
	call	_GetOSInfo
;./msxworks.c:252: g_DOS2 = (g_OS.Error == 0) && (g_OS.KernelMajor >= 2);
	ld	a, (#_g_OS + 0)
	or	a, a
	jr	nz, 00111$
	ld	a, (#_g_OS + 1)
	sub	a, #0x02
	jr	nc, 00112$
00111$:
	xor	a, a
	jr	00113$
00112$:
	ld	a, #0x01
00113$:
	ld	(#_g_DOS2), a
;E:\msxworks\MSXgl\engine/src/system.h:119: inline u8 Peek(u16 addr) { return *(u8*)addr; }
	ld	a, (#0xfcc1)
;E:\msxworks\MSXgl\engine/src/system.h:177: inline u8 Sys_GetMSXVersion() { return DOS_InterSlotRead(Peek(M_EXPTBL), R_MSXVER); } 
	ld	de, #0x002d
	call	_DOS_InterSlotRead
;./msxworks.c:254: g_MSXVer = Sys_GetMSXVersion();
	ld	(#_g_MSXVer), a
;./msxworks.c:255: g_VDPVer = VDP_GetVersion();
	call	_VDP_GetVersion
	ld	(#_g_VDPVer), a
;./msxworks.c:257: g_TotalSeg = 0;
	ld	hl, #0x0000
	ld	(_g_TotalSeg), hl
;./msxworks.c:258: g_FreeSeg = 0;
	ld	(_g_FreeSeg), hl
;./msxworks.c:259: g_NumMappers = 0;
	xor	a, a
	ld	(#_g_NumMappers), a
;./msxworks.c:260: g_MapperOK = g_DOS2 && DOSMapper_Init();
	ld	a, (_g_DOS2+0)
	or	a, a
	jr	z, 00114$
	call	_DOSMapper_Init
	or	a, a
	jr	nz, 00115$
00114$:
	xor	a, a
	jr	00116$
00115$:
	ld	a, #0x01
00116$:
	ld	(#_g_MapperOK), a
;./msxworks.c:261: if (g_MapperOK)
	ld	a, (_g_MapperOK+0)
	or	a, a
	jr	z, 00105$
;./msxworks.c:263: const DOS_VarTable* tab = DOSMapper_GetVarTable();
	ld	de, (_g_DOS_VarTable)
;./msxworks.c:264: while (tab->Slot != 0)
00101$:
	ld	a, (de)
	or	a, a
	jr	z, 00105$
;./msxworks.c:266: g_TotalSeg += tab->NumSeg;
	ld	l, e
	ld	h, d
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, (_g_TotalSeg)
	add	hl, bc
	ld	(_g_TotalSeg), hl
;./msxworks.c:267: g_FreeSeg += tab->FreeSeg;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, (_g_FreeSeg)
	add	hl, bc
	ld	(_g_FreeSeg), hl
;./msxworks.c:268: g_NumMappers++;
	ld	hl, #_g_NumMappers
	inc	(hl)
;./msxworks.c:269: tab++;
	ld	hl, #0x0008
	add	hl, de
	ex	de, hl
	jr	00101$
00105$:
;./msxworks.c:273: return g_DOS2 && (g_MSXVer >= MSXVER_2P) && (g_TotalSeg >= MIN_SEGMENTS);
	ld	a, (_g_DOS2+0)
	or	a, a
	jr	z, 00117$
	ld	a, (_g_MSXVer+0)
	sub	a, #0x02
	jr	c, 00117$
	ld	de, #0x0010
	ld	hl, (_g_TotalSeg)
	cp	a, a
	sbc	hl, de
	jr	nc, 00118$
00117$:
	xor	a, a
	ret
00118$:
	ld	a, #0x01
;./msxworks.c:274: }
	ret
;./msxworks.c:278: void PrintReport(bool envOK)
;	---------------------------------
; Function PrintReport
; ---------------------------------
_PrintReport::
	call	___sdcc_enter_ix
	push	af
	dec	sp
	ld	-1 (ix), a
;./msxworks.c:280: if (!g_ScrMode)
	ld	a, (_g_ScrMode+0)
	or	a, a
	jr	nz, 00102$
;./msxworks.c:282: PrintLn("Environment check");
	ld	hl, #___str_7
	call	_PrintLn
;./msxworks.c:283: PrintSeparator();
	call	_PrintSeparator
00102$:
;./msxworks.c:287: Print("MSX-DOS : ");
	ld	hl, #___str_8
	call	_Print
;./msxworks.c:288: if (!g_DOS2)
	ld	a, (_g_DOS2+0)
	or	a, a
	jr	nz, 00107$
;./msxworks.c:290: Print("1.x or unknown");
	ld	hl, #___str_9
	call	_Print
	jr	00108$
00107$:
;./msxworks.c:292: else if (g_OS.NextorID == 1)
	ld	a, (#_g_OS + 5)
	cp	a, #0x01
	jr	nz, 00104$
;./msxworks.c:294: Print("Nextor ");
	ld	hl, #___str_10
	call	_Print
;./msxworks.c:295: PrintU16(g_OS.NextorMajor);
	ld	hl, #_g_OS + 6
	ld	l, (hl)
	ld	h, #0x00
	call	_PrintU16
;./msxworks.c:296: PrintChar('.');
	ld	a, #0x2e
	call	_PrintChar
;./msxworks.c:297: PrintU16(g_OS.NextorSecondary);
	ld	hl, #_g_OS + 7
	ld	l, (hl)
	ld	h, #0x00
	call	_PrintU16
;./msxworks.c:298: PrintChar('.');
	ld	a, #0x2e
	call	_PrintChar
;./msxworks.c:299: PrintU16(g_OS.NextorRevision);
	ld	hl, #_g_OS + 8
	ld	l, (hl)
	ld	h, #0x00
	call	_PrintU16
	jr	00108$
00104$:
;./msxworks.c:303: Print("MSX-DOS ");
	ld	hl, #___str_11
	call	_Print
;./msxworks.c:304: PrintU16(g_OS.KernelMajor);
	ld	hl, #_g_OS + 1
	ld	l, (hl)
	ld	h, #0x00
	call	_PrintU16
;./msxworks.c:305: PrintChar('.');
	ld	a, #0x2e
	call	_PrintChar
;./msxworks.c:306: PrintBCD(g_OS.KernelMinor);
	ld	a, (#_g_OS + 2)
	call	_PrintBCD
;./msxworks.c:307: Print(" (SYS ");
	ld	hl, #___str_12
	call	_Print
;./msxworks.c:308: PrintU16(g_OS.SystemMajor);
	ld	hl, #_g_OS + 3
	ld	l, (hl)
	ld	h, #0x00
	call	_PrintU16
;./msxworks.c:309: PrintChar('.');
	ld	a, #0x2e
	call	_PrintChar
;./msxworks.c:310: PrintBCD(g_OS.SystemMinor);
	ld	a, (#_g_OS + 4)
	call	_PrintBCD
;./msxworks.c:311: PrintChar(')');
	ld	a, #0x29
	call	_PrintChar
00108$:
;./msxworks.c:313: PrintCheck(g_DOS2);
	ld	a, (_g_DOS2)
	call	_PrintCheck
;./msxworks.c:316: Print("MSX     : ");
	ld	hl, #___str_13
	call	_Print
;./msxworks.c:317: switch (g_MSXVer)
	ld	a, (_g_MSXVer+0)
	or	a, a
	jr	z, 00109$
	ld	a, (_g_MSXVer)
	dec	a
	jr	z, 00110$
	ld	a, (_g_MSXVer)
	cp	a, #0x02
	jr	z, 00111$
	sub	a, #0x03
	jr	z, 00112$
	jr	00113$
;./msxworks.c:319: case MSXVER_1:  Print("MSX1"); break;
00109$:
	ld	hl, #___str_14
	call	_Print
	jr	00114$
;./msxworks.c:320: case MSXVER_2:  Print("MSX2"); break;
00110$:
	ld	hl, #___str_15
	call	_Print
	jr	00114$
;./msxworks.c:321: case MSXVER_2P: Print("MSX2+"); break;
00111$:
	ld	hl, #___str_16
	call	_Print
	jr	00114$
;./msxworks.c:322: case MSXVER_TR: Print("MSX turbo R"); break;
00112$:
	ld	hl, #___str_17
	call	_Print
	jr	00114$
;./msxworks.c:323: default:        Print("Unknown ("); PrintU16(g_MSXVer); PrintChar(')'); break;
00113$:
	ld	hl, #___str_18
	call	_Print
	ld	a, (_g_MSXVer)
	ld	h, #0x00
	ld	l, a
	call	_PrintU16
	ld	a, #0x29
	call	_PrintChar
;./msxworks.c:324: }
00114$:
;./msxworks.c:325: PrintCheck(g_MSXVer >= MSXVER_2P);
	ld	a, (_g_MSXVer+0)
	sub	a, #0x02
	ld	a, #0x00
	rla
	xor	a, #0x01
	call	_PrintCheck
;./msxworks.c:328: Print("VDP     : ");
	ld	hl, #___str_19
	call	_Print
;./msxworks.c:329: switch (g_VDPVer)
	ld	a, (_g_VDPVer+0)
	or	a, a
	jr	z, 00115$
	ld	a, (_g_VDPVer)
	dec	a
	jr	z, 00116$
	ld	a, (_g_VDPVer)
	sub	a, #0x02
	jr	z, 00117$
	jr	00118$
;./msxworks.c:331: case VDP_VERSION_TMS9918A: PrintLn("TMS9918A"); break;
00115$:
	ld	hl, #___str_20
	call	_PrintLn
	jr	00119$
;./msxworks.c:332: case VDP_VERSION_V9938:    PrintLn("V9938"); break;
00116$:
	ld	hl, #___str_21
	call	_PrintLn
	jr	00119$
;./msxworks.c:333: case VDP_VERSION_V9958:    PrintLn("V9958"); break;
00117$:
	ld	hl, #___str_22
	call	_PrintLn
	jr	00119$
;./msxworks.c:334: default:                   PrintLn("Unknown"); break;
00118$:
	ld	hl, #___str_23
	call	_PrintLn
;./msxworks.c:335: }
00119$:
;./msxworks.c:338: if (g_MapperOK)
	ld	a, (_g_MapperOK+0)
	or	a, a
	jp	z, 00125$
;./msxworks.c:340: const DOS_VarTable* tab = DOSMapper_GetVarTable();
	ld	bc, (_g_DOS_VarTable)
;./msxworks.c:342: while ((tab->Slot != 0) && (idx < WIN_MAX_MAPPERS))
	ld	e, #0x00
00121$:
	pop	hl
	push	bc
	pop	hl
	push	hl
	ld	d, (hl)
	ld	a, d
	or	a, a
	jr	z, 00123$
	ld	a, e
	sub	a, #0x08
	jr	nc, 00123$
;./msxworks.c:344: Print("Mapper ");
	push	bc
	push	de
	ld	hl, #___str_24
	call	_Print
	pop	de
	pop	bc
;./msxworks.c:345: PrintU16(idx);
	ld	l, e
	ld	h, #0x00
	push	bc
	push	de
	call	_PrintU16
;./msxworks.c:346: Print(" (slot ");
	ld	hl, #___str_25
	call	_Print
	pop	de
	pop	bc
;./msxworks.c:347: PrintSlot(tab->Slot);
	pop	hl
	push	hl
	ld	a, (hl)
	push	bc
	push	de
	call	_PrintSlot
;./msxworks.c:348: Print("): ");
	ld	hl, #___str_26
	call	_Print
	pop	de
	pop	bc
;./msxworks.c:349: PrintU16(tab->NumSeg);
	ld	l, c
	ld	h, b
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	push	de
	call	_PrintU16
;./msxworks.c:350: Print(" seg, ");
	ld	hl, #___str_27
	call	_Print
	pop	de
	pop	bc
;./msxworks.c:351: PrintU16(tab->FreeSeg);
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	push	de
	call	_PrintU16
;./msxworks.c:352: PrintLn(" free");
	ld	hl, #___str_28
	call	_PrintLn
	pop	de
	pop	bc
;./msxworks.c:353: tab++;
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
;./msxworks.c:354: idx++;
	inc	e
	jr	00121$
00123$:
;./msxworks.c:356: PrintSegments("RAM total: ", g_TotalSeg);
	ld	de, (_g_TotalSeg)
	ld	hl, #___str_29
	call	_PrintSegments
;./msxworks.c:357: PrintSegments("RAM free : ", g_FreeSeg);
	ld	de, (_g_FreeSeg)
	ld	hl, #___str_30
	call	_PrintSegments
	jr	00126$
00125$:
;./msxworks.c:361: PrintLn("RAM     : mapper info not available");
	ld	hl, #___str_31
	call	_PrintLn
00126$:
;./msxworks.c:363: Print("RAM >= ");
	ld	hl, #___str_32
	call	_Print
;./msxworks.c:364: PrintU16(MIN_RAM_KB);
	ld	hl, #0x0100
	call	_PrintU16
;./msxworks.c:365: Print(" KB");
	ld	hl, #___str_33
	call	_Print
;./msxworks.c:366: PrintCheck(g_TotalSeg >= MIN_SEGMENTS);
	ld	de, #0x0010
	ld	hl, (_g_TotalSeg)
	cp	a, a
	sbc	hl, de
	ld	a, #0x00
	rla
	xor	a, #0x01
	call	_PrintCheck
;./msxworks.c:368: PrintSeparator();
	call	_PrintSeparator
;./msxworks.c:369: if (envOK)
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00128$
;./msxworks.c:370: PrintLn("Environment OK. MSX-Works can run.");
	ld	hl, #___str_34
	call	_PrintLn
	jr	00131$
00128$:
;./msxworks.c:372: PrintLn("Unsupported environment. Requires MSX2+, MSX-DOS 2 and 256 KB RAM.");
	ld	hl, #___str_35
	call	_PrintLn
00131$:
;./msxworks.c:373: }
	ld	sp, ix
	pop	ix
	ret
___str_7:
	.ascii "Environment check"
	.db 0x00
___str_8:
	.ascii "MSX-DOS : "
	.db 0x00
___str_9:
	.ascii "1.x or unknown"
	.db 0x00
___str_10:
	.ascii "Nextor "
	.db 0x00
___str_11:
	.ascii "MSX-DOS "
	.db 0x00
___str_12:
	.ascii " (SYS "
	.db 0x00
___str_13:
	.ascii "MSX     : "
	.db 0x00
___str_14:
	.ascii "MSX1"
	.db 0x00
___str_15:
	.ascii "MSX2"
	.db 0x00
___str_16:
	.ascii "MSX2+"
	.db 0x00
___str_17:
	.ascii "MSX turbo R"
	.db 0x00
___str_18:
	.ascii "Unknown ("
	.db 0x00
___str_19:
	.ascii "VDP     : "
	.db 0x00
___str_20:
	.ascii "TMS9918A"
	.db 0x00
___str_21:
	.ascii "V9938"
	.db 0x00
___str_22:
	.ascii "V9958"
	.db 0x00
___str_23:
	.ascii "Unknown"
	.db 0x00
___str_24:
	.ascii "Mapper "
	.db 0x00
___str_25:
	.ascii " (slot "
	.db 0x00
___str_26:
	.ascii "): "
	.db 0x00
___str_27:
	.ascii " seg, "
	.db 0x00
___str_28:
	.ascii " free"
	.db 0x00
___str_29:
	.ascii "RAM total: "
	.db 0x00
___str_30:
	.ascii "RAM free : "
	.db 0x00
___str_31:
	.ascii "RAM     : mapper info not available"
	.db 0x00
___str_32:
	.ascii "RAM >= "
	.db 0x00
___str_33:
	.ascii " KB"
	.db 0x00
___str_34:
	.ascii "Environment OK. MSX-Works can run."
	.db 0x00
___str_35:
	.ascii "Unsupported environment. Requires MSX2+, MSX-DOS 2 and 256 K"
	.ascii "B RAM."
	.db 0x00
;./msxworks.c:379: u8 WaitKey() __NAKED
;	---------------------------------
; Function WaitKey
; ---------------------------------
_WaitKey::
;./msxworks.c:391: __endasm;
	push ix
waitkey_loop:
	ld e, #0xFF
	ld c, #0x06
	call 0x0005
	or a
	jr z, waitkey_loop
	pop ix
	ret
;./msxworks.c:392: }
;./msxworks.c:403: void DrawBar(u8 y, const c8* left, const c8* right)
;	---------------------------------
; Function DrawBar
; ---------------------------------
_DrawBar::
	dec	sp
	ld	iy, #0
	add	iy, sp
;./screen.h:90: inline void Scr_FillAt(u8 x, u8 y, u8 chr, u16 len) { Scr_Locate(x, y); Scr_Fill(chr, len); }
	ld	0 (iy), a
	push	de
	ld	l, a
	xor	a, a
	call	_Scr_Locate
	ld	de, #0x0050
	ld	a, #0x20
	call	_Scr_Fill
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	ld	iy, #2
	add	iy, sp
	ld	l, 0 (iy)
	ld	a, #0x01
	call	_Scr_Locate
	pop	de
	ex	de, hl
	call	_Scr_Puts
;./msxworks.c:407: if (right)
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	z, 00105$
;./msxworks.c:410: while (right[len])
	ld	c, #0x00
00101$:
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	z, 00103$
;./msxworks.c:411: len++;
	inc	c
	jr	00101$
00103$:
;./msxworks.c:412: Scr_PrintAt(SCR_WIDTH - 1 - len, y, right);
	ld	hl, #3
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x4f
	sub	a, c
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	push	de
	ld	iy, #2
	add	iy, sp
	ld	l, 0 (iy)
	call	_Scr_Locate
	pop	de
	ex	de, hl
	call	_Scr_Puts
;./msxworks.c:412: Scr_PrintAt(SCR_WIDTH - 1 - len, y, right);
00105$:
;./msxworks.c:414: Scr_SetBlink(0, y, SCR_WIDTH, TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #0x0050
	push	hl
	ld	iy, #3
	add	iy, sp
	ld	l, 0 (iy)
	xor	a, a
	call	_Scr_SetBlink
;./msxworks.c:415: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;./msxworks.c:420: void ShowReportWindow()
;	---------------------------------
; Function ShowReportWindow
; ---------------------------------
_ShowReportWindow::
;./msxworks.c:422: u8 mappers = (g_NumMappers < WIN_MAX_MAPPERS) ? g_NumMappers : WIN_MAX_MAPPERS;
	ld	a, (_g_NumMappers+0)
	sub	a, #0x08
	jr	nc, 00110$
	ld	a, (_g_NumMappers)
	jr	00111$
00110$:
	ld	a, #0x08
00111$:
;./msxworks.c:425: u8 h = mappers + 13;
	add	a, #0x0d
	ld	h, a
;./msxworks.c:426: u8 y = 1 + (SCR_HEIGHT - 2 - h) / 2;
	ld	c, h
	ld	a, #0x16
	sub	a, c
	ld	c, a
	sbc	a, a
	ld	b, a
	ld	e, c
	ld	d, b
	bit	7, b
	jr	z, 00112$
	ld	e, c
	ld	d, b
	inc	de
00112$:
	sra	d
	rr	e
	ld	l, e
	inc	l
;./msxworks.c:428: Scr_DrawWindow(WIN_X, y, WIN_WIDTH, h, "Environment check");
	push	hl
	ld	de, #___str_37
	push	de
	push	hl
	inc	sp
	ld	a, #0x30
	push	af
	inc	sp
	ld	a, #0x10
	call	_Scr_DrawWindow
	pop	hl
;./msxworks.c:430: g_Line = y + 2;
	ld	a, l
	add	a, #0x02
	ld	(_g_Line+0), a
;./msxworks.c:431: Scr_Locate(WIN_TEXT_X, g_Line);
	push	hl
	ld	a, (_g_Line)
	ld	l, a
	ld	a, #0x13
	call	_Scr_Locate
;./msxworks.c:432: PrintReport(TRUE);
	ld	a, #0x01
	call	_PrintReport
	pop	hl
;./msxworks.c:438: u8 btnY = y + h - 2;
	ld	a, h
	add	a, l
	add	a, #0xfe
	ld	l, a
;./msxworks.c:439: Scr_PrintAt(btnX, btnY, BTN_TEXT);
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	push	hl
	ld	a, #0x24
	call	_Scr_Locate
	ld	hl, #__str_36
	call	_Scr_Puts
	pop	hl
;./msxworks.c:440: Scr_SetBlink(btnX, btnY, BTN_LEN, FALSE);
	xor	a, a
	push	af
	inc	sp
	ld	de, #0x0008
	push	de
	ld	a, #0x24
	call	_Scr_SetBlink
00106$:
;./msxworks.c:444: u8 key = WaitKey();
	call	_WaitKey
;./msxworks.c:445: if ((key == CHR_ENTER) || (key == CHR_ESC))
	cp	a, #0x0d
	ret	z
	cp	a, #0x1b
	jr	nz, 00106$
;./msxworks.c:446: break;
;./msxworks.c:448: }
	ret
__str_36:
	.ascii "[  OK  ]"
	.db 0x00
___str_37:
	.ascii "Environment check"
	.db 0x00
;./msxworks.c:511: u8 ReadMenuRow(u8 row)
;	---------------------------------
; Function ReadMenuRow
; ---------------------------------
_ReadMenuRow::
;E:\msxworks\MSXgl\engine/src/system.h:141: inline void DisableInterrupt() { __asm__("di"); }
	di
;./msxworks.c:514: u8 value = Keyboard_Read(row);
	ld	l, a
	call	_Keyboard_Read
	ld	a, l
;E:\msxworks\MSXgl\engine/src/system.h:137: inline void EnableInterrupt() { __asm__("ei"); }
	ei
;./msxworks.c:516: return value;
;./msxworks.c:517: }
	ret
_g_FileItems:
	.dw __str_38
	.db #0x00	; 0
_g_PendingItems:
	.dw __str_39
	.db #0x02	; 2
_g_LayoutItems:
	.dw __str_40
	.db #0x03	; 3
_g_ViewItems:
	.dw __str_41
	.db #0x05	; 5
	.dw __str_42
	.db #0x02	; 2
	.dw __str_43
	.db #0x02	; 2
	.dw __str_44
	.db #0x02	; 2
_g_OptionItems:
	.dw __str_45
	.db #0x04	; 4
_g_HelpItems:
	.dw __str_46
	.db #0x01	; 1
_g_Menus:
	.dw __str_47
	.db #0x01	; 1
	.db #0x0c	; 12
	.dw _g_FileItems
	.db #0x01	; 1
	.dw __str_48
	.db #0x07	; 7
	.db #0x15	; 21
	.dw _g_PendingItems
	.db #0x01	; 1
	.dw __str_49
	.db #0x0e	; 14
	.db #0x12	; 18
	.dw _g_LayoutItems
	.db #0x01	; 1
	.dw __str_50
	.db #0x1b	; 27
	.db #0x15	; 21
	.dw _g_PendingItems
	.db #0x01	; 1
	.dw __str_51
	.db #0x23	; 35
	.db #0x15	; 21
	.dw _g_PendingItems
	.db #0x01	; 1
	.dw __str_52
	.db #0x2a	; 42
	.db #0x14	; 20
	.dw _g_ViewItems
	.db #0x04	; 4
	.dw __str_53
	.db #0x30	; 48	'0'
	.db #0x13	; 19
	.dw _g_OptionItems
	.db #0x01	; 1
	.dw __str_54
	.db #0x4b	; 75	'K'
	.db #0x0c	; 12
	.dw _g_HelpItems
	.db #0x01	; 1
__str_38:
	.ascii "Exit"
	.db 0x00
__str_39:
	.ascii "(Not implemented)"
	.db 0x00
__str_40:
	.ascii "Word Wrap"
	.db 0x00
__str_41:
	.ascii "Text editor"
	.db 0x00
__str_42:
	.ascii "Word processor"
	.db 0x00
__str_43:
	.ascii "Spreadsheet"
	.db 0x00
__str_44:
	.ascii "Database"
	.db 0x00
__str_45:
	.ascii "Insert / Over"
	.db 0x00
__str_46:
	.ascii "About"
	.db 0x00
__str_47:
	.ascii "File"
	.db 0x00
__str_48:
	.ascii "Block"
	.db 0x00
__str_49:
	.ascii "Text-layout"
	.db 0x00
__str_50:
	.ascii "Search"
	.db 0x00
__str_51:
	.ascii "Print"
	.db 0x00
__str_52:
	.ascii "View"
	.db 0x00
__str_53:
	.ascii "Options"
	.db 0x00
__str_54:
	.ascii "HELP"
	.db 0x00
;./msxworks.c:521: u8 PollKey()
;	---------------------------------
; Function PollKey
; ---------------------------------
_PollKey::
;./msxworks.c:523: u8 chr = 0;
	ld	c, #0x00
;E:\msxworks\MSXgl\engine/src/system.h:141: inline void DisableInterrupt() { __asm__("di"); }
	di
;./msxworks.c:525: if (g_GETPNT != g_PUTPNT)
	ld	a, (_g_GETPNT)
	ld	iy, #_g_PUTPNT
	sub	a, 0 (iy)
	jr	nz, 00125$
	ld	a, (_g_GETPNT + 1)
	sub	a, 1 (iy)
	jr	z, 00104$
00125$:
;./msxworks.c:527: chr = *g_GETPNT++;
	ld	hl, (_g_GETPNT)
	ld	c, (hl)
	ld	hl, (_g_GETPNT)
	inc	hl
	ld	(_g_GETPNT), hl
;./msxworks.c:528: if (g_GETPNT == (const c8*)(M_KEYBUF + sizeof(g_KEYBUF)))
	ld	a, (_g_GETPNT)
	sub	a, #0x18
	jr	nz, 00104$
	ld	a, (_g_GETPNT + 1)
	sub	a, #0xfc
	jr	nz, 00104$
;./msxworks.c:529: g_GETPNT = (const c8*)M_KEYBUF;
	ld	hl, #0xfbf0
	ld	(_g_GETPNT), hl
00104$:
;E:\msxworks\MSXgl\engine/src/system.h:137: inline void EnableInterrupt() { __asm__("ei"); }
	ei
;./msxworks.c:532: return chr;
	ld	a, c
;./msxworks.c:533: }
	ret
;./msxworks.c:535: void ClearKeyBuffer()
;	---------------------------------
; Function ClearKeyBuffer
; ---------------------------------
_ClearKeyBuffer::
;E:\msxworks\MSXgl\engine/src/system.h:141: inline void DisableInterrupt() { __asm__("di"); }
	di
;./msxworks.c:538: g_GETPNT = g_PUTPNT;
	ld	hl, (_g_PUTPNT)
	ld	(_g_GETPNT), hl
;E:\msxworks\MSXgl\engine/src/system.h:137: inline void EnableInterrupt() { __asm__("ei"); }
	ei
;./msxworks.c:539: EnableInterrupt();
;./msxworks.c:540: }
	ret
;./msxworks.c:544: void ReleaseMenuKeys()
;	---------------------------------
; Function ReleaseMenuKeys
; ---------------------------------
_ReleaseMenuKeys::
;./msxworks.c:546: do
00104$:
;./msxworks.c:548: g_KeyRow7 = ReadMenuRow(7);
	ld	a, #0x07
	call	_ReadMenuRow
	ld	(#_g_KeyRow7), a
;./msxworks.c:549: g_KeyRow8 = ReadMenuRow(8);
	ld	a, #0x08
	call	_ReadMenuRow
	ld	(#_g_KeyRow8), a
;./msxworks.c:550: PollKey();
	call	_PollKey
;./msxworks.c:551: } while (IS_KEY_PRESSED(g_KeyRow7, KEY_ENTER)
	ld	hl, #_g_KeyRow7
	bit	7, (hl)
	jr	z, 00104$
;./msxworks.c:552: || IS_KEY_PRESSED(g_KeyRow7, KEY_ESC)
	ld	hl, #_g_KeyRow7
	bit	2, (hl)
	jr	z, 00104$
;./msxworks.c:553: || IS_KEY_PRESSED(g_KeyRow7, KEY_SELECT)
	ld	hl, #_g_KeyRow7
	bit	6, (hl)
	jr	z, 00104$
;./msxworks.c:554: || ((g_KeyRow8 & 0xF0) != 0xF0));
	ld	a, (_g_KeyRow8)
	and	a, #0xf0
	cp	a, #0xf0
	jp	z, _ClearKeyBuffer
;./msxworks.c:555: ClearKeyBuffer();
;./msxworks.c:556: }
	jr	00104$
;./msxworks.c:560: u16 WaitInput(bool menu)
;	---------------------------------
; Function WaitInput
; ---------------------------------
_WaitInput::
	call	___sdcc_enter_ix
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
00135$:
;./msxworks.c:564: u8 row7 = ReadMenuRow(7);
	ld	a, #0x07
	call	_ReadMenuRow
	ld	-8 (ix), a
;./msxworks.c:565: u8 row8 = ReadMenuRow(8);
	ld	a, #0x08
	call	_ReadMenuRow
	ld	-7 (ix), a
;./msxworks.c:566: u8 pushed7 = g_KeyRow7 & ~row7;
	ld	a, -8 (ix)
	cpl
	ld	c, a
	ld	a, (_g_KeyRow7+0)
	and	a, c
	ld	-6 (ix), a
;./msxworks.c:567: u8 pushed8 = g_KeyRow8 & ~row8;
	ld	a, -7 (ix)
	cpl
	ld	c, a
	ld	a, (_g_KeyRow8+0)
	and	a, c
	ld	-5 (ix), a
;./msxworks.c:568: g_KeyRow7 = row7;
	ld	a, -8 (ix)
	ld	(#_g_KeyRow7), a
;./msxworks.c:569: g_KeyRow8 = row8;
	ld	a, -7 (ix)
	ld	(#_g_KeyRow8), a
;./msxworks.c:570: u8 chr = PollKey();
	call	_PollKey
	ld	-4 (ix), a
;./msxworks.c:572: if (pushed7 & KEY_FLAG(KEY_SELECT)) return UI_SELECT;
	bit	6, -6 (ix)
	jr	z, 00102$
	ld	de, #0x0167
	jp	00137$
00102$:
;./msxworks.c:577: if (pushed8 & KEY_FLAG(KEY_LEFT)) return 0x100 | KEY_LEFT;
	ld	a, -5 (ix)
	and	a, #0x10
	ld	-3 (ix), a
;./msxworks.c:573: if (menu)
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00132$
;./msxworks.c:575: if (pushed7 & KEY_FLAG(KEY_ESC)) return 0x100 | KEY_ESC;
	bit	2, -6 (ix)
	jr	z, 00104$
	ld	de, #0x0127
	jp	00137$
00104$:
;./msxworks.c:576: if (pushed7 & KEY_FLAG(KEY_ENTER)) return 0x100 | KEY_ENTER;
	bit	7, -6 (ix)
	jr	z, 00106$
	ld	de, #0x0177
	jp	00137$
00106$:
;./msxworks.c:577: if (pushed8 & KEY_FLAG(KEY_LEFT)) return 0x100 | KEY_LEFT;
	ld	a, -3 (ix)
	or	a, a
	jr	z, 00108$
	ld	de, #0x0148
	jp	00137$
00108$:
;./msxworks.c:578: if (pushed8 & KEY_FLAG(KEY_RIGHT)) return 0x100 | KEY_RIGHT;
	bit	7, -5 (ix)
	jr	z, 00110$
	ld	de, #0x0178
	jp	00137$
00110$:
;./msxworks.c:579: if (pushed8 & KEY_FLAG(KEY_UP)) return 0x100 | KEY_UP;
	bit	5, -5 (ix)
	jr	z, 00112$
	ld	de, #0x0158
	jp	00137$
00112$:
;./msxworks.c:580: if (pushed8 & KEY_FLAG(KEY_DOWN)) return 0x100 | KEY_DOWN;
	bit	6, -5 (ix)
	jp	z, 00135$
	ld	de, #0x0168
	jp	00137$
00132$:
;./msxworks.c:584: bool ctrl = IS_KEY_PRESSED(ReadMenuRow(KEY_ROW(KEY_CTRL)), KEY_CTRL);
	ld	a, #0x06
	call	_ReadMenuRow
	and	a, #0x02
	ld	a, #0x01
	jr	z, 00326$
	xor	a, a
00326$:
	ld	-2 (ix), a
;./msxworks.c:585: if (pushed7 & KEY_FLAG(KEY_STOP))
	bit	4, -6 (ix)
	jr	z, 00116$
;./msxworks.c:587: ClearKeyBuffer();
	call	_ClearKeyBuffer
;./msxworks.c:588: return ctrl ? EDITOR_TEXT_END : ASCII_CLS;
	ld	a, -2 (ix)
	or	a, a
	jr	z, 00139$
	ld	de, #0x0204
	jp	00137$
00139$:
	ld	de, #0x000c
	jr	00137$
00116$:
;./msxworks.c:590: if (ctrl && (pushed8 & KEY_FLAG(KEY_HOME)))
	ld	a, -2 (ix)
	or	a, a
	jr	z, 00118$
	bit	1, -5 (ix)
	jr	z, 00118$
;./msxworks.c:592: ClearKeyBuffer();
	call	_ClearKeyBuffer
;./msxworks.c:593: return EDITOR_TEXT_START;
	ld	de, #0x0203
	jr	00137$
00118$:
;./msxworks.c:595: if (ctrl && (pushed8 & (KEY_FLAG(KEY_LEFT) | KEY_FLAG(KEY_RIGHT))))
	ld	a, -2 (ix)
	or	a, a
	jr	z, 00121$
	ld	a, -5 (ix)
	and	a, #0x90
	jr	z, 00121$
;./msxworks.c:597: ClearKeyBuffer();
	call	_ClearKeyBuffer
;./msxworks.c:598: return (pushed8 & KEY_FLAG(KEY_LEFT)) ? EDITOR_WORD_LEFT : EDITOR_WORD_RIGHT;
	ld	a, -3 (ix)
	or	a, a
	jr	z, 00141$
	ld	-3 (ix), #0x01
	ld	-2 (ix), #0x02
	jr	00142$
00141$:
	ld	-3 (ix), #0x02
	ld	-2 (ix), #0x02
00142$:
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	jr	00137$
00121$:
;./msxworks.c:600: if (chr && (chr != ASCII_SELECT) && !IS_KEY_PRESSED(row7, KEY_STOP)
	ld	a, -4 (ix)
	or	a, a
	jp	z, 00135$
	ld	a, -4 (ix)
	sub	a, #0x18
	jp	z, 00135$
	bit	4, -8 (ix)
	jp	z, 00135$
;./msxworks.c:601: && !(ctrl && (IS_KEY_PRESSED(row8, KEY_LEFT) || IS_KEY_PRESSED(row8, KEY_RIGHT)
	ld	a, -2 (ix)
	or	a, a
	jr	z, 00123$
	bit	4, -7 (ix)
	jp	z, 00135$
	bit	7, -7 (ix)
	jp	z, 00135$
;./msxworks.c:602: || IS_KEY_PRESSED(row8, KEY_HOME))))
	bit	1, -7 (ix)
	jp	z, 00135$
00123$:
;./msxworks.c:603: return chr;
	ld	e, -4 (ix)
	ld	d, #0x00
00137$:
;./msxworks.c:606: }
	ld	sp, ix
	pop	ix
	ret
;./msxworks.c:609: void DrawDesktop()
;	---------------------------------
; Function DrawDesktop
; ---------------------------------
_DrawDesktop::
;./msxworks.c:611: DrawBar(0, "", NULL);
	ld	hl, #0x0000
	push	hl
	ld	de, #___str_55
	xor	a, a
	call	_DrawBar
;./msxworks.c:612: for (u8 i = 0; i < MENU_COUNT; ++i)
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x08
	jp	nc, _Editor_Draw
;./msxworks.c:613: Scr_PrintAt(g_Menus[i].X, 0, g_Menus[i].Label);
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	a, l
	add	a, #<(_g_Menus)
	ld	c, a
	ld	a, h
	adc	a, #>(_g_Menus)
	ld	l, c
	ld	h, a
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, a
	inc	hl
	inc	hl
	ld	a, (hl)
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	push	bc
	push	de
	ld	l, #0x00
	call	_Scr_Locate
	pop	de
	ex	de, hl
	call	_Scr_Puts
	pop	bc
;./msxworks.c:612: for (u8 i = 0; i < MENU_COUNT; ++i)
	inc	b
;./msxworks.c:614: Editor_Draw();
;./msxworks.c:615: }
	jr	00104$
___str_55:
	.db 0x00
;./msxworks.c:618: void DrawMenu(u8 menuIndex, u8 itemIndex)
;	---------------------------------
; Function DrawMenu
; ---------------------------------
_DrawMenu::
	push	ix
	ld	ix,	#0
	add	ix, sp
	push	af
	push	af
	push	af
	dec	sp
	ld	e, a
	ld	c, l
;./msxworks.c:620: const Menu* menu = &g_Menus[menuIndex];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #_g_Menus
	add	hl, de
	ex	(sp), hl
;./msxworks.c:622: while (menu->Label[labelLen])
	ld	b, #0x00
00101$:
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	z, 00123$
;./msxworks.c:623: labelLen++;
	inc	b
	jr	00101$
00123$:
	ld	-5 (ix), b
;./msxworks.c:624: u8 x = menu->X;
	pop	de
	push	de
	inc	de
	inc	de
	ld	a, (de)
	ld	-4 (ix), a
;./msxworks.c:625: if (x + menu->Width > SCR_WIDTH)
	ld	-3 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	a, -7 (ix)
	add	a, #0x03
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	b, (hl)
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a, #0x50
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	nc, 00105$
;./msxworks.c:626: x = SCR_WIDTH - menu->Width;
	ld	a, #0x50
	sub	a, b
	ld	-3 (ix), a
00105$:
;./msxworks.c:628: Scr_SetBlink(menu->X, 0, labelLen, FALSE);
	ld	e, -5 (ix)
	ld	d, #0x00
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	de
	ld	l, #0x00
	ld	a, -4 (ix)
	call	_Scr_SetBlink
	pop	bc
;./msxworks.c:629: Scr_DrawWindow(x, 1, menu->Width, menu->Count + 2, NULL);
	ld	iy, #0x0006
	pop	de
	push	de
	add	iy, de
	ld	a, (iy)
	add	a, #0x02
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	b, (hl)
	push	bc
	push	iy
	ld	hl, #0x0000
	push	hl
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	l, #0x01
	ld	a, -3 (ix)
	call	_Scr_DrawWindow
	pop	iy
	pop	bc
;./msxworks.c:630: for (u8 i = 0; i < menu->Count; ++i)
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-4 (ix), a
	ld	b, #0x00
00109$:
	ld	e, (iy)
;./msxworks.c:631: Scr_PrintAt(x + 2, i + 2, menu->Items[i].Label);
	ld	a, -3 (ix)
	ld	-6 (ix), a
;./msxworks.c:630: for (u8 i = 0; i < menu->Count; ++i)
	ld	a, b
	sub	a, e
	jr	nc, 00106$
;./msxworks.c:631: Scr_PrintAt(x + 2, i + 2, menu->Items[i].Label);
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	pop	de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, b
	inc	l
	inc	l
	ld	a, -6 (ix)
	inc	a
	inc	a
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	push	bc
	push	de
	push	iy
	call	_Scr_Locate
	pop	iy
	pop	de
	push	iy
	ex	de, hl
	call	_Scr_Puts
	pop	iy
	pop	bc
;./msxworks.c:630: for (u8 i = 0; i < menu->Count; ++i)
	inc	b
	jr	00109$
00106$:
;./msxworks.c:632: Scr_SetBlink(x + 1, itemIndex + 2, menu->Width - 2, FALSE);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	e, (hl)
	ld	d, #0x00
	dec	de
	dec	de
	inc	c
	inc	c
	ld	a, -6 (ix)
	inc	a
	ld	h, #0x00
	push	hl
	inc	sp
	push	de
	ld	l, c
	call	_Scr_SetBlink
;./msxworks.c:633: Editor_Invalidate();
	call	_Editor_Invalidate
;./msxworks.c:634: }
	ld	sp, ix
	pop	ix
	ret
;./msxworks.c:637: void ShowMessage(const c8* title, const c8* message, const c8* detail)
;	---------------------------------
; Function ShowMessage
; ---------------------------------
_ShowMessage::
;./msxworks.c:639: Editor_Invalidate();
	push	hl
	push	de
	call	_Editor_Invalidate
	pop	de
	pop	hl
;./msxworks.c:644: Scr_DrawWindow(x, y, ABOUT_WIDTH, ABOUT_HEIGHT, title);
	push	de
	push	hl
	ld	hl, #0x928
	push	hl
	ld	l, #0x07
	ld	a, #0x14
	call	_Scr_DrawWindow
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	ld	l, #0x09
	ld	a, #0x17
	call	_Scr_Locate
	pop	de
	ex	de, hl
	call	_Scr_Puts
;./msxworks.c:646: if (detail)
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	z, 00102$
;./msxworks.c:647: Scr_PrintAt(x + 3, y + 3, detail);
	pop	de
	pop	hl
	push	hl
	push	de
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	push	hl
	ld	l, #0x0a
	ld	a, #0x17
	call	_Scr_Locate
	pop	hl
	call	_Scr_Puts
;./msxworks.c:647: Scr_PrintAt(x + 3, y + 3, detail);
00102$:
;./msxworks.c:648: Scr_PrintAt(x + (ABOUT_WIDTH - 8) / 2, y + 7, "[  OK  ]");
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	ld	l, #0x0e
	ld	a, #0x24
	call	_Scr_Locate
	ld	hl, #___str_56
	call	_Scr_Puts
;./msxworks.c:649: Scr_SetBlink(x + (ABOUT_WIDTH - 8) / 2, y + 7, 8, FALSE);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x0008
	push	hl
	ld	l, #0x0e
	ld	a, #0x24
	call	_Scr_SetBlink
00110$:
;./msxworks.c:653: u8 key = WaitInput(TRUE);
	ld	a, #0x01
	call	_WaitInput
	ld	a, e
;./msxworks.c:654: if ((key == KEY_ENTER) || (key == KEY_ESC))
	cp	a, #0x77
	jr	z, 00106$
	cp	a, #0x27
	jr	nz, 00110$
;./msxworks.c:655: break;
00106$:
;./msxworks.c:657: ReleaseMenuKeys();
	call	_ReleaseMenuKeys
;./msxworks.c:658: }
	pop	hl
	pop	af
	jp	(hl)
___str_56:
	.ascii "[  OK  ]"
	.db 0x00
;./msxworks.c:661: bool ConfirmExit()
;	---------------------------------
; Function ConfirmExit
; ---------------------------------
_ConfirmExit::
;./msxworks.c:663: if (!g_EditorModified)
	ld	a, (_g_EditorModified+0)
	or	a, a
	jr	nz, 00102$
;./msxworks.c:664: return TRUE;
	ld	a, #0x01
	ret
00102$:
;./msxworks.c:665: Editor_Invalidate();
	call	_Editor_Invalidate
;./msxworks.c:666: bool discard = FALSE;
	ld	c, #0x00
;./msxworks.c:667: Scr_DrawWindow(16, 8, 48, 7, "Unsaved text");
	push	bc
	ld	hl, #___str_57
	push	hl
	ld	hl, #0x730
	push	hl
	ld	l, #0x08
	ld	a, #0x10
	call	_Scr_DrawWindow
;./msxworks.c:668: Scr_PrintAt(19, 10, "Exit without saving the modified text?");
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	ld	l, #0x0a
	ld	a, #0x13
	call	_Scr_Locate
	ld	hl, #___str_58
	call	_Scr_Puts
;./msxworks.c:669: Scr_PrintAt(22, 13, "[ Cancel ]     [ Discard ]");
;./screen.h:87: inline void Scr_PrintAt(u8 x, u8 y, const c8* str) { Scr_Locate(x, y); Scr_Puts(str); }
	ld	l, #0x0d
	ld	a, #0x16
	call	_Scr_Locate
	ld	hl, #___str_59
	call	_Scr_Puts
	pop	bc
;./msxworks.c:669: Scr_PrintAt(22, 13, "[ Cancel ]     [ Discard ]");
00114$:
;./msxworks.c:672: Scr_SetBlink(22, 13, 10, discard);
	push	bc
	ld	a, c
	push	af
	inc	sp
	ld	hl, #0x000a
	push	hl
	ld	l, #0x0d
	ld	a, #0x16
	call	_Scr_SetBlink
	pop	bc
;./msxworks.c:673: Scr_SetBlink(37, 13, 11, !discard);
	ld	a, c
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	b, a
	push	bc
	push	bc
	inc	sp
	ld	hl, #0x000b
	push	hl
	ld	l, #0x0d
	ld	a, #0x25
	call	_Scr_SetBlink
;./msxworks.c:674: u8 key = WaitInput(TRUE);
	ld	a, #0x01
	call	_WaitInput
	pop	bc
	ld	a, e
;./msxworks.c:675: if ((key == KEY_ESC) || (key == KEY_SELECT))
	cp	a, #0x27
	jr	z, 00103$
	cp	a, #0x67
	jr	nz, 00104$
00103$:
;./msxworks.c:676: return FALSE;
	xor	a, a
	ret
00104$:
;./msxworks.c:677: if ((key == KEY_LEFT) || (key == KEY_RIGHT))
	cp	a, #0x48
	jr	z, 00106$
	cp	a, #0x78
	jr	nz, 00107$
00106$:
;./msxworks.c:678: discard = !discard;
	ld	c, b
00107$:
;./msxworks.c:679: if (key == KEY_ENTER)
	cp	a, #0x77
	jr	nz, 00114$
;./msxworks.c:680: return discard;
	ld	a, c
;./msxworks.c:682: }
	ret
___str_57:
	.ascii "Unsaved text"
	.db 0x00
___str_58:
	.ascii "Exit without saving the modified text?"
	.db 0x00
___str_59:
	.ascii "[ Cancel ]     [ Discard ]"
	.db 0x00
;./msxworks.c:685: void RunMenus()
;	---------------------------------
; Function RunMenus
; ---------------------------------
_RunMenus::
	call	___sdcc_enter_ix
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
;./msxworks.c:687: bool open = FALSE;
	ld	-5 (ix), #0x00
;./msxworks.c:688: u8 menuIndex = 0;
	ld	-4 (ix), #0x00
;./msxworks.c:689: u8 itemIndex = 0;
	ld	-3 (ix), #0x00
;./msxworks.c:690: g_KeyRow7 = ReadMenuRow(7);
	ld	a, #0x07
	call	_ReadMenuRow
	ld	(#_g_KeyRow7), a
;./msxworks.c:691: g_KeyRow8 = ReadMenuRow(8);
	ld	a, #0x08
	call	_ReadMenuRow
	ld	(#_g_KeyRow8), a
;./msxworks.c:692: if (!Document_Init())
	call	_Document_Init
	ld	-1 (ix), a
	or	a, a
	jr	nz, 00102$
;./msxworks.c:694: ShowMessage("Memory error", "Cannot allocate document memory.", NULL);
	ld	hl, #0x0000
	push	hl
	ld	de, #___str_61
	ld	hl, #___str_60
	call	_ShowMessage
;./msxworks.c:695: return;
	jp	00149$
00102$:
;./msxworks.c:697: Editor_Init();
	call	_Editor_Init
;./msxworks.c:698: DrawDesktop();
	call	_DrawDesktop
;./msxworks.c:699: ReleaseMenuKeys();
	call	_ReleaseMenuKeys
;./msxworks.c:700: g_KeyRow7 = ReadMenuRow(7);
	ld	a, #0x07
	call	_ReadMenuRow
	ld	(#_g_KeyRow7), a
;./msxworks.c:701: g_KeyRow8 = ReadMenuRow(8);
	ld	a, #0x08
	call	_ReadMenuRow
	ld	(#_g_KeyRow8), a
00148$:
;./msxworks.c:705: u16 input = WaitInput(open);
	ld	a, -5 (ix)
	call	_WaitInput
	ld	c, e
;./msxworks.c:706: u8 key = input;
	ld	-2 (ix), c
;./msxworks.c:707: if (input == UI_SELECT)
	ld	a, c
	ld	b, d
	cp	a, #0x67
	jr	nz, 00141$
	djnz	00141$
;./msxworks.c:709: open = !open;
	ld	a, -5 (ix)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	-5 (ix), a
;./msxworks.c:710: ClearKeyBuffer();
	call	_ClearKeyBuffer
	jp	00142$
00141$:
;./msxworks.c:712: else if (!open)
	ld	a, -5 (ix)
	or	a, a
	jr	nz, 00138$
;./msxworks.c:714: if (!Editor_Input(input))
	ld	l, c
	ld	h, d
	call	_Editor_Input
	or	a, a
	jr	nz, 00104$
;./msxworks.c:716: ShowMessage("Memory full", "All document segments are full.", NULL);
	ld	hl, #0x0000
	push	hl
	ld	de, #___str_63
	ld	hl, #___str_62
	call	_ShowMessage
;./msxworks.c:717: DrawDesktop();
	call	_DrawDesktop
	jr	00148$
00104$:
;./msxworks.c:720: Editor_Draw();
	call	_Editor_Draw
;./msxworks.c:721: continue;
	jr	00148$
00138$:
;./msxworks.c:723: else if (key == KEY_ESC)
	ld	a, -2 (ix)
	sub	a, #0x27
	jr	nz, 00135$
;./msxworks.c:724: open = FALSE;
	ld	-5 (ix), #0x00
	jp	00142$
00135$:
;./msxworks.c:725: else if ((key == KEY_LEFT) || (key == KEY_RIGHT))
	ld	a, -2 (ix)
	sub	a, #0x48
	ld	a, #0x01
	jr	z, 00304$
	xor	a, a
00304$:
	ld	-1 (ix), a
	or	a, a
	jr	nz, 00130$
	ld	a, -2 (ix)
	sub	a, #0x78
	jr	nz, 00131$
00130$:
;./msxworks.c:727: if (key == KEY_LEFT)
	ld	a, -1 (ix)
	or	a, a
	jr	z, 00107$
;./msxworks.c:728: menuIndex = menuIndex ? menuIndex - 1 : MENU_COUNT - 1;
	ld	a, -4 (ix)
	or	a, a
	jr	z, 00151$
	ld	c, -4 (ix)
	dec	c
	jr	00152$
00151$:
	ld	c, #0x07
00152$:
	ld	-4 (ix), c
	jr	00108$
00107$:
;./msxworks.c:730: menuIndex = (menuIndex + 1) % MENU_COUNT;
	ld	a, -4 (ix)
	ld	-1 (ix), a
	inc	-1 (ix)
	ld	a, -1 (ix)
	and	a, #0x07
	ld	-4 (ix), a
00108$:
;./msxworks.c:731: itemIndex = 0;
	ld	-3 (ix), #0x00
	jp	00142$
00131$:
;./msxworks.c:733: else if ((key == KEY_UP) || (key == KEY_DOWN))
	ld	a, -2 (ix)
	sub	a, #0x58
	ld	a, #0x01
	jr	z, 00308$
	xor	a, a
00308$:
	ld	c, a
	or	a, a
	jr	nz, 00126$
	ld	a, -2 (ix)
	sub	a, #0x68
	jr	nz, 00127$
00126$:
;./msxworks.c:735: u8 count = g_Menus[menuIndex].Count;
	ld	e, -4 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #_g_Menus
	add	hl, de
	ld	de, #0x0006
	add	hl, de
	ld	a, (hl)
	ld	-1 (ix), a
;./msxworks.c:736: if (key == KEY_UP)
	ld	a, c
	or	a, a
	jr	z, 00110$
;./msxworks.c:737: itemIndex = itemIndex ? itemIndex - 1 : count - 1;
	ld	a, -3 (ix)
	or	a, a
	jr	z, 00153$
	ld	c, -3 (ix)
	dec	c
	jr	00154$
00153$:
	ld	c, -1 (ix)
	dec	c
00154$:
	ld	-3 (ix), c
	jp	00142$
00110$:
;./msxworks.c:739: itemIndex = (itemIndex + 1) % count;
	ld	l, -3 (ix)
	ld	h, #0x00
	inc	hl
	ld	e, -1 (ix)
	ld	d, #0x00
	call	__modsint
	ld	-3 (ix), e
	jp	00142$
00127$:
;./msxworks.c:741: else if (key == KEY_ENTER)
	ld	a, -2 (ix)
	sub	a, #0x77
	jp	nz, 00142$
;./msxworks.c:743: switch (g_Menus[menuIndex].Items[itemIndex].Action)
	ld	c, -4 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_g_Menus
	add	hl, de
	ld	de, #0x0004
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	jp	c, 00123$
	ld	b, #0x00
	ld	hl, #00313$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00313$:
	.dw	00112$
	.dw	00118$
	.dw	00119$
	.dw	00120$
	.dw	00121$
	.dw	00122$
;./msxworks.c:745: case MENU_EXIT:
00112$:
;./msxworks.c:746: DrawDesktop();
	call	_DrawDesktop
;./msxworks.c:747: if (!ConfirmExit())
	call	_ConfirmExit
	or	a, a
	jr	nz, 00115$
;./msxworks.c:749: open = FALSE;
	ld	-5 (ix), #0x00
;./msxworks.c:750: ClearKeyBuffer();
	call	_ClearKeyBuffer
;./msxworks.c:751: break;
	jr	00123$
;./msxworks.c:753: while (IS_KEY_PRESSED(ReadMenuRow(KEY_ROW(KEY_ENTER)), KEY_ENTER)) {}
00115$:
	ld	a, #0x07
	call	_ReadMenuRow
	rlca
	jr	nc, 00115$
;./msxworks.c:755: ClearKeyBuffer();
	call	_ClearKeyBuffer
;./msxworks.c:756: return;
	jr	00149$
;./msxworks.c:757: case MENU_ABOUT:
00118$:
;./msxworks.c:758: DrawDesktop();
	call	_DrawDesktop
;./msxworks.c:759: ShowMessage(g_HelpItems[0].Label, APP_NAME, "Version " APP_VERSION);
	ld	hl, #_g_HelpItems
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #___str_65
	push	hl
	ld	de, #___str_64
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_ShowMessage
;./msxworks.c:760: open = FALSE;
	ld	-5 (ix), #0x00
;./msxworks.c:761: break;
	jr	00123$
;./msxworks.c:762: case MENU_UNAVAILABLE:
00119$:
;./msxworks.c:763: DrawDesktop();
	call	_DrawDesktop
;./msxworks.c:764: ShowMessage("Not available", "Not implemented yet.", NULL);
	ld	hl, #0x0000
	push	hl
	ld	de, #___str_67
	ld	hl, #___str_66
	call	_ShowMessage
;./msxworks.c:765: open = FALSE;
	ld	-5 (ix), #0x00
;./msxworks.c:766: break;
	jr	00123$
;./msxworks.c:767: case MENU_WRAP:
00120$:
;./msxworks.c:768: Editor_ToggleWrap();
	call	_Editor_ToggleWrap
;./msxworks.c:769: open = FALSE;
	ld	-5 (ix), #0x00
;./msxworks.c:770: break;
	jr	00123$
;./msxworks.c:771: case MENU_INSERT:
00121$:
;./msxworks.c:772: g_EditorInsert = !g_EditorInsert;
	ld	a, (_g_EditorInsert+0)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(#_g_EditorInsert), a
;./msxworks.c:773: open = FALSE;
	ld	-5 (ix), #0x00
;./msxworks.c:774: break;
	jr	00123$
;./msxworks.c:775: case MENU_EDITOR:
00122$:
;./msxworks.c:776: open = FALSE;
	ld	-5 (ix), #0x00
;./msxworks.c:778: }
00123$:
;./msxworks.c:779: ClearKeyBuffer();
	call	_ClearKeyBuffer
00142$:
;./msxworks.c:782: DrawDesktop();
	call	_DrawDesktop
;./msxworks.c:783: if (open)
	ld	a, -5 (ix)
	or	a, a
	jr	z, 00144$
;./msxworks.c:784: DrawMenu(menuIndex, itemIndex);
	ld	l, -3 (ix)
	ld	a, -4 (ix)
	call	_DrawMenu
	jp	00148$
00144$:
;./msxworks.c:786: ReleaseMenuKeys();
	call	_ReleaseMenuKeys
	jp	00148$
00149$:
;./msxworks.c:788: }
	ld	sp, ix
	pop	ix
	ret
___str_60:
	.ascii "Memory error"
	.db 0x00
___str_61:
	.ascii "Cannot allocate document memory."
	.db 0x00
___str_62:
	.ascii "Memory full"
	.db 0x00
___str_63:
	.ascii "All document segments are full."
	.db 0x00
___str_64:
	.ascii "MSX-Works"
	.db 0x00
___str_65:
	.ascii "Version 0.0.1 (stub)"
	.db 0x00
___str_66:
	.ascii "Not available"
	.db 0x00
___str_67:
	.ascii "Not implemented yet."
	.db 0x00
;./msxworks.c:794: u8 main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./msxworks.c:796: bool envOK = CheckEnvironment();
	call	_CheckEnvironment
;./msxworks.c:798: if (!envOK)
	or	a, a
	jr	nz, 00102$
;./msxworks.c:800: PrintLn(APP_NAME " " APP_VERSION);
	ld	hl, #___str_68
	call	_PrintLn
;./msxworks.c:801: PrintReport(FALSE);
	xor	a, a
	call	_PrintReport
;./msxworks.c:802: return 0;
	xor	a, a
	ret
00102$:
;./msxworks.c:805: Scr_Init();
	call	_Scr_Init
;./msxworks.c:806: g_ScrMode = TRUE;
	ld	hl, #_g_ScrMode
	ld	(hl), #0x01
;./msxworks.c:808: DrawBar(0, APP_NAME " " APP_VERSION, "MSX2+ / DOS 2");
	ld	hl, #___str_69
	push	hl
	ld	de, #___str_68
	xor	a, a
	call	_DrawBar
;./msxworks.c:809: DrawBar(SCR_HEIGHT - 1, "Enter/Esc=OK", NULL);
	ld	hl, #0x0000
	push	hl
	ld	de, #___str_70
	ld	a, #0x17
	call	_DrawBar
;./msxworks.c:811: ShowReportWindow();
	call	_ShowReportWindow
;./msxworks.c:812: RunMenus();
	call	_RunMenus
;./msxworks.c:813: bool memoryOK = Document_Close();
	call	_Document_Close
	ld	l, a
;./msxworks.c:815: g_ScrMode = FALSE;
	xor	a, a
	ld	(_g_ScrMode+0), a
;./msxworks.c:816: Scr_Restore();
	push	hl
	call	_Scr_Restore
	pop	hl
;./msxworks.c:817: if (!memoryOK)
	ld	a, l
	or	a, a
	jr	nz, 00104$
;./msxworks.c:818: PrintLn("Error releasing document memory.");
	ld	hl, #___str_71
	call	_PrintLn
00104$:
;./msxworks.c:819: return 0;
	xor	a, a
;./msxworks.c:820: }
	ret
___str_68:
	.ascii "MSX-Works 0.0.1 (stub)"
	.db 0x00
___str_69:
	.ascii "MSX2+ / DOS 2"
	.db 0x00
___str_70:
	.ascii "Enter/Esc=OK"
	.db 0x00
___str_71:
	.ascii "Error releasing document memory."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__g_ScrMode:
	.db #0x00	; 0
	.area _CABS (ABS)
