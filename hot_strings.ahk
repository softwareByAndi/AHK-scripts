#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



run, hot_strings_tooltip.exe

:*:sov::
 send, {{} {enter}
 send, "subject-phrase": "",{enter}
 send, "verb-phrase": "",{enter}
 send, "object-phrase": "",{enter}
 send, "prep-phrase": ""{enter}
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
 send, "prep": "", {enter}
 send, "secondary-prep-phrase": {{}{enter}
 
 send, "subject-phrase": "",{enter}
 send, "verb-phrase": "",{enter}
 send, "object-phrase": "",{enter}
 send, "prep-phrase": ""
return

$!q::
  process, close, hot_strings_tooltip.exe
  exitApp
return