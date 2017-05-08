#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
Menu, Tray, Icon, imageres.dll, 244


;-=-=-=- * * * -=-=-=-

; Scroll left
XButton1 & WheelUp::
MouseGetPos,,, mwin, mcontrol, 1
Loop %A_EventInfo%
	; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
	SendMessage, 0x114, 0, 0, %mcontrol%, ahk_id %mwin%
Return

; Scroll right
XButton1 & WheelDown::
MouseGetPos,,, mwin, mcontrol, 1
Loop %A_EventInfo%
	; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
	SendMessage, 0x114, 1, 0, %mcontrol%, ahk_id %mwin%
Return

; Make XButton1 NOP
XButton1::Return


;-=-=-=- * * * -=-=-=-
; Utilities for our custom handler includes

MouseIsOver(WinTitle) {
	MouseGetPos,,, Win
	return WinExist(WinTitle . " ahk_id " . Win)
}

;-=-=-=- * * * -=-=-=-
; Custom handler includes

#Include %A_ScriptDir%\HScroll-XButtons_includes\AndroidStudio.ahk
#Include %A_ScriptDir%\HScroll-XButtons_includes\Blender.ahk

;-+-*-+-


;-=-=-=- * * * -=-=-=-
; The END

