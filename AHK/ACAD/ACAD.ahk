;AutoCAD related scripts

ACADPub()
{
;목적 : 현재폴더 dwg 파일 AutoCAD Publish 리스트에 넣기
;추가 필요 프로그램 : FreeCommander(XE)
IfWinExist  FreeCommander	;FreeCommander 실행여부 확인
{
	WinActivate
		send !^{Ins}	;현재 폴더경로 clipboard에 저장
}
	else
	{
	Msgbox, 4,,Please run FreeCommander(XE) first. Want to visit official download page?
	IfMsgBox Yes	;Yes, go to FreeCommander official  web site
	{
	run http://freecommander.com/en/downloads/
	}
	return	;No, end script
	}
IfWinExist AutoCAD	;AutoCAD 실행여부 확인
{
	WinActivate AutoCAD
	ACADPubSub()	;Call Sub script named ACADPubSub
}
else
	{
	Msgbox, 0,,Please run AutoCAD first.
	Msgbox, 4,,Do you want to run AutoCAD?.
	IfMsgBox Yes	;Yes, run AutoCAD
	{
		run %ProgramFiles%\Autodesk\AutoCAD Mechanical 2012\acad.exe	;Please check installed location
		winwaitactive AutoCAD
		ACADPubSub()
	}
	IfMsgBox No	;No, end script
	{
	Msgbox, 0,,Script is ended.
	}
	}
return
}

ACADPubSub()
{
;목적 : FreeCommander에서 가져온 폴더경로를 AutoCAD Publish에 입력한다
;추가 필요 프로그램 : FreeCommander(XE)
;추가 파일 : AddDWG.png / PageSet.png / ExportFrom.png
;SetWorkingDir 명령을 통해 추가파일 위치를 지정할 것 ex) SetWorkingDir D:\ACAD
send publish{space}	;ACAD Publish 수행
winwaitactive 게시	; = Publish
ImageSearch, Xpos, Ypos,1,1,900,630, %A_WorkingDir%\AddDWG.png
Xpos:=Xpos+100
Ypos:=Ypos+100
Click right %Xpos%, %Ypos%
sleep	200
send v
winwaitactive 게시	; = Publish
Click right %Xpos%, %Ypos%
sleep	200
send a
winwaitactive 도면 선택	; = Select drawings
send ^v
send {enter}
winwaitactive 게시
MsgBox,,Updating...,Please wait until drawing list is updated. ;Pause while drawing list loaded
winwaitactive 게시
Click  %Xpos%, %Ypos%
send ^a
ImageSearch, Xpos, Ypos,1,1,900,630, %A_WorkingDir%\PageSet.png
Ypos:=Ypos+25
Click  %Xpos%, %Ypos%
ImageSearch, Xpos, Ypos,1,1,900,630, %A_WorkingDir%\ExportFrom.png
Xpos:=Xpos+31
Ypos:=Ypos+7
Click  %Xpos%, %Ypos%
winwaitactive 게시에 대한 페이지 설정 가져오기		; = Select template
send %A_MyDocuments%\AutoCAD_Template	;set your ACAD template folder
send {enter}
return
}
