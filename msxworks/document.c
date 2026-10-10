// A gap buffer spanning every free DOS2 mapper segment, including other slots.
// Code and ordinary data stay below page 2; only document bytes are banked.
#include "document.h"
#include "dos_mapper.h"

#define SEGMENT_SIZE 16384UL
#define MAX_SEGMENTS 4096
#define COPY_SIZE 128

static DOS_Segment s_Segments[MAX_SEGMENTS];
static u16 s_Count;
static u32 s_GapStart;
static u32 s_GapEnd;
static u8 s_SavedPage;
static u8 s_SavedSlot;
static u8 s_Slot;
static u16 s_Mapped;
static u8 s_Copy[COPY_SIZE];
u32 g_DocumentCapacity;
u32 g_DocumentLength;

#ifdef __SDCC
static bool Document_MemorySafe() __NAKED
{
__asm
	ld		hl, #s__HEAP
	ld		a, h
	cp		#0x80
	ld		a, #0
	ret		nc
	inc		a
	ret
__endasm;
}

static void Document_SelectSlot(u8 slot) __NAKED
{
	slot;
__asm
	push	ix
	ld		h, #0x80
	call	R_ENASLT
	ei
	pop		ix
	ret
__endasm;
}

static u8* Document_Page() { return (u8*)0x8000; }
#else
// The host tests supply an emulated mapper rather than accessing Z80 ports.
extern bool Document_MemorySafe();
extern void Document_SelectSlot(u8 slot);
extern u8* Document_Page();
#endif

bool Document_Close()
{
	bool ok = TRUE;
	while (s_Count)
	{
		--s_Count;
		if (!DOSMapper_FreeStruct(&s_Segments[s_Count]))
			ok = FALSE;
	}
	g_DocumentCapacity = g_DocumentLength = 0;
	return ok;
}

void Document_Reset()
{
	g_DocumentLength = s_GapStart = 0;
	s_GapEnd = g_DocumentCapacity;
}

bool Document_Init()
{
	s_Count = 0;
	g_DocumentCapacity = 0;
	if (!Document_MemorySafe())
		return FALSE;
	const DOS_VarTable* tab = DOSMapper_GetVarTable();
	while (tab->Slot)
	{
		u16 free = tab->FreeSeg;
		while (free--)
		{
			if ((s_Count == MAX_SEGMENTS)
				|| !DOSMapper_Alloc(DOS_ALLOC_USER, tab->Slot, &s_Segments[s_Count]))
				return FALSE;
			++s_Count;
			g_DocumentCapacity += SEGMENT_SIZE;
		}
		++tab;
	}
	Document_Reset();
	return s_Count != 0;
}

void Document_Begin()
{
	s_SavedPage = DOSMapper_GetPage2();
	s_SavedSlot = s_Slot = Sys_GetPageSlot(2);
	s_Mapped = MAX_SEGMENTS;
}

void Document_End()
{
	DOSMapper_SetPage2(s_SavedPage);
	if (s_Slot != s_SavedSlot)
		Document_SelectSlot(s_SavedSlot);
}

static u8* Address(u32 pos)
{
	u16 index = pos >> 14;
	if (index != s_Mapped)
	{
		DOSMapper_SetPage2(s_Segments[index].Number);
		if (s_Slot != s_Segments[index].Slot)
		{
			s_Slot = s_Segments[index].Slot;
			Document_SelectSlot(s_Slot);
		}
		s_Mapped = index;
	}
	return Document_Page() + (u16)(pos & (SEGMENT_SIZE - 1));
}

static u16 BankCount(u32 pos, u16 count)
{
	u16 available = (u16)(SEGMENT_SIZE - (pos & (SEGMENT_SIZE - 1)));
	return count < available ? count : available;
}

void Document_Read(u32 pos, c8* dest, u16 count)
{
	while (count)
	{
		u32 physical = pos;
		u16 size = count;
		if (pos >= s_GapStart)
			physical += s_GapEnd - s_GapStart;
		else if (s_GapStart - pos < size)
			size = (u16)(s_GapStart - pos);
		size = BankCount(physical, size);
		const u8* src = Address(physical);
		for (u16 i = 0; i < size; ++i)
			*dest++ = *src++;
		pos += size;
		count -= size;
	}
}

u8 Document_Get(u32 pos)
{
	if (pos >= s_GapStart)
		pos += s_GapEnd - s_GapStart;
	return *Address(pos);
}

void Document_Put(u32 pos, u8 chr)
{
	if (pos >= s_GapStart)
		pos += s_GapEnd - s_GapStart;
	*Address(pos) = chr;
}

static void ReadPhysical(u32 pos, u16 count)
{
	u16 done = 0;
	while (done < count)
	{
		u16 size = BankCount(pos, count - done);
		const u8* src = Address(pos);
		for (u16 i = 0; i < size; ++i)
			s_Copy[done + i] = *src++;
		pos += size;
		done += size;
	}
}

static void WritePhysical(u32 pos, u16 count)
{
	u16 done = 0;
	while (done < count)
	{
		u16 size = BankCount(pos, count - done);
		u8* dest = Address(pos);
		for (u16 i = 0; i < size; ++i)
			*dest++ = s_Copy[done + i];
		pos += size;
		done += size;
	}
}

static void MoveGap(u32 pos)
{
	while (s_GapStart > pos)
	{
		u32 distance = s_GapStart - pos;
		u16 count = distance > COPY_SIZE ? COPY_SIZE : (u16)distance;
		ReadPhysical(s_GapStart - count, count);
		WritePhysical(s_GapEnd - count, count);
		s_GapStart -= count;
		s_GapEnd -= count;
	}
	while (s_GapStart < pos)
	{
		u32 distance = pos - s_GapStart;
		u16 count = distance > COPY_SIZE ? COPY_SIZE : (u16)distance;
		ReadPhysical(s_GapEnd, count);
		WritePhysical(s_GapStart, count);
		s_GapStart += count;
		s_GapEnd += count;
	}
}

bool Document_Insert(u32 pos, u8 chr, u16 count)
{
	if (count > g_DocumentCapacity - g_DocumentLength)
		return FALSE;
	MoveGap(pos);
	while (count)
	{
		u16 size = BankCount(s_GapStart, count);
		u8* dest = Address(s_GapStart);
		for (u16 i = 0; i < size; ++i)
			*dest++ = chr;
		s_GapStart += size;
		g_DocumentLength += size;
		count -= size;
	}
	return TRUE;
}

void Document_Delete(u32 pos)
{
	if (pos == g_DocumentLength)
		return;
	MoveGap(pos);
	++s_GapEnd;
	--g_DocumentLength;
}
