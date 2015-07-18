;default
clipboard_1=Input
clipboard_2=what you want
clipboard_3=to paste

SetMultiClip() ;Multi clipboard setting
{
Gui, Add, Button, x50 y150 w100 h30 , OK
Gui, Add, Button, x236 y600 w50 h-170 , Button
Gui, Add, Text, x16 y20 w110 h20 , Current Clipboard
Gui, Add, Text, x16 y50 w110 h20 , Clipboard_1
Gui, Add, Text, x16 y80 w110 h20 , Clipboard_2
Gui, Add, Text, x16 y110 w110 h20 , Clipboard_3
Gui, Add, Edit, x126 y20 w350 h20 vclipboard, %clipboard%
Gui, Add, Edit, x126 y50 w350 h20 vclipboard_1, %clipboard_1%
Gui, Add, Edit, x126 y80 w350 h20 vclipboard_2, %clipboard_2%
Gui, Add, Edit, x126 y110 w350 h20 vclipboard_3, %clipboard_3%
Gui, Show, x577 y331 h192 w500, Multi Clipboard Setting			;창 이름
Return
GuiClose:
ButtonOk:							;OK 버튼 누르면
Gui, submit							;입력된 사항 반영
gui, destroy							;gui로 생성된 창 destroy※안하면 다음번 실행 불가
return
}

PasteMultiClip() ;다중 클립보드 붙여넣기
{
wingettitle, title,a						;현재 창이름을 title변수에 저장
Gui, Add, Button, x200 y150 w100 h30 , &Cancel ;C 앞에 &을 붙임으로써 단축키 활성화
Gui, Add, Button, x236 y600 w50 h-170 , Button
Gui, Add, Button, x16 y20 w110 h20 , Current_Clipboard
Gui, Add, Button, x16 y50 w110 h20 , Clipboard_&1
Gui, Add, Button, x16 y80 w110 h20 , Clipboard_&2
Gui, Add, Button, x16 y110 w110 h20 , Clipboard_&3
Gui, Add, Edit, x126 y20 w350 h20 vclipboard, %clipboard%
Gui, Add, Edit, x126 y50 w350 h20 vclipboard_1, %clipboard_1%
Gui, Add, Edit, x126 y80 w350 h20 vclipboard_2, %clipboard_2%
Gui, Add, Edit, x126 y110 w350 h20 vclipboard_3, %clipboard_3%
Gui, Show, x577 y331 h192 w500, Multi Clipboard			;창 이름
Return
ButtonCurrent_Clipboard:							;Current_Clipboard 버튼 누르면
gui, destroy							;gui로 생성된 창 destroy※안하면 다음번 실행 불가
WinActivate %title%
winwaitactive %title%
send ^v
Return
Buttonclipboard_1:							;clipboard_1 버튼 누르면
gui, destroy							;gui로 생성된 창 destroy※안하면 다음번 실행 불가
clipboard_Old=%clipboard%
clipboard=%clipboard_1%
WinActivate %title%
winwaitactive %title%
send ^v
clipboard=%clipboard_Old%
Return
Buttonclipboard_2:							;clipboard_1 버튼 누르면
gui, destroy							;gui로 생성된 창 destroy※안하면 다음번 실행 불가
clipboard_Old=%clipboard%
clipboard=%clipboard_2%
WinActivate %title%
winwaitactive %title%
send ^v
clipboard=%clipboard_Old%
Return
Buttonclipboard_3:							;clipboard_1 버튼 누르면
gui, destroy							;gui로 생성된 창 destroy※안하면 다음번 실행 불가
clipboard_Old=%clipboard%
clipboard=%clipboard_3%
WinActivate %title%
winwaitactive %title%
send ^v
clipboard=%clipboard_Old%
Return
ButtonCancel:							;Cancel 버튼 누르면
gui, destroy							;gui로 생성된 창 destroy※안하면 다음번 실행 불가
return
}
