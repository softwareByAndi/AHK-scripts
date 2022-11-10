#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



winID := 0
winID_2 := 0
winT := 255
clickThrough := 0
visible := 0
primary_toggle_window_ID := 0
primary_toggle_window_ID_2 := 0
activeWindow := 0
verbose := "true"



reloadScript(){
	BlockInput Off
		MsgBox, reloading windowOverlay.ahk
		Reload, windowOverlay.ahk
}

$+!^r::                 ; Hotkey is Shift + Alt + Ctrl + r
	reloadScript()
Return
$+!^e::                 ; Hotkey is Shift + Alt + Ctrl + e
	msgbox, exiting windowOverlay.ahk
	exitApp
Return













; -------------------------------------------------------------------
; makes active window click through. If a click through window is 
; already active, sets active click through window to clickable
;
; Hotkey is Shift + Ctrl + Space (on key release)
; -------------------------------------------------------------------


	; -------------------------------------------------------------------
    ; setOrClearActiveWindowAsClickThroughTarget
    ;
	; to set or unset the currently active window to always toggle Clickable and Click-Through 
    ; no matter which window is active:
    ; 
    ; Hotkey is Shift + Ctrl + w
	; -------------------------------------------------------------------

    $+^w::
        if !primary_toggle_window_ID                        ; check if target window already set?
        {                                                   ; target window not set. 
            primary_toggle_window_ID := WinExist("A")       ; set target window to active window
            msgBox, initiating primary_toggle_window_ID:  %primary_toggle_window_ID%    ; verbose confirmation
        }
        else
        {                                                   ; target window is set
            primary_toggle_window_ID := 0                   ; clear target window
            msgBox, clearing primary_toggle_window_ID:  %primary_toggle_window_ID%      ; verbose confirmation
        }
    return



; -------------------------------------------------------------------
; if primary_toggle_window_ID is not set via the setOrClearActiveWindowAsClickThroughTarget function, 
; toggles active window
; else, it toggles the targeted window saved in the primary_toggle_window_ID variable
; 
; Hotkey is Shift + Ctrl + Space (on key release)
; -------------------------------------------------------------------

$+^Space Up::


    ; TOGGLE CLICK THROUGH
    if clickThrough = 0                                     ; check if click through is already active
    {					        
        if !primary_toggle_window_ID                        ; is target window set?
        {                                                   ; target window is not set
            winID := WinExist("A")			                ; save active window ID as target window
        }
        else
        {                                                   ; target window has been set
            winID := primary_toggle_window_ID               ; grab saved target window ID 
        }

        WinSet, Transparent, %winT%, ahk_id %winID%		    ; reset window transparency to saved value (if any)
        WinSet, AlwaysOnTop, On, ahk_id %winID%	            ; set always on top settings.
        WinSet, ExStyle, +0x20, ahk_id %winID%	            ; set target window to click through

        clickThrough := 1

    }	
    
    
    ; TOGGLE CLICKABLE
    else
    {	
        if primary_toggle_window_ID
        {                       
            ; for debug purposes, just in case the primary_toggle_window_ID has to be reset to re-toggle the window
            ; not sure if this is needed anymore

            winID := primary_toggle_window_ID	            ; just in case the value gets changed somehow?
        }
                                                            
        WinGet, winT, Transparent, ahk_id %winID%    	    ; save target Click-Through window transparency
        WinSet, Transparent, OFF, ahk_id %winID%		    ; reset window transparency to FULL VISIBILITY
        WinSet, AlwaysOnTop, Off, ahk_id %winID%		    ; remove always on top settings.

        WinSet, ExStyle, -0x20, ahk_id %winID%		        ; set saved window to clickable
        winactivate, ahk_id %winID%				            ; make window active

        clickThrough := 0
    }

    sleep, 200		; sleep the script for .2 seconds
return





















; -------------------------------------------------------------------
; renders active /or saved window invisible (which by default is unclickable).
; toggles window between visible and invisible.
; meant for accessing extra monitors through chrome-cast, or
;   quick toggling between two windows
;
; Hotkey is Ctrl + Alt + Space (on key release)
; -------------------------------------------------------------------


	; -------------------------------------------------------------------
    ; setOrClearActiveWindowAsToggleTarget
    ;
	; to set or unset the currently active window to always toggle on and off 
    ; no matter which window is active:
    ; 
    ; Hotkey is Ctrl + Alt + w
	; -------------------------------------------------------------------

    $^!w::
        if !primary_toggle_window_ID_2                              ; target window for toggle has not been set
        {
            primary_toggle_window_ID_2 := WinExist("A")             ; set active window as target for toggle
            if (verbose = "true")
            {
                msgBox, initiating primary_toggle_window_ID_2:  %primary_toggle_window_ID_2%
            }
        }
        else                                                        ; target window for toggle has not been set
        {
            if WinExist("ahk_id" primary_toggle_window_ID_2)        ; reset hidden window to FULL VISIBILITY
            {
                WinSet, AlwaysOnTop, OFF, ahk_id %primary_toggle_window_ID_2%	    ; turn off always-on-top settings.
                WinSet, Transparent, OFF, ahk_id %primary_toggle_window_ID_2%		; turn transparency off
            }
            else                                                    ; targeted window doesnt exist anymore
            {
                visible := 0                                 ; double safety to reset visible value incase
            }                                                       ; it wasnt properly called via the toggle function

            primary_toggle_window_ID_2 := 0                         ; clear target window ID

            if (verbose = "true")                                   
            {                                                       
                msgBox, clearing primary_toggle_window_ID_2:  %primary_toggle_window_ID_2%
            }
        }

        if (verbose = "false")          ; I like a verbose confirmation in this case, but these msgBoxs arent necessary
        {                               
            verbose := "true"
        }
    return





; -------------------------------------------------------------------
; if primary_toggle_window_ID_2 is not set via the setOrClearActiveWindowAsToggleTarget function, 
; toggles active window
; else, it toggles the targeted toggle window saved in the primary_toggle_window_ID_2 variable
; 
; Hotkey is Ctrl + Alt + Space (on key release)
; -------------------------------------------------------------------

$^!Space Up::


	; TOGGLE WINDOW INVISIBLE
    if visible = 0                                       ; check if click through is already active
    {					        
        if !primary_toggle_window_ID_2
        {	
            winID_2 := WinExist("A")

            WinSet, Transparent, 0, ahk_id %winID_2%	        ; set window transparency to saved value
            visible := 1			                        ; save active window ID
        }
        else if WinExist("ahk_id" primary_toggle_window_ID_2)
        {
            winID_2 := primary_toggle_window_ID_2

            WinSet, Transparent, 0, ahk_id %winID_2%	        ; set window transparency to saved value
            visible := 1			                        ; save active window ID
        }
        else                                                    ; saved value for target window ID does not exist...
        {
            msgBox, ERROR, Window DOE:  primary_toggle_window_ID_2 -- %primary_toggle_window_ID_2%
        }
        
        WinActivate, ahk_class %activeWindow%                   ; return to previously active window if exists

    }	
    
    
    
    ; TOGGLE WINDOW VISIBLE
    else
    {
        WinGetClass, activeWindow, A                            ; save currently active window
                        
        if primary_toggle_window_ID_2                           ; target window exists
        {
            if WinExist("ahk_id" primary_toggle_window_ID_2)
            {
                winID_2 := primary_toggle_window_ID_2
                WinSet, AlwaysOnTop, On, ahk_id %winID_2%	    ; keep always on top settings.

                WinSet, Transparent, OFF, ahk_id %winID_2%		; turn transparency off
                winactivate, ahk_id %winID_2%			        ; make window active

                visible := 0
            }
            else                                                ; not a serious error 
            {                                                   
                    ; window crashed, or was closed via task manager or something
                msgBox, ERROR, Window DOE:  primary_toggle_window_ID_2 -- %primary_toggle_window_ID_2%
            }
        }
        else if WinExist("ahk_id" winID_2)                      ; no target window. check for saved window ID
        {
            WinSet, Transparent, OFF, ahk_id %winID_2%		    ; turn transparency off
            winactivate, ahk_id %winID_2%			            ; make window active

            visible := 0
        }
        else                                                    ; no target window & no saved window ID
        {
            msgBox, ERROR, Window DOE:  winID_2 -- %winID_2%
        }
    }

    sleep, 200		; sleep the script for .2 seconds
return







; -------------------------------------------------------------------
; selects active click through window, if exists
; -------------------------------------------------------------------

$+^NumpadIns Up::    				    ; Hotkey is Shift + Ctrl + Numpad 0
    if clickThrough = 1				    ; click through not active
    {
        winactivate, ahk_id %winID_2%
    }
return

$^!NumpadIns Up::    				    ; Hotkey is Ctrl  + Alt + Numpad 0
    if visible = 1				; click through not active
    {
        winactivate, ahk_id %winID%
    }
return






; -------------------------------------------------------------------
; adjust transparency of active window
; Hotkey is Shift + Control + (=, 1...0, -)    to change window transparency
; -------------------------------------------------------------------


+^=::                                        ; Hotkey is Shift + Control + =    INVISIBLE
WinSet, Transparent, 0, A   ; the active window
winT := 0
return
+^1::                                        ; Hotkey is Shift + Control + 1    Transparency 10% 
WinSet, Transparent, 25, A  ; the active window
winT := 25
return
+^2::                                        ; Hotkey is Shift + Control + 2    Transparency 20% 
WinSet, Transparent, 50, A  ; the active window
winT := 50
return
+^3::                                        ; Hotkey is Shift + Control + 3    Transparency 30% 
WinSet, Transparent, 75, A  ; the active window
winT := 75
return
+^4::                                        ; Hotkey is Shift + Control + 4    Transparency 36%
WinSet, Transparent, 90, A  ; the active window
winT := 90
return
+^5::                                        ; Hotkey is Shift + Control + 5    Transparency 40%
WinSet, Transparent, 100, A  ; the active window
winT := 100
return
+^6::                                        ; Hotkey is Shift + Control + 6    Transparency 48%
WinSet, Transparent, 120, A  ; the active window
winT := 120
return
+^7::                                        ; Hotkey is Shift + Control + 7    Transparency 52%
WinSet, Transparent, 130, A  ; the active window
winT := 130
return
+^8::                                        ; Hotkey is Shift + Control + 8    Transparency 56%
WinSet, Transparent, 140, A  ; the active window
winT := 140
return
+^9::                                        ; Hotkey is Shift + Control + 9    Transparency 60%
WinSet, Transparent, 150, A  ; the active window
winT := 150
return
+^0::                                        ; Hotkey is Shift + Control + 0    Transparency 70%
WinSet, Transparent, 175, A  ; the active window
winT := 175
return
+^-::                                        ; Hotkey is Shift + Control + -    FULL VISIBILITY
WinSet, Transparent, OFF, A  ; the active window
winT := OFF
return
