#F2::
;���̵� ��� �Է�
send JUNHEON.CHOI
send {tab}
send cJh-0217
send {enter}
return

#F3::
;��� �Է�
send cJh-0217
send {enter}
return

#F4:: ;��������
InputBox, ����ð�, ��� �� �����ұ��?, , , 400, 120, , , , , 60
����ð�*=60
Run  shutdown -s -t %����ð�%
return

^#F4:: ;�������� ���
Run  shutdown -a
return

#c::
;win+c ���� ����
IfWinExist SpeedCrunch						;���Ⱑ ����Ǿ� ������
	WinActivate						;���� â�� Ȱ��ȭ ��
else								;����Ǿ� ���� ������
	Run D:\�����ڷ�\���α׷�\SpeedCrunch\SpeedCrunch.exe	;�����Ŵ����
return

#n::
;win+n NP++ ����
IfWinExist new 1 - Notepad++					;�޸���(���ο� ����)�� ����Ǿ� ������
	WinActivate						;�޸����� Ȱ��ȭ ��
else								;����Ǿ� ���� ������
	Run D:\�����ڷ�\���α׷�\npp.6.7.3\notepad++.exe	;�����Ŵ����
return

#a::
;win+a Atom ����
IfWinExist atom					;Atom�� ����Ǿ� ������
	WinActivate						;Ȱ��ȭ ��
else								;����Ǿ� ���� ������
	Run C:\Users\junheon.choi\AppData\Local\atom\app-1.0.0\atom.exe	;�����Ŵ����
WinMaximize
return

#o::
;win+o ȭ�麸ȣ�� �۵�
Run %windir%\system32\scrnsave.scr /s
return

#Ins::
;win+Insert Outlook ���������� �߰�
WinActivate	Outlook ;Outlook���� �̵�
sleep 500
setkeydelay 300
send 	{alt}FISA
winwaitactive ���� ����
send {right}{tab 2}{enter}
return
