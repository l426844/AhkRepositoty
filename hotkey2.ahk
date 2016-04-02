#SingleInstance force             ;可以再次运行时直接覆盖原来运行的 不弹出窗口


                                              ; # win ! alt ^ ctrl + shift   & 连接2个按键成为快捷键
!1::                                          ;alt +1   开始自动启动C:\Users\l426844\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
WinGet, active_id, ID, A
WinMinimize, ahk_id %active_id%
return

!2::
val2=100
WinSet, AlwaysOnTop, toggle, Calculator
WinGet, active_id, ID, A
WinGet, val1, Transparent, ahk_id %active_id%
if val1 = %val2%
{
WinSet, Transparent, 255, ahk_id %active_id%
;MsgBox, 4, , %val1%   !=
}
else WinSet, Transparent, %val2%, ahk_id %active_id%
;MsgBox, 4, , %val1%
return

!3::
WinGetTitle, Title, A
WinSet, AlwaysOnTop, toggle, %Title%
;MsgBox, 4, , 1
;WinGet, ExStyle, ExStyle, ahk_id %active_id%
;if (ExStyle & 0x8)
;{
return

!4::
WinSet, AlwaysOnTop, off, %Title%
return

!8::
Process ,Close ,explorer.exe
Run explorer.exe, , , NewPID
return

^!9::                   ;关机  ctrl+alt 9
Shutdown, 2+8 
return

^!0::
Shutdown, 2+4    ;force reboot 
return



;;;day5
;Hotkey, !j, MyLabel
;Hotkey, !k, MyLabe2    这边用热键不行  直接用可以
return
!h::send,{left}
return
!l::send,{right}
return
!j::send,{down}
return
!k::send,{up}
return

MyLabel:
{
send,{down}
return
}
MyLabe2:
{
send,{up}
return
}

!$::send,{end}
return
!0::send,{home}
return
!o::send,{end}{enter}
return
+!o::send,{up}{end}{enter}   ;+是  shift   大写
return
!r::send ^y
return
!u::send ^z    ;发组合键
return

!a::  MouseMove, -1,  0,, R
; MouseMove 的完整语法是：     !Left也可以
; MouseMove, X, Y [, Speed, R]
; X – X 坐标；Y – Y 坐标；[ ] 里面的是可选参数，Speed – 移动的速度，其范围是 0 – 100，不填写任何数字的话，参数默认是 0 ，最快速移动；最后的 R 表示前面的参数 X、Y 是相对鼠标当前位置，如果不带这个参数， X、Y 就表示屏幕上的坐标。讲起来很啰嗦，大家比较上面的代码就明白。
!w::    MouseMove,  0, -1,, R
!d:: MouseMove,  1,  0,, R
!s::  MouseMove,  0,  1,, R
return

;  --2016.4.1 自动粘贴搜索----------------------------------------------------------

getAscStr(str)     
{
    charList:=StrSplit(str)
    for key,val in charList
        out.="{Asc " . asc(val) . "}"
    return out
}

!f::
send {enter}
send {enter}
send  % getAscStr("find ")
send {"}
send %clipboard%
send {"}
send  % getAscStr(" ./*")
send {enter}
return
!g::
send {enter}
send {enter}
send % getAscStr("grep ")
send {"}
send %clipboard%
send {"}
send % getAscStr(" ./* -rn")
send {enter}
return
