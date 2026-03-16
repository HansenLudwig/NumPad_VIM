SendMode "Input"
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1

Suspend True

SendLevel 0
#InputLevel 1

#HotIf 1
#SuspendExempt True
~^F4::
{
    Suspend False
    User_Input := "NULL"
    User_Input_O := InputBox("COH; Taimanin; GTFO; Steam/Epic/WeMod; spaz", "Run_Script")
    User_Input := User_Input_O.Value
    Try
        If (User_Input = "COH")
            Run "CoH12_RunStart.ahk"
        Else If (User_Input = "GTFO")
            Run "GTFO_Terminal_cmd.ahk"
        Else If (User_Input = "Helldivers" Or User_Input = "Helldiver")
            Run ".\Helldivers\Helldivers_Run.ahk"
        Else If (User_Input = "TPN" Or User_Input = "Tap_Ninja")
            Run "Tap_Ninja_AutoClicker_Space.ahk"
        Else If (User_Input = "SOB")
            Run '"E:\Games\Battle.net\Battle.net Launcher.exe" --setregion=US'
        Else If (User_Input = "Steam" Or User_Input = "sps")
            Run '"D:\Program Files (x86)\Steam\steam.exe" -dev'
        Else If (User_Input = "WeMod")
            Run "C:\Users\lance\AppData\Local\WeMod\WeMod.exe"
        Else If (User_Input = "KP" Or User_Input = "Keepass")
            Run "E:\Program Files (x86)\KeePass-2.56-Portable\KeePass.exe"
        Else If (User_Input = "Epic")
            Run "D:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe"
        Else If (User_Input = "spaz")
            Run 'explore "D:\Projects\AutoHotKey"'
        Else If (User_Input = "Reload")
            Reload
    Catch
        MsgBox "File not found!", "404"
    SetSuspend()
    Return
}

~^Lwin::
{
    Suspend False
    CoordMode "Mouse", "Screen"
    ;Sleep 50
    Send "{Lwin}"
    ;Sleep 50
    Click 65, 1200
    SetSuspend()
    Return
}

SetSuspend()
{
    if (GetKeyState("NumLock", "T")) {
        Suspend True
    } else {
        Suspend False
    }
}

#HotIf GetKeyState("NumLock", "T")
~NumLock::
{
    Suspend False
    SoundBeep 789
    Return
}


#HotIf !GetKeyState("NumLock", "T")
#SuspendExempt False
~NumLock::
{
    Suspend True
    SoundBeep 532
    Return
}

~Enter::
{
    Send "{NumLock}"
    Suspend True
    SoundBeep 532
    Return
}

Delete:: Send 1      ;{Numpad1}

End:: Send 2      ;{Numpad2}

PgDn:: Send 3      ;{Numpad3}

Insert:: Send 4      ;{Numpad4}

Home:: Send 5      ;{Numpad5}

PgUp:: Send 6      ;{Numpad6}

PrintScreen:: Send 7      ;{Numpad7}

ScrollLock:: Send 8      ;{Numpad8}

Pause:: Send 9      ;{Numpad9}

F12::
\::
{
    Send "."      ;{NumpadDot}
}

RShift:: Send 0      ;{Numpad0}
