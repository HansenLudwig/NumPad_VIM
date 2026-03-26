#Requires AutoHotkey v2.0

#Include "fn_lab.ahk" ; levenshtein_distance()

#HotIf WinActive("ahk_exe devecostudio64.exe")

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

*<!Enter:: {
    Suspend false
    Send_HK("{End}{Enter}")
}

*>!Enter:: {
    Suspend false
    Send_HK("{End};{Enter}")
}

; *: 不需要终止符(例如 Space, . 或 Enter) 来触发热字串. 
; O(Oskar): 进行替换时忽略自动替换热字串的终止符. 它可以用于当您希望使用终止符让热字串保持清晰, 却不希望终止符显示在屏幕上的时候.
;           例如, 如果 :o:ar::aristocrat 为热字串, 那么输入 "ar" 后跟着空格键会产生不含尾随空格的 "aristocrat", 这样可以让您不需要按住 Backspace 的情况下补上单词的复数或所有格形式. 使用 O0(字母 O 后跟着零) 来关闭此选项.
; B0: 【不】自动退格来删除您输入的缩写. 关闭此选项后可以使用 B 来启用. 
:*:`nimpor::{Enter}import  from `'`';{Left 2}
:*:/** ::{NumpadDiv}**  *{NumPadDiv}{Left 3}
:://::{NumpadDiv 2}

; 注意：不要使用“ xxx"来定义热字串。会使得空格不被视为上一部分的终结符。
; 导致输入的“ xxx”被视为上一个单词的一部分（除非上一个单词以分隔符结尾，如：
;   } else { 的情况不受影响
; 常用运算符
:*:eq ::={Space}
:*:eqq ::=={Space}
:*:/ddy ::=={Space}
:*:eeq ::==={Space}
:*:/ddd ::==={Space}
:*:aeq ::{NumPadAdd}={Space}
:*:=> ::=> {`{}
:*:/dy ::>{Space}
:*:/xy ::>{Space}
:*:/ddy ::>={Space}
:*:/xdy ::<={Space}
:*:/or ::or{Space}
:*:or ::||{Space}
:*:/and ::and{Space}
:*:and ::&&{Space}
:*:/add ::{NumPadAdd}{Space}
:*:/jia ::{NumPadAdd}{Space}
:*:/sub ::{NumPadSub}{Space}
:*:/mi ::{NumPadDiv}{Space}
:*:/aone ::{NumPadAdd}{Space}1
:*:/mone ::{NumPadSub}{Space}1

; 其他
::oo::0
::one::1
:O:return::return `;{Left}

; 常用代码块
:*:/if ::if{Space}
:*:if ::if () {`{}}{Enter}{Up}{End}{Left 3}
:O:/else::else{Space}
:*: else`n::{Space}else {`{}{Enter}
:*:else`n:: else {`{}{Enter}
:*:/while ::while{Space}
:O:while::while () {`{}{Enter}{Up}{End}{Left 3}
:*:/for ::for{Space}
:*:for ::for ( `; `; ) {`{}{Enter}{Up}{End}{Left 7}
:*?:.forE::.forEach(() => {`{}}{`}});{End}{Left 9}
:*:/try ::try{Space}
:*:try ::try {`{}}{`}{Enter}{Down}{Space}catch (error) {`{}{Enter}{Up 2}

; 数据类型
:?*:`: str::`: string
:?*:`:str::`: string
:?*:`: num::`: number
:?*:`:num::`: number
:?*:`: bool::`: boolean
:?*:`:bool::`: boolean


#HotIf 1