# Real Z80 throughput, independent of BIOS scan/repeat delay. Queue 30 keys
# at once and time every input/render pair, including the last visible row.
# Run as editor_memory.tcl; MSXWORKS_TEST_ROWS=900 fits a 256 KB FS-A1ST.
source [file join [file dirname [info script]] editor_memory.tcl]

proc burst_input {} {
    set ::key_started [machine_info time]
}

proc burst_draw {} {
    set ::burst_return [debug set_bp [peek16 [reg SP]] {} burst_rendered]
}

proc burst_rendered {} {
    debug remove_bp $::burst_return
    set elapsed [expr {[machine_info time] - $::key_started}]
    if {$elapsed > $::burst_max} {set ::burst_max $elapsed}
    incr ::burst_remaining -1
    if {!$::burst_remaining} {
        set ::burst_elapsed [expr {[machine_info time] - $::burst_started}]
        debug remove_bp $::burst_input_bp
        debug remove_bp $::burst_draw_bp
    }
}

proc burst {} {
    debug break
    check {[peek16 0xF3F8] == [peek16 0xF3FA]} "Keyboard queue initially empty"
    set ::burst_length [read32 [symbol _g_DocumentLength]]
    set ::burst_remaining 30
    set ::burst_max 0
    set ::burst_started [machine_info time]
    set ::burst_input_bp [debug set_bp [symbol _Editor_Input] {} burst_input]
    set ::burst_draw_bp [debug set_bp [symbol _Editor_Draw] {} burst_draw]
    set pointer [peek16 0xF3F8]
    set ::burst_text ""
    for {set i 0} {$i < 30} {incr i} {
        set chr [expr {97 + $i % 26}]
        append ::burst_text [format %c $chr]
        poke $pointer $chr
        incr pointer
        if {$pointer == 0xFC18} {set pointer 0xFBF0}
    }
    poke16 0xF3F8 $pointer
    debug cont
}

proc check_burst {label row} {
    check {[read32 [symbol _g_DocumentLength]] == $::burst_length + 30} "$label: no lost characters"
    check {[text 0 $row 30] eq $::burst_text} "$label: exact character order"
    set maximum [expr {round(1000 * $::burst_max)}]
    set elapsed [expr {round(1000 * $::burst_elapsed)}]
    check {$::burst_max < 0.010} "$label: worst input/render ${maximum} ms (limit 10 ms)"
    check {$::burst_elapsed < 0.300} "$label: 30 queued characters in ${elapsed} ms (limit 300 ms)"
}

proc check_horizontal_burst {} {
    check {[read32 [symbol _g_DocumentLength]] == $::burst_length + 30} "Horizontal scroll: no lost characters"
    check {[text 49 1 30] eq $::burst_text} "Horizontal scroll: exact character order"
    set maximum [expr {round(1000 * $::burst_max)}]
    check {$::burst_max < 0.010} "Horizontal scroll: worst input/render ${maximum} ms (limit 10 ms)"
}

rename run_step memory_run_step
proc run_step {} {
    if {[info exists ::burst_remaining] && $::burst_remaining} {
        if {[machine_info time] - $::burst_started >= 3} {
            check {0} "Queued input stalled with $::burst_remaining characters pending"
        }
        after time 0.1 run_step
        return
    }
    memory_run_step
}

set steps {
    {tap 7 0x80}
    {burst}
    {check_burst "Short document" 1}
    {burst}
    {chars "abcdefghijklmnopqrst"}
    {burst}
    {check_horizontal_burst}
    {tap 8 0x02}
    {tap 7 0x80}
    {tap 8 0x20}
    {burst}
    {check_burst "Insert before existing text" 1}
    {debug break; set ::saved_regs {}; foreach name {PC SP AF BC DE HL IX IY AF2 BC2 DE2 HL2} {lappend ::saved_regs $name [reg $name]}; set base [expr {[symbol s__HEAP]+128}]; set ::code {}; emit_call _Editor_Init; set finish [expr {$base+[llength $::code]}]; emit 0; debug write_block memory $base [binary format c* $::code]; set ::injecting 1; set ::injection_bp [debug set_bp $finish {} injection_done]; reg PC $base; debug cont}
    {populate}
    {keymatrixdown 6 0x02}
    {tap 7 0x10}
    {keymatrixup 6 0x02}
    {burst}
    {check_burst "Large document, last screen row" 22}
}
