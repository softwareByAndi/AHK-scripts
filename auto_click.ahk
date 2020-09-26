#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

mine_bool := 0

dropWait := 200
mineWait := 2500


reloadScript(){
	BlockInput Off
		MsgBox, reloading auto_click.ahk
		Reload, auto_click.ahk
}

$!r::
  reloadScript()
  return

getClickLocation(){
	MouseGetPos, OVX, OVY
	writeToNotepad("RSClick(" . OVX . ", " . OVY . ", 100){enter}")
}

writeToNotepad(text) {
	winactivate, Untitled - Notepad
	WinWaitActive, Untitled - Notepad
				send, %text%
}

RSClick(rsX, rsY, sleeperTime)
{
		; send click and input to RS
	Send {Click, %rsX%, %rsY%}
	sleep, %sleeperTime%
}

$+!^x::
  Loop
  {
      MouseGetPos, x, y
      ToolTip, %x% %y%
  }
  ToolTip
  return


click_UP(sleeperTime){
  RSClick(1000, 375, 0)  ; UP
  sleep, %sleeperTime%
}
click_DOWN(sleeperTime){
  RSClick(1000, 850, 0)  ; DOWN
  sleep, %sleeperTime%
}
click_LEFT(sleeperTime){
  RSClick(760, 600, 0)   ; LEFT
  sleep, %sleeperTime%
}
click_RIGHT(sleeperTime){
  RSClick(1250, 600, 0)   ; RIGHT
  sleep, %sleeperTime%
}


mine() {
  Loop
  {
    Loop, 4
    {
      click_UP(3800)
      click_RIGHT(3300)
      send, {shift down}
        RSClick(1765, 850, 200)
        RSClick(1808, 850, 200)
      send, {shift up}
    }
    
    ;send, {shift down}
    ;RSClick(1765, 850, 200) ;2:1
    ;RSClick(1808, 850, 200) ;2:2
    ;RSClick(1850, 850, 200) ;2:3
    ;RSClick(1890, 850, 200) ;2:4

    ;RSClick(1765, 888, 200) ;3:1
    ;RSClick(1808, 888, 200) ;3:2
    ;RSClick(1850, 888, 200) ;3:3
    ;RSClick(1890, 888, 200) ;3:4

    ;RSClick(1765, 925, 200) ;4:1
    ;RSClick(1808, 925, 200) ;4:2
    ;RSClick(1850, 925, 200) ;4:3
    ;RSClick(1890, 925, 200) ;4:4
    ;send, {shift up}
  }
}

:*:ahk mine::
  mine()
  return