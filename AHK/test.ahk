;script TEST file
test()
{
Msgbox, 4,,%A_ScriptDir%
Msgbox, 4,,%A_WorkingDir%
return
}

;#F7::
;; ,�� `, ���� ��Ÿ���ø� �˴ϴ�.
;A=1,2,3,4,5
;Loop,Parse,A,`,
;{
;Msgbox,%A_LoopField%
;}
;B=2A3A4A5A
;Loop,Parse,B,A
;{
;Msgbox,% A_LoopField
;}
;return
