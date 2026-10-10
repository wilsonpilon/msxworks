#pragma once

#include "msxgl.h"

#define EDITOR_WORD_LEFT 0x201
#define EDITOR_WORD_RIGHT 0x202
#define EDITOR_TEXT_START 0x203
#define EDITOR_TEXT_END 0x204

extern bool g_EditorModified;
extern bool g_EditorInsert;
extern bool g_EditorWrap;

void Editor_Init();
void Editor_Draw();
void Editor_DrawStatus();
// Call after a menu or modal has written over the editor's cached screen.
void Editor_Invalidate();
void Editor_ToggleWrap();
// Returns FALSE only when an edit would exceed the document buffer.
bool Editor_Input(u16 key);
