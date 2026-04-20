#Requires AutoHotkey v2.0

#Include "fn_lab.ahk" ; levenshtein_distance()

#HotIf WinActive("ahk_exe Code.exe")

~^s:: ; Ctrl + S || Win + D: Reload
~#d:: { ; Only for VSCode which should be my ahk editor.
    Suspend false
    Sleep 500
    Reload
}

; *: 不需要终止符(例如 Space, . 或 Enter) 来触发热字串. 
; O(Oskar): 进行替换时忽略自动替换热字串的终止符. 它可以用于当您希望使用终止符让热字串保持清晰, 却不希望终止符显示在屏幕上的时候.
;           例如, 如果 :o:ar::aristocrat 为热字串, 那么输入 "ar" 后跟着空格键会产生不含尾随空格的 "aristocrat", 这样可以让您不需要按住 Backspace 的情况下补上单词的复数或所有格形式. 使用 O0(字母 O 后跟着零) 来关闭此选项.
; ? (问号): 即使热字串在另一个单词中也会被触发; 也就是说, 在它之前输入的字符是字母数字时. 例如, 如果 :?:al::airline 是热字串, 输入 "practical " 会产生 "practicairline ". 使用 ?0 来关闭此选项.
; B0: 【不】自动退格来删除您输入的缩写. 关闭此选项后可以使用 B 来启用. 


; 注意：不要使用“ xxx"来定义热字串。会使得空格不被视为上一部分的终结符。
; 导致输入的“ xxx”被视为上一个单词的一部分（除非上一个单词以分隔符结尾，如：
;   } else { 的情况不受影响
; 常用运算符
:*:eq ::={Space}
:*:eqq ::=={Space}
:*:/ddy ::=={Space}
:*:eeq ::==={Space}
:*:/ddd ::==={Space}

; 常用代码块

:*:__n::__name__ == "__main__":{Enter}main()
:*:`nels::else: {#} {Enter}
:*:def main(::def main() -> None:{Enter}

#HotIf 1