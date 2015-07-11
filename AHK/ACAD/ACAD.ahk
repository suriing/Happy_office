;AutoCAD related scripts

^#P::
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

ACADPubSub()
{
;���� : FreeCommander���� ������ ������θ� AutoCAD Publish�� �Է��Ѵ�
;�߰� �ʿ� ���α׷� : FreeCommander(XE)
;�߰� ���� : AddDWG.png / PageSet.png / ExportFrom.png
;Language setting
ACADPubWinName="�Խ�"	;check Publish window name
ACADDwgSelWinName="���� ����"	;check select drawing window name
ACADTempSelWinName="�Խÿ� ���� ������ ���� ��������"	;check select template window name
;;
send publish{space}	;ACAD Publish ����
IfWinActive %ACADPubWinName%
{
WinActivate
}
winwaitactive %ACADPubWinName%
ImageSearch, Xpos, Ypos,1,1,900,630, %A_ScriptDir%\AddDWG.png
Xpos:=Xpos+100
Ypos:=Ypos+100
Click right %Xpos%, %Ypos%
sleep	200
send v
winwaitactive %ACADPubWinName%
Click right %Xpos%, %Ypos%
sleep	200
send a
winwaitactive %ACADDwgSelWinName%
send ^v
send {enter}
winwaitactive %ACADPubWinName%
MsgBox,,Updating...,Please wait until drawing list is updated. ;Pause while drawing list loaded
winwaitactive %ACADPubWinName%
Click  %Xpos%, %Ypos%
send ^a
ImageSearch, Xpos, Ypos,1,1,900,630, %A_ScriptDir%\PageSet.png
Ypos:=Ypos+25
Click  %Xpos%, %Ypos%
ImageSearch, Xpos, Ypos,1,1,900,630, %A_ScriptDir%\ExportFrom.png
Xpos:=Xpos+31
Ypos:=Ypos+7
Click  %Xpos%, %Ypos%
winwaitactive %ACADTempSelWinName%
send %A_MyDocuments%\AutoCAD_Template	;set your ACAD template folder
send {enter}
return
}
