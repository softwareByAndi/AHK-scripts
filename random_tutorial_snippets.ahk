#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



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
