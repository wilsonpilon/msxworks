#pragma once
#include "msxgl.h"

#define DOS_ALLOC_USER 0
typedef struct DOS_Segment { u8 Number; u8 Slot; } DOS_Segment;
typedef struct DOS_VarTable
{
	u8 Slot, NumSeg, FreeSeg, SysSeg, UserSeg, Reserved[3];
} DOS_VarTable;

const DOS_VarTable* DOSMapper_GetVarTable();
bool DOSMapper_Alloc(u8 type, u8 slot, DOS_Segment* seg);
bool DOSMapper_FreeStruct(DOS_Segment* seg);
u8 DOSMapper_GetPage2();
void DOSMapper_SetPage2(u8 page);
u8 Sys_GetPageSlot(u8 page);
