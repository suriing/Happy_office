DDMSMutiDown()
{
;목적 : DDMS 파일 다중 다운로드
;추가 필요 프로그램 : None
wingettitle, ddms,a	;현재 창이름을 ddms로 저장
winrestore, %ddms%
WinMove, %ddms%,,,, 1310, 450 ;스크립트에 맞는 사이즈로 창크기 변경
send ^0
setkeydelay 300
inputbox FormatSetting1,Enter Document type : original or pdf  ;Select file type
{
if FormatSetting1=original
{
FormatSetting=%A_WorkingDir%\DDMSOriDown.png
}
else if FormatSetting1=pdf
{
FormatSetting=%A_WorkingDir%\DDMSPdfDown.png
}
else  ;if you didn't type original of PDF, script is ended.
{
MsgBox,,DDMS download helper,Format should be original of pdf.
return
}
}
inputbox docqty,Enter Document quantity ;다운받을 문서 수량 입력
WinActivate %ddms%
loop %docqty%
{
ImageSearch, Xpos, Ypos,1,1,1298,437, %FormatSetting%
{
if ErrorLevel = 0
{
Xpos:=Xpos+6
Ypos:=Ypos+6
click %Xpos%, %Ypos%
winwaitactive File Download
ImageSearch, mX, mY,1,1,1298,437, %A_WorkingDir%\Save.png
click %mX%, %mY%
winwaitactive 다른 이름으로 저장
send {enter}
ifwinactive 다른 이름으로 저장 확인
{
send n
winwaitactive 다른 이름으로 저장
send {esc}
winwaitactive File Download
send {esc}
}
}
else
{
}
}
WinActivate %ddms%
winwaitactive %ddms%
send {down}
}
MsgBox,,DDMS download helper,End.
return
}

DDMSWorkspacePermit()
{
;목적 : Workspace 권한 일괄변경
;추가 필요 프로그램 : None
Permissions=%A_WorkingDir%\Permissions.png
Addbutton=%A_WorkingDir%\Add.png
Choosetarget=%A_WorkingDir%\choose.png
Arrow=%A_WorkingDir%\Arrow.png

winwaitactive Properties: Info
ImageSearch, Xpos, Ypos,1,1,610,590, %Permissions%
Xpos:=Xpos+5
Ypos:=Ypos+5
click %Xpos%, %Ypos%
winwaitactive Properties: Permissions
sleep 1000
ImageSearch, Xpos, Ypos,1,1,610,590, %Addbutton%
Xpos:=Xpos+5
Ypos:=Ypos+5
click %Xpos%, %Ypos%
winwaitactive Choose a user/group -- 웹 페이지 대화 상자
sleep 1000
send {tab 2}09000612
send {enter}
sleep 2000
ImageSearch, Xpos, Ypos,1,1,791,613, %Choosetarget%
Xpos:=Xpos+10
Ypos:=Ypos+10
click %Xpos%, %Ypos%
sleep 300
click 522, 311
sleep 1000
send {shift down}{tab 2}{shift up}
send {enter}
winwaitactive Set Access Permissions
sleep 1000
send {tab}w
sleep 1000
send {shift down}{tab 2}{shift up}
send {enter}
winwaitactive Properties: Permissions
MsgBox,,Check permission status,
winwaitactive Properties: Permissions
send {shift down}{tab 2}{shift up}
send {enter}
return
}
