# Loads the UI test helpers, then exercises real mapped RAM and VRAM traffic.
# MSXWORKS_TEST_LOG selects the output. Mount the generated DOS2 disk.
# MSXWORKS_TEST_ROWS defaults to 1024 (80 KB). Use 900 on a 256 KB FS-A1ST,
# or 4608 with FS-A1GT + ram512k to cross into a second mapper slot.
set testDir [file dirname [info script]]
source [file join $testDir editor_ui.tcl]
set mapFile [open [file join $testDir .. out msxworks.map]]
set mapText [read $mapFile]
close $mapFile
set memory_rows 1024
if {[info exists env(MSXWORKS_TEST_ROWS)]} {
    set memory_rows $env(MSXWORKS_TEST_ROWS)
}
set memory_length [expr {$memory_rows * 80}]

proc symbol {name} {
    if {![regexp "(?m)^ +(\[0-9A-F\]+) +${name}(?: +|\$)" $::mapText all hex]} {
        error "Missing linker symbol: $name"
    }
    scan $hex %x address
    return $address
}

proc word {value} {
    return [list [expr {$value & 255}] [expr {($value >> 8) & 255}]]
}

proc emit {args} {
    foreach byte $args {lappend ::code $byte}
}

proc emit_word {opcode value} {
    emit $opcode {*}[word $value]
}

proc emit_call {name} {emit_word 0xCD [symbol $name]}

proc emit_insert {chr count} {
    emit_word 0x01 $count
    emit 0xC5 0x3E $chr 0xF5 0x33
    emit 0xED 0x5B {*}[word [symbol _g_DocumentLength]]
    emit_word 0x2A [expr {[symbol _g_DocumentLength] + 2}]
    emit_call _Document_Insert
}

proc read32 {address} {
    return [expr {[peek16 $address] | ([peek16 [expr {$address + 2}]] << 16)}]
}

proc mapper_free_segments {} {
    set total 0
    for {set address $::mapper_table} {[peek $address] != 0} {incr address 8} {
        incr total [peek [expr {$address + 2}]]
    }
    return $total
}

proc injection_done {} {
    debug remove_bp $::injection_bp
    foreach {name value} $::saved_regs {reg $name $value}
    set ::injecting 0
    debug cont
}

proc populate {} {
    debug break
    set ::saved_regs {}
    foreach name {PC SP AF BC DE HL IX IY AF2 BC2 DE2 HL2} {
        lappend ::saved_regs $name [reg $name]
    }
    set base [expr {[symbol s__HEAP] + 128}]
    check {$base + 256 < 0x8000} "Test trampoline stays below mapped page 2"
    set ::code {}
    emit_call _Document_Begin
    emit_word 0x01 $::memory_rows
    set loop [expr {$base + [llength $::code]}]
    emit 0xC5
    emit_insert 97 79
    emit_insert 10 1
    emit 0xC1 0x0B 0x78 0xB1
    emit_word 0xC2 $loop
    emit_call _Document_End
    emit_call _Editor_Invalidate
    emit_call _Editor_Draw
    set finish [expr {$base + [llength $::code]}]
    emit 0x00
    debug write_block memory $base [binary format c* $::code]
    set ::injecting 1
    set ::injection_bp [debug set_bp $finish {} injection_done]
    reg PC $base
    debug cont
}

proc count_write {} {incr ::vram_writes}
proc start_measurement {} {
    set ::vram_writes 0
    set ::measure_start [machine_info time]
    set ::write_watch [debug set_watchpoint write_io 0x98 {} count_write]
}
proc finish_measurement {limit label} {
    debug remove_watchpoint $::write_watch
    check {$::vram_writes <= $limit} "$label: $::vram_writes VRAM bytes (limit $limit)"
    set milliseconds [expr {round(($::frame_time - $::measure_start) * 1000)}]
    check {$milliseconds < 50} "$label: response ${milliseconds} ms (limit 50 ms)"
}

# The CPU runs injected calls to the real DOS mapper routines asynchronously.
proc frame_done {} {
    debug remove_bp $::frame_return_bp
    set ::drawing 0
    set ::frame_time [machine_info time]
}
proc frame_started {} {
    debug remove_bp $::frame_bp
    set ::frame_return_bp [debug set_bp [peek16 [reg SP]] {} frame_done]
}
set measure_input 1
rename tap ui_tap
proc tap {row mask} {
    if {$::measure_input} {
        set ::drawing 1
        set ::frame_bp [debug set_bp [symbol _Editor_Draw] {} frame_started]
    }
    ui_tap $row $mask
}
rename run_step ui_run_step
proc run_step {} {
    if {([info exists ::injecting] && $::injecting)
        || ([info exists ::drawing] && $::drawing)} {
        after time 0.1 run_step
        return
    }
    ui_run_step
}

set steps {
    {check {[string first "Environment check" [text 0 0 1920]] >= 0} "Startup report"}
    {tap 7 0x80}
    {set ::capacity [read32 [symbol _g_DocumentCapacity]]; set ::mapper_table [peek16 [symbol _g_DOS_VarTable]]; set ::free_before [mapper_free_segments]; check {$::capacity > $::memory_length} "DOS2 text capacity $::capacity bytes"; check {$::free_before == 0} "All available mapper segments allocated to document"}
    {start_measurement; tap 2 0x40}
    {finish_measurement 26 "First typed character"; check {[text 0 1 1] eq "a"} "First character visible"}
    {start_measurement; tap 2 0x80}
    {finish_measurement 4 "Next typed character"; check {[text 0 1 2] eq "ab"} "Second character visible"}
    {start_measurement; tap 8 0x10}
    {finish_measurement 3 "Cursor-only movement"}
    {start_measurement; tap 7 0x04}
    {finish_measurement 0 "Ignored key"}
    {debug break; set ::saved_regs {}; foreach name {PC SP AF BC DE HL IX IY AF2 BC2 DE2 HL2} {lappend ::saved_regs $name [reg $name]}; set base [expr {[symbol s__HEAP]+128}]; set ::code {}; emit_call _Editor_Init; set finish [expr {$base+[llength $::code]}]; emit 0; debug write_block memory $base [binary format c* $::code]; set ::injecting 1; set ::injection_bp [debug set_bp $finish {} injection_done]; reg PC $base; debug cont}
    {populate}
    {check {[read32 [symbol _g_DocumentLength]] == $::memory_length} "Real mapped document stores $::memory_length bytes"; check {[text 0 1 79] eq [string repeat "a" 79]} "Large text renders correctly"}
    {keymatrixdown 6 0x02}
    {tap 7 0x10}
    {check {[text 9 23 4] eq [format %04d [expr {$::memory_rows + 1}]] && [text 20 23 4] eq "0001"} "Ctrl STOP reaches end beyond 64 KB"}
    {keymatrixup 6 0x02}
    {start_measurement; tap 2 0x80}
    {finish_measurement 26 "Typing at end of large document"; check {[read32 [symbol _g_DocumentLength]] == $::memory_length + 1 && [text 0 22 1] eq "b"} "Input after 64 KB preserves document"}
    {tap 7 0x20}
    {check {[read32 [symbol _g_DocumentLength]] == $::memory_length} "Backspace beyond 64 KB"}
    {keymatrixdown 6 0x02}
    {tap 8 0x02}
    {keymatrixup 6 0x02}
    {check {[text 9 23 4] eq "0001" && [text 0 1 79] eq [string repeat "a" 79]} "Ctrl Home restores beginning of large document"}
    {tap 2 0x80}
    {check {[read32 [symbol _g_DocumentLength]] == $::memory_length + 1 && [text 0 1 2] eq "ba"} "Gap moves across segments for insertion at beginning"}
    {tap 7 0x20}
    {check {[read32 [symbol _g_DocumentLength]] == $::memory_length && [text 0 1 79] eq [string repeat "a" 79]} "Large gap movement preserves text"}
    {set ::measure_input 0; tap 7 0x40}
    {tap 7 0x80}
    {tap 8 0x80}
    {tap 7 0x80}
    {check {[text 75 0 4] ne "HELP"} "Exit returns to DOS"; check {[mapper_free_segments] == $::free_before + $::capacity / 16384} "All allocated mapper segments released on exit"}
}
