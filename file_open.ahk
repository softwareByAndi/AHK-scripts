#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

^r:: ; press control+r to reload
  Msgbox, reloading this script
  Reload, "E:\Documents\get_color.ahk"
return

+^f::
    FileRead, var, E:\Documents\test.txt
    if not ErrorLevel
    {
        MsgBox, %var%
    }
Return