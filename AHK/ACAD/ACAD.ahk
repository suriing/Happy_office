;AutoCAD related scripts

ACADPub()
{
;���� : �������� dwg ���� AutoCAD Publish ����Ʈ�� �ֱ�
;�߰� �ʿ� ���α׷� : FreeCommander(XE)
IfWinExist  FreeCommander	;FreeCommander ���࿩�� Ȯ��
{
	WinActivate
		send !^{Ins}	;���� ������� clipboard�� ����
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
IfWinExist AutoCAD	;AutoCAD ���࿩�� Ȯ��
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
;���� : FreeCommander���� ������ ������θ� AutoCAD Publish�� �Է��Ѵ�
;�߰� �ʿ� ���α׷� : FreeCommander(XE)
;�߰� ���� : AddDWG.png / PageSet.png / ExportFrom.png
;SetWorkingDir ����� ���� �߰����� ��ġ�� ������ �� ex) SetWorkingDir D:\ACAD
send publish{space}	;ACAD Publish ����
winwaitactive �Խ�	; = Publish
ImageSearch, Xpos, Ypos,1,1,900,630, %A_WorkingDir%\AddDWG.png
Xpos:=Xpos+100
Ypos:=Ypos+100
Click right %Xpos%, %Ypos%
sleep	200
send v
winwaitactive �Խ�	; = Publish
Click right %Xpos%, %Ypos%
sleep	200
send a
winwaitactive ���� ����	; = Select drawings
send ^v
send {enter}
winwaitactive �Խ�
MsgBox,,Updating...,Please wait until drawing list is updated. ;Pause while drawing list loaded
winwaitactive �Խ�
Click  %Xpos%, %Ypos%
send ^a
ImageSearch, Xpos, Ypos,1,1,900,630, %A_WorkingDir%\PageSet.png
Ypos:=Ypos+25
Click  %Xpos%, %Ypos%
ImageSearch, Xpos, Ypos,1,1,900,630, %A_WorkingDir%\ExportFrom.png
Xpos:=Xpos+31
Ypos:=Ypos+7
Click  %Xpos%, %Ypos%
winwaitactive �Խÿ� ���� ������ ���� ��������		; = Select template
send %A_MyDocuments%\AutoCAD_Template	;set your ACAD template folder
send {enter}
return
}
