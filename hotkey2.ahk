#SingleInstance force             ;�����ٴ�����ʱֱ�Ӹ���ԭ�����е� ����������


                                              ; # win ! alt ^ ctrl + shift   & ����2��������Ϊ��ݼ�
!1::                                          ;alt +1   ��ʼ�Զ�����C:\Users\l426844\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
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

^!9::                   ;�ػ�  ctrl+alt 9
Shutdown, 2+8 
return

^!0::
Shutdown, 2+4    ;force reboot 
return



;;;day5
;Hotkey, !j, MyLabel
;Hotkey, !k, MyLabe2    ������ȼ�����  ֱ���ÿ���
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
+!o::send,{up}{end}{enter}   ;+��  shift   ��д
return
!r::send ^y
return
!u::send ^z    ;����ϼ�
return

!a::  MouseMove, -1,  0,, R
; MouseMove �������﷨�ǣ�     !LeftҲ����
; MouseMove, X, Y [, Speed, R]
; X �C X ���ꣻY �C Y ���ꣻ[ ] ������ǿ�ѡ������Speed �C �ƶ����ٶȣ��䷶Χ�� 0 �C 100������д�κ����ֵĻ�������Ĭ���� 0 ��������ƶ������� R ��ʾǰ��Ĳ��� X��Y �������굱ǰλ�ã����������������� X��Y �ͱ�ʾ��Ļ�ϵ����ꡣ�������܆��£���ұȽ�����Ĵ�������ס�
!w::    MouseMove,  0, -1,, R
!d:: MouseMove,  1,  0,, R
!s::  MouseMove,  0,  1,, R
return

;  --2016.4.1 �Զ�ճ������----------------------------------------------------------

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
