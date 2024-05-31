#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force





$`::
    Send {Alt Down}{Tab}{Alt Up}
    sleep, 300
    send {Down}
    send {Ctrl Down}c{Ctrl Up}
    sleep, 100
    Send {Alt Down}{Tab}{Alt Up}
    sleep, 300
    send {Ctrl Down}v{Ctrl Up}
return