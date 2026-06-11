#Requires AutoHotkey v2.0

global physicalLCtrl := false

~*LCtrl::physicalLCtrl := true
~*LCtrl Up::physicalLCtrl := false

; !: Alt, >!: rAlt
; ^: Ctrl

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

~^A::
{
    ShowWindowTitle()
}

#HotIf 1

ShowWindowTitle() {

    ; 获取当前活动窗口的标题
    activeWindowTitle := WinGetTitle("A")
    
    ; 获取当前鼠标位置
    MouseGetPos(&mouseX, &mouseY)
    
    ; 在鼠标位置附近显示ToolTip（偏移+20像素避免遮挡鼠标指针）
    ToolTip(activeWindowTitle, mouseX + 20, mouseY + 20)
    
    ; 设置定时器，1.5秒后自动移除ToolTip
    SetTimer(RemoveToolTip, -5000)
}

; Remove ToolTip 
RemoveToolTip() {
    ToolTip
}

ImportConfigFromLocal() {
    Prompt := "
    (
    Current config will be overwrote by local preset.
    It's suggest only AFTER doing pull/merge!
    After loading, you may need to do --skip-worktree to config.ini.
    Press OK to continue.
    )"

    user_choise := MsgBox(Prompt, "Warning: before LOADING local", "OKCancel")
    If user_choise = "Cancel" {
        Return
    }
    try {
        FileCopy("config_local.ini", "config.ini", true)
        ; Run "cmd.exe /c move /y config_local.ini config.ini", , "Max"
        MsgBox("Config imported from local successfully.", "Finished", 0x30) ; 0x30 = OK + Information icon
    }
    catch {
        MsgBox("Failed to import config from local. Please make sure config_local.ini exists and is not in use by other program.")
        Return
    }
    
}

; Save your current config to local preset, so that you can roll it back and pulling/merging files from Git without worrying about losing your personal settings.
ExportConfigToLocal() {
    Prompt := "
    (
    Local preset will be overwrote by current config.ini.
    You may lost your personal settings! 
    This should only be proceed BEFORE you try to do pull/merge and get files from Git!
    After saving, you can roll back config.ini and do pull/merge without conflict.
    Press OK to continue.
    )"

    user_choise := MsgBox(Prompt, "Warning: before overwriting local", 0x11) ; 0x11 = OK, Cancel + Exclamation (!)
    If user_choise = "Cancel" {
        Return
    }
    try {
        FileCopy("config.ini", "config_local.ini", true)
        ; Run "cmd.exe /c move /y config.ini config_local.ini", , "Max"
        MsgBox("Config exported to local successfully.", "Finished", 0x30) ; 0x30 = OK + Information icon
    }
    catch {
        MsgBox("Failed to export config to local. Please make sure config.ini exists and is not in use by other program.")
        Return
    }
}