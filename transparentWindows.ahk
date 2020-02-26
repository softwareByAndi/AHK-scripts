#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
#InstallKeybdHook
#InstallMouseHook


winID := 0
winID_2 := 0
winT := 255
clickThrough := 0
clickThrough_2 := 0
primary_toggle_window_ID := 0
primary_toggle_window_ID_2 := 0
ahkWinClass := 0
activeWindow := 0
verbose := "true"
checkColor := 0

ctrlSave :=1

topWinArray := Object()


reloadScript(){
	BlockInput Off
		MsgBox, reloading transparentWindows.ahk
		Reload, E:\Documents\GitHub\AHK\transparentWindows.ahk
}
exitActiveWindow(){
	WinGetTitle, Title, A
	PostMessage, 0x112, 0xF060,,, %Title%
}
$+^r::
	reloadScript()
Return
$+!^e::
	msgbox, exiting transparentWindows.ahk
	exitApp
Return
$+^q:: 			; ctrl shift q closes active window
	exitActiveWindow()
return

	; testing f4 key
	; f4 key isn't triggering, so this is remapping it to alt+f4 fo rthe purpose of FFXIV
; $f4:: send !{f4}
$f4:: send {'}


activateColorToolTip:
	checkColor := 1
        Loop
        {
            MouseGetPos, x, y
            PixelGetColor Color, x, y, RGB
            ToolTip, %Color%
            if !checkColor
                break
        }
        ToolTip
return

$!c::	; enable color tool tip
    Gosub, activateColorToolTip
Return
$+!c::	; disable color tool tip
	checkColor := 0
Return



	;disable and remap caps lock;
$CapsLock:: send {}
$!CapsLock:: send {CapsLock} 

	;disable and remap ctrl s in browser
;$^s::
;	WinGetClass, ahkWinClass, A
;	if (ahkWinClass = "Chrome_WidgetWin_1")
;		return
;
;	send, ^s
;return
;$^+s::
;	WinGetClass, ahkWinClass, A
;	if (ahkWinClass = "Chrome_WidgetWin_1")
;		send, ^s
;	else
;		send ^+s
;return



enableSQLShortcuts() {
    ;MsgBox, enabling SQL shortcuts
    run E:\Documents\GitHub\AHK\SQL_shortcuts.ahk
}

!s::
    enableSQLShortcuts()
return
:*:ahk_enable(sqlShortcuts)::
    enableSQLShortcuts()
return




getWinClass() {
    WinGetClass, ahkWinClass, A
    MsgBox, the Active Window's class is "%ahkWinClass%".
}
:*:ahk_GetWinClass::
	getWinClass()
Return






; -------------------------------------------------------------------
; makes active window click through. If a click through window is 
; already active, sets active click through window to clickable
; -------------------------------------------------------------------
newWindow_1:
    if !primary_toggle_window_ID
    {
        primary_toggle_window_ID := WinExist("A")
	msgBox, initiating primary_toggle_window_ID:  %primary_toggle_window_ID%
    }
    else
    {
        primary_toggle_window_ID := 0
	msgBox, clearing primary_toggle_window_ID:  %primary_toggle_window_ID%
    }
return

$^!w::					; Shift + Ctrl + W
    Gosub, newWindow_1
Return



$^!Space Up::				; Shift + Ctrl + Space (on key release)

	; TOGGLE WINDOW OFF
if clickThrough = 0
{					        ; check if click through is already active
    if !primary_toggle_window_ID
    {
        winID := WinExist("A")			                ; save active window ID
    }
    else
    {
	winID := primary_toggle_window_ID
    }

    WinSet, Transparent, %winT%, ahk_id %winID%		; reset window transparency to previous settings
    WinSet, AlwaysOnTop, On, ahk_id %winID%	; set always on top settings.
    WinSet, ExStyle, +0x20, ahk_id %winID%	; set active window to click through

    clickThrough := 1

}	; TOGGLE WINDOW ON
else
{	

    if primary_toggle_window_ID
    {
	winID := primary_toggle_window_ID	; just in case the value get's changed somehow
    }
						; click through already active
    WinGet, winT, Transparent, ahk_id %winID%    	; save active window transparency
    WinSet, Transparent, OFF, ahk_id %winID%		; reset window transparency to previous settings
    WinSet, AlwaysOnTop, Off, ahk_id %winID%		; remove always on top settings.

    WinSet, ExStyle, -0x20, ahk_id %winID%		; set saved window to clickable
    winactivate, ahk_id %winID%				; make window active

    clickThrough := 0
}

    sleep, 1000		; sleep the script for 2 seconds
return





















; -------------------------------------------------------------------
; renders active/orsaved window invisible (which by default is unclickable)
; toggles window between visible-active and invisible
; meant for accessing extra monitors through chrome-cast.
; -------------------------------------------------------------------


	; -------------------------------------------------------------------
	; save a window to always toggle on no matter which window is active
	; -------------------------------------------------------------------

newWindow_2:
    if !primary_toggle_window_ID_2
    {
        primary_toggle_window_ID_2 := WinExist("A")
	if (verbose = "true")
	{
		msgBox, initiating primary_toggle_window_ID_2:  %primary_toggle_window_ID_2%
	}
    }
    else
    {
	if WinExist("ahk_id" primary_toggle_window_ID_2)
    	{
            WinSet, AlwaysOnTop, OFF, ahk_id %primary_toggle_window_ID_2%	; turn off always-on-top settings.
    	    WinSet, Transparent, OFF, ahk_id %primary_toggle_window_ID_2%		; turn transparency off
	}
	else
	{
	    clickThrough_2 := 0
	}
        primary_toggle_window_ID_2 := 0
	if (verbose = "true")
	{
		msgBox, clearing primary_toggle_window_ID_2:  %primary_toggle_window_ID_2%
	}
    }
    if (verbose = "false")
    {
	verbose := "true"
    }
return

autoSetupNewRemoteDesktop:
    if !primary_toggle_window_ID_2
    {
        run, Chrome Remote Desktop.lnk, C:\Users\Leonidas Emilio Arai\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Chrome Apps\,, Max
	
        WinWait, ahk_class Chrome_WidgetWin_1, , 3
        if ErrorLevel
        {
    	    MsgBox, WinWait (Chrome_WidgetWin_1) timed out.
    	    return
        }
        Sleep, 500
        WinActivate, ahk_class Chrome_WidgetWin_1
    	send {F11}
	
	    verbose := "false"
    	Gosub, newWindow_2
    } 
    else 
    {
        WinActivate, ahk_id %primary_toggle_window_ID_2%
        exitActiveWindow()
        Gosub, newWindow_2
    }
return

$+^t::
    MsgBox, primary_toggle_window_ID_2:   %primary_toggle_window_ID_2%
return
$+^e::						; activated by keyboard special key 'favorites_a'
    Gosub, autoSetupNewRemoteDesktop
Return
$+^w::
    Gosub, newWindow_2
return




$+^Space Up::				; Shift + Ctrl + Space (on key release)

	; TOGGLE WINDOW OFF
if clickThrough_2 = 0
{					        ; check if click through is already active
    if !primary_toggle_window_ID_2
    {	
        winID_2 := WinExist("A")

    	WinSet, Transparent, 0, ahk_id %winID_2%	; set window transparency to saved value
    	clickThrough_2 := 1			                ; save active window ID
    }
    else if WinExist("ahk_id" primary_toggle_window_ID_2)
    {
	winID_2 := primary_toggle_window_ID_2

    	WinSet, Transparent, 0, ahk_id %winID_2%	; set window transparency to saved value
    	clickThrough_2 := 1			                ; save active window ID
    }
    else
    {
	msgBox, ERROR, Window DOE:  primary_toggle_window_ID_2 -- %primary_toggle_window_ID_2%
    }
    
	WinActivate, ahk_class %activeWindow%

}	; TOGGLE WINDOW ON
else
{
    WinGetClass, activeWindow, A
					; click through already active
    if primary_toggle_window_ID_2
    {
	if WinExist("ahk_id" primary_toggle_window_ID_2)
    	{
	    winID_2 := primary_toggle_window_ID_2
            WinSet, AlwaysOnTop, On, ahk_id %winID_2%	; keep always on top settings.

    	    WinSet, Transparent, OFF, ahk_id %winID_2%		; turn transparency off
    	    winactivate, ahk_id %winID_2%			; make window active

    	    clickThrough_2 := 0
        }
    	else
    	{
	    msgBox, ERROR, Window DOE:  primary_toggle_window_ID_2 -- %primary_toggle_window_ID_2%
    	}
    }
    else if WinExist("ahk_id" winID_2)
    {

    	WinSet, Transparent, OFF, ahk_id %winID_2%		; turn transparency off
    	winactivate, ahk_id %winID_2%			; make window active

    	clickThrough_2 := 0
    }
    else
    {
	msgBox, ERROR, Window DOE:  winID_2 -- %winID_2%
    }
}

    sleep, 200		; sleep the script for .2 seconds
return







; -------------------------------------------------------------------
; selects active click through window, if exists
; -------------------------------------------------------------------

$+^NumpadIns Up::    				; Ctrl  + Shift +Numpad 0
if clickThrough_2 = 1				; click through not active
{
    winactivate, ahk_id %winID_2%
}
return

$^!NumpadIns Up::    				; Ctrl  + Shift +Numpad 0
if clickThrough = 1				; click through not active
{
    winactivate, ahk_id %winID%
}
return


$+^h::
tempArray := Object()

tempArray.Insert(0)
tempArray.Insert(1)
tempArray.Insert(2)
tempArray.Insert(3)
tempArray.Insert(4)

tempString := "Array List"

for i, element in tempArray
{

tempString = 
(
%tempString%
%element%
)

}

InputBox, UserInput, , %tempString%, , 640, 480
if ErrorLevel
{
      MsgBox, Cancel was pressed
}
else
{
    MsgBox, you entered %UserInput%
}

return





:*:ahk hot string function test 1::
   MsgBox Wow!
   MsgBox this is
   Run, Notepad.exe
   winactivate, Untitled - Notepad
   WinWaitActive, Untitled - Notepad
   send, 7 lines{!}{enter}
   sendinput, inside the ctrl{+}j hotkey
Return


:*:SFX::
	send, SFX: (){space}
return

:*:IDKemoji::
	send, ¯\_(ツ)_/¯
return

+^=::                                        ; Hotkey is Shift + Control + =    - Transparency 0
WinSet, Transparent, 0, A   ; the active window
winT := 0
return
+^1::                                        ; 
WinSet, Transparent, 25, A  ; the active window
winT := 25
return
+^2::                                        ; 
WinSet, Transparent, 50, A  ; the active window
winT := 50
return
+^3::                                        ; 
WinSet, Transparent, 75, A  ; the active window
winT := 75
return
+^4::                                        ;
WinSet, Transparent, 90, A  ; the active window
winT := 90
return
+^5::                                        ; 
WinSet, Transparent, 100, A  ; the active window
winT := 100
return
+^6::                                        ; 
WinSet, Transparent, 120, A  ; the active window
winT := 120
return
+^7::                                        ;
WinSet, Transparent, 130, A  ; the active window
winT := 130
return
+^8::                                        ; Hotkey is Shift + Control + 8    - Transparency 140
WinSet, Transparent, 140, A  ; the active window
winT := 140
return
+^9::                                        ; Hotkey is Shift + Control + 9    - Transparency 150
WinSet, Transparent, 150, A  ; the active window
winT := 150
return
+^0::                                        ; Hotkey is Shift + Control + 0    - Transparency 175
WinSet, Transparent, 175, A  ; the active window
winT := 175
return
^NumpadDel::                          ; Hotkey is Shift + Control + Numpad Dot    - Transparency 230
WinSet, Transparent, 230, A  ; the active window
winT := 230
return
+^-::                                        ; Hotkey is Shift + Control + -    - Transparency OFF
WinSet, Transparent, OFF, A  ; the active window
winT := OFF
return
