# Run on Panasonic_FS-A1GT with emul\dsk\DOS2_msxworks.dsk mounted as diska.
# Set MSXWORKS_TEST_LOG to the absolute destination for the test log.
set save_settings_on_exit off
set save_setup_at_exit_depth none
set renderer none
set throttle off
set mute on
set testlog [open $env(MSXWORKS_TEST_LOG) w]

proc check {condition message} {
    if {![uplevel 1 [list expr $condition]]} {
        puts $::testlog "FAIL: $message"
        puts $::testlog [debug read_block VRAM 0 1920]
        puts $::testlog "CPU PC=[reg PC] SP=[reg SP]"
        flush $::testlog
        exit 1
        error $message
    }
    puts $::testlog "PASS: $message"
    flush $::testlog
}

proc text {x y length} {
    return [debug read_block VRAM [expr {$y * 80 + $x}] $length]
}

proc tap {row mask} {
    keymatrixdown $row $mask
    after time 0.1 [list keymatrixup $row $mask]
}

proc chars {value} {
    type_via_keybuf -- $value
    set ::typing 1
}

proc run_step {} {
    if {[info exists ::typing] && $::typing} {
        if {$::type_via_keybuf::bp_id ne "invalid" || [peek16 0xF3F8] != [peek16 0xF3FA]} {
            after time 0.1 run_step
        } else {
            set ::typing 0
            after time 0.5 run_step
        }
        return
    }
    if {[llength $::steps] == 0} {
        puts $::testlog "ALL EDITOR UI TESTS PASSED"
        close $::testlog
        exit 0
        return
    }
    set step [lindex $::steps 0]
    set ::steps [lrange $::steps 1 end]
    if {[catch {uplevel #0 $step} error]} {
        puts $::testlog "ERROR: $error"
        flush $::testlog
        exit 1
        return
    }
    after time 0.5 run_step
}

set steps {
    {check {[string first "Environment check" [text 0 0 1920]] >= 0} "Startup environment check"}
    {tap 7 0x80}
    {check {[text 1 0 4] eq "File" && [text 7 0 5] eq "Block" && [text 14 0 11] eq "Text-layout"} "First three menus"}
    {check {[text 27 0 6] eq "Search" && [text 35 0 5] eq "Print" && [text 42 0 4] eq "View" && [text 48 0 7] eq "Options" && [text 75 0 4] eq "HELP"} "Remaining menus and HELP last"}
    {check {[text 0 23 1] eq [format %c 29] && [text 79 23 1] eq [format %c 28]} "Status arrows at first and last columns"}
    {check {[text 1 23 23] eq "   Line=0001   Col=0001"} "Status spaces, clean flag and four-digit coordinates"}
    {check {[text 36 23 8] eq "untitled" && [text 65 23 13] eq "Insert WW=Off"} "Centered untitled and default Insert/WW Off"}
    {tap 7 0x10}
    {check {[text 20 23 4] eq "0001" && [text 2 23 1] eq " "} "STOP on empty line leaves editor active and clean"}
    {tap 2 0x40}
    {check {[text 0 1 1] eq "a" && [text 2 23 1] eq "*" && [text 20 23 4] eq "0002"} "Physical character input marks modified"}
    {chars "bc"}
    {check {[text 0 1 3] eq "abc"} "Translated characters preserve order"}
    {tap 8 0x10}
    {chars "X"}
    {check {[text 0 1 4] eq "abXc"} "Insert in middle"}
    {tap 8 0x08}
    {check {[text 0 1 4] eq "abX "} "Delete removes next character"}
    {tap 7 0x20}
    {check {[text 0 1 3] eq "ab "} "Backspace removes previous character"}
    {tap 7 0x80}
    {chars "cd"}
    {check {[text 0 1 2] eq "ab" && [text 0 2 2] eq "cd" && [text 9 23 4] eq "0002"} "Enter creates a line"}
    {keymatrixdown 6 0x02}
    {tap 8 0x10}
    {check {[text 9 23 4] eq "0002" && [text 20 23 4] eq "0001"} "Ctrl Left moves to current word start"}
    {tap 8 0x10}
    {check {[text 9 23 4] eq "0001" && [text 20 23 4] eq "0001"} "Ctrl Left crosses newline to previous word"}
    {tap 8 0x80}
    {check {[text 9 23 4] eq "0002" && [text 20 23 4] eq "0001"} "Ctrl Right crosses newline to next word"}
    {tap 8 0x80}
    {check {[text 20 23 4] eq "0003"} "Ctrl Right stops at document end"}
    {tap 5 0x10}
    {check {[text 0 1 2] eq "ab" && [text 0 2 2] eq "  " && [text 9 23 4] eq "0001" && [text 20 23 4] eq "0003"} "Ctrl W deletes the word to the left"}
    {chars "\rcd"}
    {tap 8 0x10}
    {tap 2 0x40}
    {check {[text 0 2 2] eq "  " && [text 9 23 4] eq "0002" && [text 20 23 4] eq "0001"} "Ctrl A deletes the word to the right"}
    {chars "cd"}
    {check {[text 0 1 2] eq "ab" && [text 0 2 2] eq "cd"} "Word deletions leave the remaining document intact"}
    {tap 8 0x02}
    {check {[text 9 23 4] eq "0001" && [text 20 23 4] eq "0001"} "Ctrl Home moves to document start"}
    {tap 7 0x10}
    {check {[text 9 23 4] eq "0002" && [text 20 23 4] eq "0003" && [text 0 1 2] eq "ab" && [text 0 2 2] eq "cd"} "Ctrl STOP moves to document end without editing"}
    {keymatrixup 6 0x02}
    {tap 8 0x02}
    {tap 7 0x10}
    {check {[text 20 23 4] eq "0003" && [text 0 2 2] eq "cd"} "STOP moves to logical line end without editing"}
    {tap 8 0x02}
    {check {[text 20 23 4] eq "0001"} "Home moves to start of line"}
    {tap 7 0x20}
    {check {[text 0 1 4] eq "abcd" && [text 9 23 4] eq "0001" && [text 20 23 4] eq "0003"} "Backspace joins lines"}
    {tap 8 0x04}
    {check {[text 65 23 4] eq "Over"} "Insert key enables overwrite"}
    {chars "Z"}
    {check {[text 0 1 4] eq "abZd"} "Overwrite replaces without shifting"}
    {tap 8 0x04}
    {check {[text 65 23 6] eq "Insert"} "Insert key restores insertion"}
    {tap 8 0x20}
    {tap 8 0x40}
    {check {[text 9 23 4] eq "0001" && [text 20 23 4] eq "0004"} "Cursor bounded on single line"}
    {tap 7 0x40}
    {check {[text 3 2 4] eq "Exit" && [text 2 23 1] eq "*"} "SELECT opens File without replacing status"}
    {tap 8 0x10}
    {check {[text 70 2 5] eq "About"} "Left wraps to HELP and dropdown stays within screen"}
    {tap 7 0x80}
    {check {[text 23 9 9] eq "MSX-Works"} "About opens"}
    {tap 7 0x04}
    {check {[text 0 1 4] eq "abZd"} "Closing About restores document"}
    {tap 7 0x40}
    {tap 8 0x40}
    {tap 7 0x80}
    {check {[string trim [text 8 3 30]] eq "EDITOR KEYS (1/2)" && [string trim [text 8 9 60]] eq "Ctrl+W              Delete word to the left"} "HELP Keys opens the first key list page"}
    {tap 8 0x40}
    {check {[string trim [text 8 3 30]] eq "EDITOR AND MENU KEYS (2/2)"} "Down opens the next Keys help page"}
    {tap 8 0x80}
    {check {[string trim [text 8 3 30]] eq "EDITOR KEYS (1/2)"} "Right returns to the previous Keys help page"}
    {tap 7 0x04}
    {tap 7 0x40}
    {tap 8 0x80}
    {tap 8 0x80}
    {check {[text 9 2 17] eq "(Not implemented)"} "Block is visibly pending"}
    {tap 8 0x80}
    {check {[text 16 2 9] eq "Word Wrap"} "Text-layout contains Word Wrap"}
    {tap 7 0x80}
    {check {[text 72 23 5] eq "WW=On" && [text 0 1 4] eq "abZd"} "Word Wrap On preserves document"}
    {tap 7 0x40}
    {tap 7 0x80}
    {check {[text 72 23 6] eq "WW=Off"} "Word Wrap Off restored"}
    {tap 7 0x40}
    {tap 8 0x80}
    {tap 8 0x80}
    {tap 8 0x80}
    {check {[text 44 2 11] eq "Text editor" && [text 44 3 14] eq "Word processor" && [text 44 4 11] eq "Spreadsheet" && [text 44 5 8] eq "Database"} "View lists all application modes"}
    {tap 8 0x40}
    {check {([debug read VRAM [expr {0x800 + 3*10 + 5}]] & 0x08) == 0} "Down selects Word processor"}
    {tap 7 0x80}
    {check {[text 23 9 20] eq "Not implemented yet."} "Unavailable mode explicitly reported"}
    {tap 7 0x80}
    {check {[text 0 1 4] eq "abZd" && [text 36 23 8] eq "untitled"} "Unavailable mode leaves editor active"}
    {tap 7 0x40}
    {tap 8 0x40}
    {tap 8 0x40}
    {tap 7 0x80}
    {check {[text 23 9 20] eq "Not implemented yet."} "Spreadsheet explicitly reported"}
    {tap 7 0x04}
    {tap 7 0x40}
    {tap 8 0x40}
    {tap 8 0x40}
    {tap 8 0x40}
    {tap 7 0x80}
    {check {[text 23 9 20] eq "Not implemented yet."} "Database explicitly reported"}
    {tap 7 0x04}
    {tap 7 0x40}
    {tap 8 0x80}
    {tap 7 0x80}
    {check {[text 65 23 4] eq "Over"} "Options toggles typing mode"}
    {tap 8 0x04}
    {chars [string repeat "q" 100]}
    {check {[text 20 23 4] eq "0104"} "Long line accepts characters and updates column"}
    {check {([debug read VRAM [expr {0x800 + 10 + 9}]] & 0x01) != 0} "Horizontal scrolling keeps cursor visible"}
    {tap 7 0x40}
    {tap 8 0x10}
    {tap 8 0x10}
    {tap 8 0x10}
    {tap 8 0x10}
    {tap 7 0x80}
    {check {[text 72 23 5] eq "WW=On" && [text 20 23 4] eq "0104" && [text 0 1 3] eq "abZ"} "Wrap reflows long line without changing logical column"}
    {check {[text 0 2 23] eq [string repeat "q" 23]} "Wrapped text continues on second screen row"}
    {chars [string repeat "\r" 25]}
    {check {[text 9 23 4] eq "0026" && [text 20 23 4] eq "0001"} "Vertical scrolling after many newlines"}
    {keymatrixdown 6 0x02}
    {tap 8 0x02}
    {check {[text 9 23 4] eq "0001" && [text 20 23 4] eq "0001" && [text 0 1 3] eq "abZ"} "Ctrl Home scrolls back to document start"}
    {tap 8 0x40}
    {check {[text 9 23 4] eq "0002" && [text 20 23 4] eq "0001"} "Cursor moves down one visual row"}
    {tap 4 0x01}
    {check {[text 0 1 3] eq "qqq" && [text 9 23 4] eq "0001" && [text 20 23 4] eq "0081"} "Ctrl K scrolls down one row without moving the cursor"}
    {tap 4 0x10}
    {check {[text 0 1 3] eq "abZ" && [text 9 23 4] eq "0001" && [text 20 23 4] eq "0081"} "Ctrl O scrolls up one row without moving the cursor"}
    {tap 7 0x10}
    {check {[text 9 23 4] eq "0026" && [text 20 23 4] eq "0002"} "Ctrl STOP scrolls to document end"}
    {keymatrixup 6 0x02}
    {tap 7 0x40}
    {tap 8 0x10}
    {tap 8 0x10}
    {tap 7 0x80}
    {check {[text 19 10 38] eq "Exit without saving the modified text?"} "Exit prompts for unsaved text"}
    {tap 7 0x80}
    {check {[text 2 23 1] eq "*" && [text 9 23 4] eq "0026"} "Exit defaults to Cancel and keeps text"}
    {tap 7 0x40}
    {tap 7 0x80}
    {tap 8 0x80}
    {tap 7 0x80}
    {check {[text 75 0 4] ne "HELP" && [debug read {VDP regs} 7] == 0xF0 && [debug read {VDP regs} 13] == 0} "Discard returns to DOS and restores colors"}
}

proc await_start {} {
    if {[string first "Environment check" [text 0 0 1920]] >= 0} {
        run_step
    } elseif {[machine_info time] > 60} {
        check {0} "Startup timed out"
    } else {
        after time 0.5 await_start
    }
}
after time 15 await_start
after realtime 90 {puts $::testlog "FAIL: emulator timeout"; flush $::testlog; exit 1}
