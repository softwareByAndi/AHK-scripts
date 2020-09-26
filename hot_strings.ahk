#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



run, hot_strings_tooltip.exe

:*:sov::
 send, {{} {enter}
 sleep, 200
 send, "subject-phrase": "",{enter}
 sleep, 50
 send, "verb-phrase": "",{enter}
 sleep, 50
 send, "object-phrase": "",{enter}
 sleep, 50
 send, "prep-phrase": ""{enter}
 sleep, 50
 send, {backspace}{}}{shift down}{down}{shift up}{delete}
return

:*:_prep::
 send, {{} {enter}
 send, "prep": "", {enter}
 send, "secondary-prep-phrase":{enter}
 send, {backspace}{}}{shift down}{down}{shift up}{delete}
return

:*:prep::
 send, {{} {enter}
 sleep, 200
 send, "prep": "", {enter}
 sleep, 50
 send, "secondary-prep-phrase": {{}{enter}
 sleep, 200
 
 send, "subject-phrase": "",{enter}
 sleep, 50
 send, "verb-phrase": "",{enter}
 sleep, 50
 send, "object-phrase": "",{enter}
 sleep, 50
 send, "prep-phrase": ""
return

$!q::
  process, close, hot_strings_tooltip.exe
  exitApp
return