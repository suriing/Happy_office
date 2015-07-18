#F2::
;아이디 비번 입력
send JUNHEON.CHOI
send {tab}
send cJh-0217
send {enter}
return

#F3::
;비번 입력
send cJh-0217
send {enter}
return

#F4:: ;예약종료
InputBox, 종료시간, 몇분 후 종료할까요?, , , 400, 120, , , , , 60
종료시간*=60
Run  shutdown -s -t %종료시간%
return

^#F4:: ;예약종료 취소
Run  shutdown -a
return

#c::
;win+c 계산기 실행
IfWinExist SpeedCrunch						;계산기가 실행되어 있으면
	WinActivate						;계산기 창이 활성화 됨
else								;실행되어 있지 않으면
	Run D:\개인자료\프로그램\SpeedCrunch\SpeedCrunch.exe	;실행시킴ㅋㅋ
return

#n::
;win+n NP++ 실행
IfWinExist new 1 - Notepad++					;메모장(새로운 문서)이 실행되어 있으면
	WinActivate						;메모장이 활성화 됨
else								;실행되어 있지 않으면
	Run D:\개인자료\프로그램\npp.6.7.3\notepad++.exe	;실행시킴ㅋㅋ
return

#a::
;win+a Atom 실행
IfWinExist atom					;Atom이 실행되어 있으면
	WinActivate						;활성화 됨
else								;실행되어 있지 않으면
	Run C:\Users\junheon.choi\AppData\Local\atom\app-1.0.0\atom.exe	;실행시킴ㅋㅋ
WinMaximize
return

#o::
;win+o 화면보호기 작동
Run %windir%\system32\scrnsave.scr /s
return

#Ins::
;win+Insert Outlook 데이터파일 추가
WinActivate	Outlook ;Outlook으로 이동
sleep 500
setkeydelay 300
send 	{alt}FISA
winwaitactive 계정 설정
send {right}{tab 2}{enter}
return
