;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module dos_mapper
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_EXTBIO
	.globl _g_HOKVLD
	.globl _g_DOS_JumpTable
	.globl _g_DOS_VarTable
	.globl _DOSMapper_Init
	.globl _DOSMapper_Alloc
	.globl _DOSMapper_Free
	.globl _DOSMapper_ReadByte
	.globl _DOSMapper_WriteByte
	.globl _DOSMapper_SetPage
	.globl _DOSMapper_SetPage0
	.globl _DOSMapper_SetPage1
	.globl _DOSMapper_SetPage2
	.globl _DOSMapper_GetPage
	.globl _DOSMapper_GetPage0
	.globl _DOSMapper_GetPage1
	.globl _DOSMapper_GetPage2
	.globl _DOSMapper_GetPage3
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_DOS_VarTable::
	.ds 2
_g_DOS_JumpTable::
	.ds 2
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
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:39: bool DOSMapper_Init() __NAKED
;	---------------------------------
; Function DOSMapper_Init
; ---------------------------------
_DOSMapper_Init::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:70: __endasm;
	push ix
	call init_extbios
	pop ix
	ret
init_extbios:
	ld a, (0xFB20)
	and #0x01
	ret z
	xor a
	ld d, #0x04
	ld e, #0x01
	call 0xFFCA
	or a
	ret z
	ld (_g_DOS_VarTable), hl
	xor a
	ld d, #0x04
	ld e, #0x02
	call 0xFFCA
	or a
	ret z
	ld (_g_DOS_JumpTable), hl
	ld a, #0xFF
	ret
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:71: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:75: bool DOSMapper_Alloc(u8 type, u8 slot, DOS_Segment* seg) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function DOSMapper_Alloc
; ---------------------------------
_DOSMapper_Alloc::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:103: __endasm;
	push ix
	ld b, l
	ld hl, (_g_DOS_JumpTable)
	call ___sdcc_call_hl
	pop ix
	jr c, alloc_error
	pop iy
	pop hl
	ld (hl), a
	inc hl
	ld a, b
	ld (hl), a
	ld a, #0xFF
	jp (iy)
alloc_error:
	xor a
	ret
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:104: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:108: bool DOSMapper_Free(u8 seg, u8 slot) __NAKED
;	---------------------------------
; Function DOSMapper_Free
; ---------------------------------
_DOSMapper_Free::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:124: __endasm;
	push ix
	ld b, l
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x03
	add hl, de
	call ___sdcc_call_hl
	ld a, #0
	adc #0xFF
	pop ix
	ret
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:125: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:129: u8 DOSMapper_ReadByte(u8 seg, u16 addr) __NAKED // preserve BC, IX
;	---------------------------------
; Function DOSMapper_ReadByte
; ---------------------------------
_DOSMapper_ReadByte::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:142: __endasm;
	ex de, hl
	ld iy, (_g_DOS_JumpTable)
	ld de, #0x06
	add iy, de
	call ___sdcc_call_iy
	ei
	ret
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:143: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:147: void DOSMapper_WriteByte(u8 seg, u16 addr, u8 val) __NAKED
;	---------------------------------
; Function DOSMapper_WriteByte
; ---------------------------------
_DOSMapper_WriteByte::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:164: __endasm;
	ex de, hl
	ld iy, #2
	add iy, sp
	ld e, 0(iy)
	ld iy, (_g_DOS_JumpTable)
	ld bc, #0x09
	add iy, bc
	call ___sdcc_call_iy
	ei
	ret
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:165: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:169: void DOSMapper_SetPage(u8 page, u8 seg) __NAKED
;	---------------------------------
; Function DOSMapper_SetPage
; ---------------------------------
_DOSMapper_SetPage::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:184: __endasm;
	rrca
	rrca
	ld h, a
	ld a, l
	ld iy, (_g_DOS_JumpTable)
	ld de, #0x12
	add iy, de
	jp (iy)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:185: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:189: void DOSMapper_SetPage0(u8 seg) __NAKED
;	---------------------------------
; Function DOSMapper_SetPage0
; ---------------------------------
_DOSMapper_SetPage0::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:198: __endasm;
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x18
	add hl, de
	jp (hl)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:199: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:203: void DOSMapper_SetPage1(u8 seg) __NAKED
;	---------------------------------
; Function DOSMapper_SetPage1
; ---------------------------------
_DOSMapper_SetPage1::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:212: __endasm;
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x1E
	add hl, de
	jp (hl)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:213: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:217: void DOSMapper_SetPage2(u8 seg) __NAKED
;	---------------------------------
; Function DOSMapper_SetPage2
; ---------------------------------
_DOSMapper_SetPage2::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:226: __endasm;
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x24
	add hl, de
	jp (hl)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:227: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:231: u8 DOSMapper_GetPage(u8 page) __NAKED
;	---------------------------------
; Function DOSMapper_GetPage
; ---------------------------------
_DOSMapper_GetPage::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:244: __endasm;
	rrca
	rrca
	ld h, a
	ld iy, (_g_DOS_JumpTable)
	ld de, #0x15
	add iy, de
	jp (iy)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:245: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:249: u8 DOSMapper_GetPage0() __NAKED
;	---------------------------------
; Function DOSMapper_GetPage0
; ---------------------------------
_DOSMapper_GetPage0::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:256: __endasm;
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x1B
	add hl, de
	jp (hl)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:257: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:261: u8 DOSMapper_GetPage1() __NAKED
;	---------------------------------
; Function DOSMapper_GetPage1
; ---------------------------------
_DOSMapper_GetPage1::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:268: __endasm;
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x21
	add hl, de
	jp (hl)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:269: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:273: u8 DOSMapper_GetPage2() __NAKED
;	---------------------------------
; Function DOSMapper_GetPage2
; ---------------------------------
_DOSMapper_GetPage2::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:280: __endasm;
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x27
	add hl, de
	jp (hl)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:281: }
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:285: u8 DOSMapper_GetPage3() __NAKED
;	---------------------------------
; Function DOSMapper_GetPage3
; ---------------------------------
_DOSMapper_GetPage3::
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:292: __endasm;
	ld hl, (_g_DOS_JumpTable)
	ld de, #0x2D
	add hl, de
	jp (hl)
;E:\msxworks\MSXgl\engine/src/dos_mapper.c:293: }
	.area _CODE
_g_HOKVLD	=	0xfb20
_g_EXTBIO	=	0xffca
	.area _INITIALIZER
__xinit__g_DOS_VarTable:
	.dw #0x0000
__xinit__g_DOS_JumpTable:
	.dw #0x0000
	.area _CABS (ABS)
