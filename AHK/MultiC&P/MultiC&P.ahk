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
Gui, Show, x577 y331 h192 w500, Multi Clipboard Setting			;â �̸�
Return
GuiClose:
ButtonOk:							;OK ��ư ������
Gui, submit							;�Էµ� ���� �ݿ�
gui, destroy							;gui�� ������ â destroy�ؾ��ϸ� ������ ���� �Ұ�
return
}

PasteMultiClip() ;���� Ŭ������ �ٿ��ֱ�
{
wingettitle, title,a						;���� â�̸��� title������ ����
Gui, Add, Button, x200 y150 w100 h30 , &Cancel ;C �տ� &�� �������ν� ����Ű Ȱ��ȭ
Gui, Add, Button, x236 y600 w50 h-170 , Button
Gui, Add, Button, x16 y20 w110 h20 , Current_Clipboard
Gui, Add, Button, x16 y50 w110 h20 , Clipboard_&1
Gui, Add, Button, x16 y80 w110 h20 , Clipboard_&2
Gui, Add, Button, x16 y110 w110 h20 , Clipboard_&3
Gui, Add, Edit, x126 y20 w350 h20 vclipboard, %clipboard%
Gui, Add, Edit, x126 y50 w350 h20 vclipboard_1, %clipboard_1%
Gui, Add, Edit, x126 y80 w350 h20 vclipboard_2, %clipboard_2%
Gui, Add, Edit, x126 y110 w350 h20 vclipboard_3, %clipboard_3%
Gui, Show, x577 y331 h192 w500, Multi Clipboard			;â �̸�
Return
ButtonCurrent_Clipboard:							;Current_Clipboard ��ư ������
gui, destroy							;gui�� ������ â destroy�ؾ��ϸ� ������ ���� �Ұ�
WinActivate %title%
winwaitactive %title%
send ^v
Return
Buttonclipboard_1:							;clipboard_1 ��ư ������
gui, destroy							;gui�� ������ â destroy�ؾ��ϸ� ������ ���� �Ұ�
clipboard_Old=%clipboard%
clipboard=%clipboard_1%
WinActivate %title%
winwaitactive %title%
send ^v
clipboard=%clipboard_Old%
Return
Buttonclipboard_2:							;clipboard_1 ��ư ������
gui, destroy							;gui�� ������ â destroy�ؾ��ϸ� ������ ���� �Ұ�
clipboard_Old=%clipboard%
clipboard=%clipboard_2%
WinActivate %title%
winwaitactive %title%
send ^v
clipboard=%clipboard_Old%
Return
Buttonclipboard_3:							;clipboard_1 ��ư ������
gui, destroy							;gui�� ������ â destroy�ؾ��ϸ� ������ ���� �Ұ�
clipboard_Old=%clipboard%
clipboard=%clipboard_3%
WinActivate %title%
winwaitactive %title%
send ^v
clipboard=%clipboard_Old%
Return
ButtonCancel:							;Cancel ��ư ������
gui, destroy							;gui�� ������ â destroy�ؾ��ϸ� ������ ���� �Ұ�
return
}
