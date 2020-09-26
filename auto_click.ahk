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
heightItem := 36
widthItem := 42
itemOffsetX := 45
itemOffsetY := 70
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

:*:test1::
  SELECT_ITEM(1, 1)
  return
:*:test2::
  SELECT_ITEM(4, 1)
  return
:*:test3::
  SELECT_ITEM(7, 1)
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

      DROP_ITEM(1,1)
      DROP_ITEM(1,2)
    }
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
      clickY := (height - itemOffsetY - (heightItem * 6))
      clickX := (width - itemOffsetX - (widthItem * 3))
      return
    }
    ITEM_DOWN() {
      global
      clickY := clickY + heightItem
      return
    }
    ITEM_RIGHT() {
      global
      clickX := clickX + widthItem
      return
    }




    
;------------------------------------------------------------------
;------------------------------------------------------------------
;     RS item click functions
;------------------------------------------------------------------
;------------------------------------------------------------------

    SELECT_ITEM(row, col) {
      global
      row := row - 1
      col := col - 1

      getRSFirstItem()
      Loop %row% {
        ITEM_DOWN()
      }
      Loop %col% {
        ITEM_RIGHT()
      }

      Send {Click, %clickX%, %clickY%}
      return
    }

    DROP_ITEM(row, col) {
      global
      Send {shift down}
        SELECT_ITEM(row, col)
      Send {shift up}
      return
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



