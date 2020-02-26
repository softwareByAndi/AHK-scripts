#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

^r:: ; press control+r to reload
  Msgbox, reloading this script
  Reload, "E:\Documents\get_color.ahk"
return

+!c::
    Loop
    {
    	MouseGetPos, x, y
	PixelGetColor Color, x, y, RGB
        ToolTip, %Color%
    }
Return