IME_CHECK(WinTitle)
{
WinGet,hWnd,ID,%WinTitle%
Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
DetectSave := A_DetectHiddenWindows
DetectHiddenWindows,ON
SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
if (DetectSave <> A_DetectHiddenWindows)
   DetectHiddenWindows,%DetectSave%
return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd)
{
return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}
sendH( sAnsiText )
{
    ;cafe.naver.com/autohotkey/199  by nnesori
    wStrLen:=DllCall("MultiByteToWideChar",uint,0, uint,0, str,sAnsiText  , uint,-1, str, 0, uint,0 )

    varSetCapacity(cu_WideText,wStrLen*2,0)
    DllCall("MultiByteToWideChar",uint,0, uint,0, str,sAnsiText  , uint,-1, str,cu_WideText, uint, wStrLen )

    nEventCount :=  wStrLen* 2 , VarSetCapacity( events, 28*nEventCount, 0 )

    ptrWCode:=&cu_WideText , p:=&events

    loop, % wStrLen-1
    {
        code:=*ptrWCode|( *(ptrWCode+1)<<8 ),ptrWCode+=2
        p:=NumPut(4,NumPut(code,NumPut(1,p+0 )+2,0,"UShort")+0)+16
        p:=NumPut(6,NumPut(code,NumPut(1,p+0 )+2,0,"UShort")+0)+16
    }

    result := DllCall( "SendInput", "uint", nEventCount, "uint", &events, "int",28)

    if( ErrorLevel or result < nEventCount )
    {
        MsgBox, [SendInput] failed: EL = %ErrorLevel% ~ %result% of %nEventCount%
        return, false
    }
    return, true
}

EngInput()
;목적 : 현재 키보드의 입력언어 영문으로 유지/전환
{
ret := IME_CHECK("A")						;현재 창의 입력언어 확인
if %ret% <> 0							;영어가 아니면(영어 = 0)
{
Send, {vk15sc1F2}   						;한영키 누름
}
return
}
