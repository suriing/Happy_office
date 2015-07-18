;script TEST file
test()
{
Msgbox, 4,,%A_ScriptDir%
Msgbox, 4,,%A_WorkingDir%
return
}

;#F7::
;; ,은 `, 으로 나타내시면 됩니다.
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
