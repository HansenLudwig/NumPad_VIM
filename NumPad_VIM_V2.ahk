#Requires AutoHotkey v2.0
SendMode "Input"
#SingleInstance Force
; ====== 设置窗口标题匹配时的行为：====== ;
SetTitleMatchMode 2 ; 1. 开头匹配; 2. 任意位置匹配; 3. 完全匹配
#WinActivateForce
; SetControlDelay 1 ; Default: 20
; SetWinDelay 0 ; Default: 100
; === 按下键/鼠标后的延迟（即按住多久才松开）=== ;
SetKeyDelay -1 ; Default: 10
SetMouseDelay -1 ; Default: 10

Suspend 1 ; 1: suspend all, 0: unsuspend, -1: On -> Off, Off -> On

SendLevel 0
#InputLevel 1
#Include ".\lab\fn_lab.ahk" ; levenshtein_distance()

#HotIf 1
#SuspendExempt True

internal_cmd(cmd){
    if cmd = "list" {
        _val := IniRead("config.ini", "SHORTCUTS")
        MsgBox(_val, "List of shortcuts")
        return 1
    } else if cmd = "Reload" {
        Reload
        return 1
    } else if cmd = "edit" {
        Edit
        return 1
    } else if cmd = "exit" {
        ExitApp
        return 1
    }
    return 0 ; not internal command
}

~^F4::
{
    Suspend 0
    User_Input := "NULL"
    User_Input_Raw := InputBox("COH; Taimanin; GTFO; Steam/Epic/WeMod; spaz", "Run_Script")
    User_Input := User_Input_Raw.Value
    if User_Input = ""
        return
    _ic := internal_cmd(User_Input)
    if _ic {
        return
    }

    Try
    {
        Try {
            _val := IniRead("config.ini", "AKA", User_Input)
            _val := IniRead("config.ini", "SHORTCUTS", _val)
        }
        Catch as err{
            _val := IniRead("config.ini", "SHORTCUTS", User_Input)
        }
        Run _val
    }
    Catch as err ; err.What = 'IniRead' or err.What = 'Run'
    {
        _val := IniRead("config.ini", "SHORTCUTS")
        _val_sec := StrSplit(_val, '`n')
        _err_min := 2
        _key_min := ''
        _last_key := ''
        for line in _val_sec {
            config := StrSplit(line, Delimiters:='=', OmitChars:= A_Space, MaxArrSize:= 2)
            _ld := lev_dist(User_Input, config[1])
            if config[2] != "0" {
                _last_key := config[1]
            }
            if _ld < _err_min {
                _err_min := _ld
                if config[2] = "0"
                    _key_min := _last_key
                else
                    _key_min := config[1]
            }
        }
        if StrLen(_key_min) > 0 {
            _val := IniRead("config.ini", "SHORTCUTS", _key_min)
            try{
                SetWorkingDir ".\.."
                Run _val
                SetWorkingDir A_InitialWorkingDir
            }
            catch
                MsgBox(_val, "404: File not Found!")
        } else {
            MsgBox(_val, "404: Shortcut not Found!")
        }
    }
    SetSuspend()
    Return
}

~^Lwin:: ; Ctrl+Win
{ ; 点击任务栏上的 Desktop-Toolbar 菜单
    Suspend False
    CoordMode "Mouse", "Screen"
    ;Sleep 50
    Send "{Lwin}"
    ;Sleep 50
    Click 3765, 1635 ; 65, 1200
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

#Include ".\lab\NumPad_VSCode.ahk"

#Include ".\lab\NumPad_lab.ahk"

