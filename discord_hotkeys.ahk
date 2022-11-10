#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



run, discord_tooltip.exe


$Enter:: 
  send, +{enter} 
return

$Tab::
  send, {space}{space}{space}{space}{space}
return

$!q::
  process, close, discord_tooltip.exe
  exitApp
return