#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force



BlockInput, SendAndMouse

global WIN_1 := 0
global saveCurrentID := 0
global saveMousePos_X := 0
global saveMousePos_Y := 0

global clickArray_X := []
global clickArray_Y := []
global clickArray_Color := []
global clickArray_Button := []
global clickArray_TimeLog := []
global clickArray_Window := []


global recording_bool := false
global prep_bool := false

global FileName := ""

reset_variables() {
  clickArray_X := []
  clickArray_Y := []
  clickArray_Color := []
  clickArray_Button := []
  clickArray_TimeLog := []
  clickArray_Window := []
}

reloadScript(){
  alert("reloading record_action.ahk")
  Reload, record_action.ahk
}

alert(text){
  BlockInput, off
  MsgBox, % text
}
getInput(title, prompt) {
  BlockInput, off
  InputBox, ret, %title%, %prompt%
  return ret
}
writenl(text) {
  write(text . "`n")
}
write(text) {
  send, % text
  sleep, 250
}
initWindow(verbose) {
	WinGet, WIN_1, ID, A
  if (verbose)ff
    alert("win: " . WIN_1)
}
exitActiveWindow(){
	WinGetTitle, Title, A
	PostMessage, 0x112, 0xF060,,, %Title%
}

$!w::
  KeyWait, Alt
  initWindow(true)
  return
$^p::
  Pause
  return
$^o::
  Suspend
  return
$!q::
  KeyWait, Alt
  ExitApp
  return
$+^q::
  exitActiveWindow()
  return
$!r::
  KeyWait, Alt
  Send {shift up}
  reloadScript()
  return

$LButton::
  send, {Click}
  recordClick("Left", -1)
  return
$^LButton::
  ; KeyWait, Control
  MouseGetPos, x, y
  PixelGetColor, c, x, y, RGB
  send, {Click}
  recordClick("Left", c)
  return
$RButton::
  send, {Click, right}
  recordClick("Right", -1)
  return
$^RButton::
  MouseGetPos, x, y
  PixelGetColor, c, x, y, RGB
  ; KeyWait, Control
  send, {Click, right}
  recordClick("Right", c)
  return

:*:record::
  sleep, 50
  record_sequence()
  prep_bool := false
  alert("recording")
  return
:*:stop::
  sleep, 50
  end_recording()
  prep_arrays()
  prep_bool := true
  alert("ending recording. # of actions recorded: " . clickArray_X.Length())
  return
:*:replay::
  sleep, 50
  replay()
  return
:*:load::
  sleep, 50
  if (load_recording())
    replay()
  return
:*:save::
  sleep, 50
  end_recording()
  if (!prep_bool){
    prep_arrays()
    prep_bool := true
  }
  open_file_and_write_recording()
  return

replay() {
  numLoops := getInput("playing recording", "how many loops?")
  if ErrorLevel {
    return
  }
  play_sequence(numLoops)
}




recordClick(clickButton="Left", pixelColor=-1){
  if (recording_bool) {
    MouseGetPos, x, y
    
    WinGet, w, ID, A
    if (w = WIN_1) {
      w := -1
    }
    clickArray_Window.Push(w)
    clickArray_X.Push(x)
    clickArray_Y.Push(y)
    clickArray_TimeLog.Push(A_TickCount)
    clickArray_Color.Push(pixelColor)

    if (clickButton="Right"){
      clickArray_Button.Push("RIGHT")
    } else {
      clickArray_Button.Push("LEFT")
    }
  }
} 



activateWindow(window) {
  if (window = -1) {
    window := WIN_1
  }
  if (window = 0) {
    return false
  }

  if WinActive("ahk_id" . window)
    return true

  if WinExist("ahk_id" . window) {
    WinActivate, ahk_id %window%
    WinWaitActive, ahk_id %window%,,5
    if ErrorLevel {
      alert("failed to activate window: " . window)
      return false
    }
    return true
  }
  alert("window: " . window . " was not found")
  Pause
  return false
}


SingleClick(cX, cY, clickButton, window, sleeperTime)
{  
  sleep, 25 ; for some reason, a small buffer tends to smooth out bugs
  if (clickButton = "RIGHT"){
    BlockInput, on
    activateWindow(window)
    Send, {Click, right, %cX%, %cY%}
  } else {
    activateWindow(window)
    Send, {Click, %cX%, %cY%}
  }
  sleep, %sleeperTime%
}

beginMultiClickAction(){
  global
  BlockInput, on
  saveCurrentPosition()
}
endMultiClickAction(){
  global
  returnToLastSavedPosition()
  BlockInput, off
}

saveCurrentPosition()
{
  global
	MouseGetPos, saveMousePos_X, saveMousePos_Y, saveCurrentID
}
returnToLastSavedPosition()
{
  global
	winactivate, ahk_id %saveCurrentID%
  WinWaitActive, ahk_id %saveCurrentID%,,2
	MouseMove, %saveMousePos_X%, %saveMousePos_Y%
  saveCurrentID := 0
  BlockInput, off
}

record_sequence() {
  global
  ; reset variables
  reset_variables()

  recording_bool := true
}


end_recording() {
  global
  recording_bool := false
}

open_file_and_write_recording() {
  global
  BlockInput, off
  FileSelectFile, FileName, S16,, "select file to save to", Text Documents(*.txt)
  if (FileName = "") {
    alert("FileName is empty")
    return false
  }

  file := FileOpen(FileName, "w")
  if (!IsObject(file)) {
    alert("cannot open " . FileName . " for writing")
    return false
  }

  txt := save_recording_array()
  if (txt = "") {
    return false
  }

  file.Write(txt)
  file.Close()  

  Run, open %FileName%
}

save_recording_array() {
  if (clickArray_X.Length() = 0){
    alert("there is nothing to save")
    return ""
  }
  temparray := []
  for index, element in clickArray_X {
    temparray.push("[")

    temparray.push(clickArray_X[index] . ", ")
    temparray.push(clickArray_Y[index] . ", ")
    temparray.push(clickArray_Button[index] . ", ")
    temparray.push(clickArray_Color[index] . ", ")
    temparray.push(clickArray_TimeLog[index] . ", ")
    temparray.push(clickArray_Window[index])

    temparray.push("]")

    if (index != clickArray_X.MaxIndex())
      temparray.push("`n")
  }

  BlockInput, off
  
  output := ""
  for index, element in temparray{
    output := output . element
  }

  alert(output)
  return output
}

prep_arrays() {
  ; calculate time differences
  for index, element in clickArray_TimeLog {
    if ((index + 1) <= clickArray_TimeLog.Length()) {
      temp := ((clickArray_TimeLog[index + 1] - element) - 200) ; actions take about 200 ms to execute
      if (temp < 0){
        temp := 0
      }
      clickArray_TimeLog[index] := temp
    }
  }

  ; delete last index
  ; !!  the last click should be the SAME as the first click (complete the loop).
  ;     since we don't want to repeat the same click twice, we remove the last element of each array
  clickArray_X.pop()
  clickArray_Y.pop()
  clickArray_Color.pop()
  clickArray_Button.pop()
  clickArray_TimeLog.pop()
  clickArray_Window.pop()
}





;*************************************************************************
; PLAY SEQUENCE
;*************************************************************************

play_sequence(numLoops) {
  global
  
  if (WIN_1 = 0) {
    initWindow(false)
  }


  currentLoop := 0
  Loop %numLoops% {
    currentLoop := currentLoop + 1
    ToolTip, %FileName% -- %currentLoop% : %numLoops%, 500, 0

    for index, element in clickArray_X {
      cX := clickArray_X[index]
      cY := clickArray_Y[index]
      b := clickArray_Button[index]
      c := clickArray_Color[index]
      t := clickArray_TimeLog[index]
      w := clickArray_Window[index]

      if (saveCurrentID = 0) {
        saveCurrentPosition()
        BlockInput, on
        activateWindow(w)
      }
      
      pixelColor := -1
      ; confirm color match
      if (c != -1) {
        loop, 20 {

          ; MouseMove, %cX%, %cY%, 0
          ; sleep, 100
          BlockInput, on
          activateWindow(w)
          send, {Ctrl}
          PixelGetColor, pixelColor, %cX%, %cY%, RGB
          if (pixelColor = c) { ; no color match wait for delay
            break
          }
          ; returnToLastSavedPosition()
          BlockInput, off
          sleep, 500
        }
        if (pixelColor != c){ ; color match failed. aborting script
          alert("pixelColor: " . pixelColor . " does not match savedColor: " . c)
          return
        }
      }

      SingleClick(cX, cY, b, w, 0)
      
      if (b != "RIGHT") {
        if (t > 1000) {
          returnToLastSavedPosition()
        } else if (saveCurrentID = 0) {
          BlockInput, off
        }
      }

      if (!((currentLoop = numLoops) && (index = clickArray_X.MaxIndex()))) {
        sleep, %t%
      }
    }
  }
  if (saveCurrentID != 0){
    returnToLastSavedPosition()
  }
  BlockInput, off
  ToolTip

  alert("COMPLETED!! " . numLoops . " of " . FileName)
} 

load_recording() {
  global
  BlockInput, off
  reset_variables()
  
  FileSelectFile, FileName, 3,, "open recording", Text Documents (*.txt)
  if (FileName = ""){
    ; alert("FileName is empty. cannot load")
    return false
  }
  stdin := FileOpen(FileName, "r")
  if (!IsObject(stdin)){
    alert("cannot load " . FileName)
    return false
  }
  file := ""
  while (!stdin.AtEOF()) {
    temp := stdin.ReadLine()
    file := file . temp
  }

  Loop
  {
    file := StrReplace(file, "`r`n", "", Count)
    if (Count = 0)
      break
  }
  Loop
  {
    file := StrReplace(file, "`n", "", Count)
    if (Count = 0)
      break
  }
  file := RegExReplace(file, "\s*\([\w\s]*\)\s*", "")
  file := StrReplace(file, A_Space)
  instructions := StrSplit(file, "][")
  for index, element in instructions {
    instructions[index] := StrReplace(instructions[index], "[")
    instructions[index] := StrReplace(instructions[index], "]")
  }

  for index, element in instructions {
    temp := StrSplit(element, ",")
    if (temp.Length() != 6){
      alert("error, the file has " . temp.Length() . " items in instruction '" . index . "', not the required 6")
      return false
    }

    clickArray_X.push(temp[1])
    clickArray_Y.push(temp[2])
    clickArray_Button.push(temp[3])
    clickArray_Color.push(temp[4])
    clickArray_TimeLog.push(temp[5])
    clickArray_Window.push(temp[6])

  }

  return true
}

:*:test::
  load_recording()
  open_file_and_write_recording()
return




























; ********************************************************************************
; old code
; ********************************************************************************











; save_recording() {
;   SetTitleMatchMode, 2
;   WinActivate, Code
;   WinWaitActive, Code,,5
;   if ErrorLevel {
;     alert("failed to activate vsCode")
;   } else {
;     BlockInput, off
;     MsgBox, 1,, "recorded data will be sent to active window. Are you ready to begin?"
;     IfMsgBox Cancel
;       return

;     ; begin writenl
;     BlockInput, on
;     for index, element in clickArray_X {
;       cX := clickArray_X[index]
;       cY := clickArray_Y[index]
;       b := clickArray_Button[index]
;       c := clickArray_Color[index]
;       t := clickArray_TimeLog[index]
      
      

;       if (saveCurrentID = 0){
;         saveCurrentID := 1
;         writenl("saveCurrentPosition()")
;           sleep, 50
;         writenl("BlockInput, on")
;       }
      
;       if (c != -1){
;         writenl("{tab}activateWindow()")
;         writenl("MouseMove, " . cX . ", " . cY . "0")
;         writenl("sleep, 100")
;         writenl("PixelGetColor, pixelColor, " . cX . ", " . cY . ", RGB")
;         writenl("if (pixelColor {!}{=} " . c . ") {{}")
;           send, {shift down}{down}{shift up}{BackSpace}
;           sleep, 250
;         writenl("sleep, 1000")

;         writenl("activateWindow()")
;         writenl("MouseMove, " . cX . ", " . cY . "0")
;         writenl("PixelGetColor, pixelColor, %cX%, %cY%, RGB")
;         writenl("if (pixelColor {!}{=} " . c . ") {{}")
;           send, {shift down}{down}{shift up}{BackSpace}
;           sleep, 250
;         writenl("sleep, 2500")

;         writenl("activateWindow()")
;         writenl("MouseMove, " . cX . ", " . cY . "0")
;         writenl("PixelGetColor, pixelColor, %cX%, %cY%, RGB")
;         writenl("if (pixelColor {!}{=} " . c . ") {{}")
;           send, {shift down}{down}{shift up}{BackSpace}
;           sleep, 250
;         writenl("alert(""pixelColor: "" . pixelColor . "" does not match savedColor: " . c . """)")
;         writenl("return")
;           send, {BackSpace}
;         writenl("{}}")
;           send, {BackSpace}
;         writenl("{}}")
;           send, {BackSpace}
;         writenl("{}}")
;           send, {BackSpace}

;       }


;       if (t > 1000) {
;         writenl("SingleClick(" . cX . ", " . cY . ", " . b . ", 0)")
;         writenl("returnToLastSavedPosition()")
;         writenl("sleep, " . t)
;         writenl("")
;         saveCurrentID := 0
;       } else if (saveCurrentID = 0) {
;         writenl("SingleClick(" . cX . ", " . cY . ", " . b . ", 0)")
;         writenl("BlockInput, off")
;         writenl("sleep, " . t)
;         writenl("")
;       } else if (index < clickArray_X.Length()) {
;         writenl("SingleClick(" . cX . ", " . cY . ", " . b . ", " . t . ")")
;       } else {
;         writenl("SingleClick(" . cX . ", " . cY . ", " . b . ", 0)")
;       }
;     }
;     writenl("")
;     if (saveCurrentID != 0){
;       writenl("returnToLastSavedPosition()")
;     }
;     writenl("BlockInput, off")
;   }

;   BlockInput, off
; }