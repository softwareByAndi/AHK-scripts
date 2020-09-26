#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



mine_bool := 0
dropWait := 200
mineWait := 2500
heightSquare := 180
widthSquare := 200
heightItem := 35
widthItem := 42
clickX := 0
clickY := 0




reloadScript(){
	BlockInput Off
		MsgBox, reloading auto_click.ahk
		Reload, auto_click.ahk
}

$!r::
  reloadScript()
  return

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




;------------------------------------------------------------------
;------------------------------------------------------------------
;     MAIN HOTKEYS
;------------------------------------------------------------------
;------------------------------------------------------------------

:*:ahk mine::
  mine()
  return

:*:test::
  WinGetPos, posX, posY, width, height, A
  send, x: %width%  y: %height%
  return


;------------------------------------------------------------------
;------------------------------------------------------------------
;     MAIN FUNCTIONS
;------------------------------------------------------------------
;------------------------------------------------------------------

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





;------------------------------------------------------------------
;------------------------------------------------------------------
;     mouse position adjustment functions
;------------------------------------------------------------------
;------------------------------------------------------------------
    getRSCenter() {
      global
      WinGetPos, posX, posY, width, height, A
      clickX := width / 2
      clickY := (height / 2) + (heightSquare / 2)
      return
    }
    UP(){
      global
      clickY := (clickY - heightSquare)
    }
    DOWN() {
      global
      clickY := (clickY + heightSquare - 25)
    }
    LEFT() {
      global
      clickX := (clickX - widthSquare)
    }
    RIGHT() {
      global
      clickX := (clickX + widthSquare)
    }

    ROW1() {
      global
      clickX := 
    }


    getRSFirstItem() {
      global
      WinGetPos, posX, posY, width, height, A
      clickY := (height - 68 - (heightItem * 6))
      clickX := (width - 45 - (widthItem * 3))
      return
    }
    ITEM_DOWN() {
      global
      clickY := clickY + heightItem
    }
    ITEM_RIGHT() {
      global
      clickX := clickX + widthItem
    }




;------------------------------------------------------------------
;------------------------------------------------------------------
;     RS map click functions
;------------------------------------------------------------------
;------------------------------------------------------------------

  ;------------------------------------------------------------------
  ;     1 square
  ;------------------------------------------------------------------

    click_UP(sleeperTime) {
      global
      getRSCenter()
      UP()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_DOWN(sleeperTime){
      global
      getRSCenter()
      DOWN()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_LEFT(sleeperTime){
      global
      getRSCenter()
      LEFT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_RIGHT(sleeperTime){
      global
      getRSCenter()
      RIGHT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }


    click_UP_RIGHT(sleeperTime){
      global
      getRSCenter()
      UP()
      RIGHT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_UP_LEFT(sleeperTime){
      global
      getRSCenter()
      UP()
      LEFT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_DOWN_RIGHT(sleeperTime){
      global
      getRSCenter()
      DOWN()
      RIGHT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_DOWN_LEFT(sleeperTime){
      global
      getRSCenter()
      DOWN()
      LEFT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }

  ;------------------------------------------------------------------
  ;   2 square
  ;------------------------------------------------------------------

    click_UP_UP(sleeperTime){
      global
      getRSCenter()
      UP()
      UP()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_LEFT_LEFT(sleeperTime){
      global
      getRSCenter()
      LEFT()
      LEFT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_RIGHT_RIGHT(sleeperTime){
      global
      getRSCenter()
      RIGHT()
      RIGHT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }

    click_UP_RIGHT_RIGHT(sleeperTime){
      global
      getRSCenter()
      UP()
      RIGHT()
      RIGHT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_UP_LEFT_LEFT(sleeperTime){
      global
      getRSCenter()
      UP()
      LEFT()
      LEFT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }

    click_UP_UP_RIGHT_RIGHT(sleeperTime){
      global
      getRSCenter()
      UP()
      UP()
      RIGHT()
      RIGHT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_UP_UP_LEFT_LEFT(sleeperTime){
      global
      getRSCenter()
      UP()
      UP()
      LEFT()
      LEFT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }

    click_UP_UP_RIGHT(sleeperTime){
      global
      getRSCenter()
      UP()
      UP()
      RIGHT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }
    click_UP_UP_LEFT(sleeperTime){
      global
      getRSCenter()
      UP()
      UP()
      LEFT()
      Send {Click, %clickX%, %clickY%}
      sleep, %sleeperTime%
      return
    }




    
;------------------------------------------------------------------
;------------------------------------------------------------------
;     RS item click functions
;------------------------------------------------------------------
;------------------------------------------------------------------

    ITEM_1_1(){
      getRSFirstItem()
    }
    ITEM_1_2(){
      getRSFirstItem()
    }
    ITEM_1_3(){
      getRSFirstItem()
    }
    ITEM_1_4(){
      getRSFirstItem()
    }

    
    ITEM_1_1(){
      getRSFirstItem()
    }
    ITEM_1_2(){
      getRSFirstItem()
    }
    ITEM_1_3(){
      getRSFirstItem()
    }
    ITEM_1_4(){
      getRSFirstItem()
    }
    
    ITEM_1_1(){
      getRSFirstItem()
    }
    ITEM_1_2(){
      getRSFirstItem()
    }
    ITEM_1_3(){
      getRSFirstItem()
    }
    ITEM_1_4(){
      getRSFirstItem()
    }
    
    ITEM_1_1(){
      getRSFirstItem()
    }
    ITEM_1_2(){
      getRSFirstItem()
    }
    ITEM_1_3(){
      getRSFirstItem()
    }
    ITEM_1_4(){
      getRSFirstItem()
    }
