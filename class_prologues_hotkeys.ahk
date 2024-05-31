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

:*:comm::
    send, COMM 2110 – X01 : Interpersonal Communication {enter}
    send, Andrew Ahlstrom {enter}
    outputDate()
return

:*:ethics::
:*:cs305::
    send, CS 305G – 001 : Global, Social & Ethical Issues in Computer Science {enter}
    send, Andrew Ahlstrom {enter}
    outputDate()
return

:*:senior review::
:*:cs496::
    send, CS 496R – 001 : Senior Review {enter}
    send, Andrew Ahlstrom {enter}
    outputDate()
return

:*:networks::
:*:cs2960::
    send, CS 2960 – 601 : Computer Networks II {enter}
    send, Andrew Ahlstrom {enter}
    outputDate()
return

:*:architecture::
:*:cs4380::
    send, CS 4380 – 001 : Advanced High Performance Computer Architecture {enter}
    send, Andrew Ahlstrom {enter}
    outputDate()
return

:*:software engineering::
:*:cs4550::
    send, CS 4550 – 001 : Software Engineering III {enter}
    send, Andrew Ahlstrom {enter}
    outputDate()
return

$!q::
    process, close, class_prologues_tooltip.exe
    exitApp
return