#Requires AutoHotkey v2.0

#Include "fn_lab.ahk"

#HotIf IniRead("config.ini", "Switches", "VIM")

*>!J:: { ; [Ctrl|Shift]+ Alt+J
    Suspend false
    Send_HK("{Left}")
}

*>!K:: { ; [Ctrl|Shift]+ Alt+K
    Suspend false
    Send_HK("{Down}")
}

*>!L:: { ; [Ctrl|Shift]+ Alt+L
    Suspend false
    Send_HK("{Right}")
}

*>!I:: { ; [Ctrl|Shift]+ Alt+I
    Suspend false
    Send_HK("{Up}")
}

*>!U:: { ; Ctrl + ←/→
    Suspend false
    Send_HK("^{Left}")
    ; Send_HK("{Home}")
}
*>!O:: {
    Suspend false
    Send_HK("^{Right}")
    ; Send_HK("{End}")
}

*>!H:: { ; Home
    Suspend false
    Send_HK("{Home}")
}
*>!N:: { ; End
    Suspend false
    Send_HK("{End}")
}


*>!P:: {
    Suspend false
    Send_HK("{PgUp}")
}

*>!;:: {
    Suspend false
    Send_HK("{PgDn}")
}

*>!d:: {
    Suspend false
    Send_HK("{Del}")
}

*>!f:: {
    Suspend false
    Send_HK("{Backspace}")
}

#HotIf 1