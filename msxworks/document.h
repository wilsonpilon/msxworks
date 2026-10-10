#pragma once

#include "msxgl.h"
#include "dos_mapper.h"

extern u32 g_DocumentCapacity;
extern u32 g_DocumentLength;

// Allocates the free segments reported by DOS2. Close also releases partial
// allocations if initialization fails. The program must fit below 8000h.
bool Document_Init();
bool Document_Close();
void Document_Reset();
// Bracket text access so page 2 is restored before calling DOS or BIOS.
void Document_Begin();
void Document_End();
u8 Document_Get(u32 pos);
void Document_Read(u32 pos, c8* dest, u16 count);
void Document_Put(u32 pos, u8 chr);
bool Document_Insert(u32 pos, u8 chr, u16 count);
void Document_Delete(u32 pos);
