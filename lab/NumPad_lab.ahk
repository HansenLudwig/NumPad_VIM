#Requires AutoHotkey v2.0

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
    ; MsgBox(activeWindowTitle)
    
    ; 设置定时器，1.5秒后自动移除ToolTip
    SetTimer(RemoveToolTip, -5000)
}

; 移除ToolTip的函数
RemoveToolTip() {
    ToolTip  ; 清除ToolTip
}
