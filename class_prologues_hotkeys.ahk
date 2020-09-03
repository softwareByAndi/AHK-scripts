#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



run, class_prologues_tooltip.exe

outputDate(){
  FormatTime, currentDateTime,, dd MMM yyyy
  sendinput %currentDateTime% {enter}
}


:*:CS3410::
	send, CS 3410 Human Factors in Software Development {enter}
  send, Andrew Ahlstrom {enter}
  outputDate()
return

:*:CS4400::
	send, CS 4400 Software Engineering II {enter}
  send, Andrew Ahlstrom {enter}
  outputDate()
return

:*:CS4450::
	send, CS 4450 Analysis of Programming Languages {enter}
  send, Andrew Ahlstrom {enter}
  outputDate()
return

:*:CS4230::
	send, CS 4230 Software Testing and Quality Engineering {enter}
  send, Andrew Ahlstrom {enter}
  outputDate()
return


$!q::
  process, close, class_prologues_tooltip.exe
  exitApp
return