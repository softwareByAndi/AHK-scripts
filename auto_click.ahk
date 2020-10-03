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


initializeGlobals_Desktop()


reloadScript(){
	BlockInput Off
		MsgBox, reloading auto_click.ahk
		Reload, auto_click.ahk
}

$!o::
  Pause
  return
$^o::
  Suspend
  return

$!r::
  Send {shift up}
  reloadScript()
  return

SingleClick(rsX, rsY, sleeperTime)
{
	Send {Click, %rsX%, %rsY%}
	sleep, %sleeperTime%
}

RightClick(rsX, rsY, sleeperTime)
{
	Send {Click, right, %rsX%, %rsY%}
	sleep, %sleeperTime%
}

DoubleClick(rsX, rsY, sleeperTime) {
	Send {Click, %rsX%, %rsY%}
  sleep, 250
	Send {Click, %rsX%, %rsY%}
	sleep, %sleeperTime%
}

$+!^x::

  MouseGetPos, x, y
  send, {alt down} {tab} {alt up}
  sleep, 1000


  send, % "SingleClick(" x ", " y ", 1000)"
  send, {enter}
  sleep, 1000

  ;send, {alt down} {tab} {alt up}
  return

initializeGlobals_Desktop(){
  global
  WinGetPos, posX, posY, width, height, A

  heightSquare := height / 4.5
  widthSquare := width / 8
  return
}

; $^LButton::
;   MouseGetPos, x, y
;   send, {ctrl up}{alt down} {tab} {alt up}
;   sleep, 500

;   send, % "SingleClick(" x ", " y ", 500)"
;   sleep, 250
;   ; MsgBox, "click recorded"
;   ; sleep, 250
;   send, {enter}
;   sleep, 250

;   send, {alt down} {tab} {alt up}
;   sleep, 250
;   send, {Click}
;   return
  
; $^RButton::
;   MouseGetPos, x, y
;   send, {ctrl up}{alt down}{tab}{alt up}
;   sleep, 500

;   send, % "RightClick(" x ", " y ", 500)"
;   sleep, 250
;   ; MsgBox, "click recorded"
;   ; sleep, 250
;   send, {enter}
;   sleep, 250

;   send, {alt down}{tab}{alt up}
;   sleep, 250
;   send, {Click, right}
;   return



;---------------------------------------------




;---------------------------------------------

;------------------------------------------------------------------
;------------------------------------------------------------------
;     MAIN HOTKEYS
;------------------------------------------------------------------
;------------------------------------------------------------------

:*:ahk mine iron::
  mine_iron()
  return

:*:ahk mine coal::
  mine_coal()
  return

:*:ahk high alch::
  InputBox, numItems, "High Alchemy", "how many items?"
  sleep, 500

  numInventory := 26
  numLoops := numItems / numInventory
  numLoops := Floor(numLoops)
  remainder := Mod(numItems, numInventory)
  
  SELECT_FIRST_ITEM_FROM_BANK()

  Loop %numLoops% {
      ; high alchemy loop
    high_alch(numInventory)
    SELECT_FIRST_ITEM_FROM_BANK()
  }
  
    ; last loop
  high_alch(remainder)  
  return

:*:ahk smith::
  InputBox, numItems, "smith iron", "how many items?"
  sleep, 500

  numInventory := 27
  numLoops := numItems / numInventory
  numLoops := Floor(numLoops)
  remainder := Mod(numItems, numInventory)

  SMITH_MEDHELM()

  Loop %numLoops% {
      ; auto smithing loop
    GET_INGOTS_FROM_BANK()
    SMITH_MEDHELM()
  }
  return

:*:ahk mining guild coal::
  Loop {
    mining_guild_coal()
  }
  return

:*:ahk mining guild iron::
  Loop {
    mining_guild_iron()
  }
  return

:*:ahk fill potions::
  InputBox, numItems, "smith iron", "how many items?"
  sleep, 500

  numInventory := 28
  numLoops := numItems / numInventory
  numLoops := Floor(numLoops)

  Loop %numLoops% {
    ; bank
    DoubleClick(1022, 513, 2000)
    SingleClick(1045, 833, 1000)
    SingleClick(735, 227, 1000)
    SingleClick(1087, 78, 500)

    ; combine potions
    RightClick(1805, 783, 250)
    SingleClick(1738, 824, 250)
    SingleClick(1762, 782, 500)
    RightClick(1845, 783, 250)
    SingleClick(1780, 826, 250)
    SingleClick(1760, 781, 500)
    RightClick(1889, 783, 250)
    SingleClick(1782, 823, 250)
    SingleClick(1762, 780, 500)

    RightClick(1803, 820, 250)
    SingleClick(1741, 861, 250)
    SingleClick(1764, 818, 500)
    RightClick(1846, 819, 250)
    SingleClick(1777, 859, 250)
    SingleClick(1762, 819, 500)
    RightClick(1886, 819, 250)
    SingleClick(1771, 860, 250)
    SingleClick(1759, 819, 500)

    RightClick(1804, 856, 250)
    SingleClick(1743, 901, 250)
    SingleClick(1762, 858, 500)
    RightClick(1847, 854, 250)
    SingleClick(1787, 899, 250)
    SingleClick(1763, 854, 500)
    RightClick(1888, 854, 250)
    SingleClick(1771, 898, 250)
    SingleClick(1763, 857, 500)

    RightClick(1805, 889, 250)
    SingleClick(1744, 930, 250)
    SingleClick(1764, 890, 500)
    RightClick(1848, 891, 250)
    SingleClick(1771, 934, 250)
    SingleClick(1764, 890, 500)
    RightClick(1886, 893, 250)
    SingleClick(1778, 934, 250)
    SingleClick(1763, 892, 500)

    RightClick(1806, 925, 250)
    SingleClick(1744, 968, 250)
    SingleClick(1762, 926, 500)
    RightClick(1847, 923, 250)
    SingleClick(1779, 965, 250)
    SingleClick(1762, 925, 500)
    RightClick(1888, 925, 250)
    SingleClick(1779, 966, 250)
    SingleClick(1763, 928, 500)

    RightClick(1805, 961, 250)
    SingleClick(1751, 989, 250)
    SingleClick(1765, 962, 500)
    RightClick(1847, 962, 250)
    SingleClick(1794, 990, 250)
    SingleClick(1762, 962, 500)
    RightClick(1888, 964, 250)
    SingleClick(1788, 990, 250)
    SingleClick(1759, 961, 500)

    RightClick(1804, 1000, 250)
    SingleClick(1753, 986, 250)
    SingleClick(1765, 999, 500)
    RightClick(1849, 1000, 250)
    SingleClick(1783, 989, 250)
    SingleClick(1762, 995, 500)
    RightClick(1886, 1000, 250)
    SingleClick(1770, 987, 250)
    SingleClick(1761, 999, 500)
  }
  return

:*:test::
  WinGetTitle, mytitle, A_ScriptDir
  MsgBox, "the active window is " %mytitle%
  return

:*:align_1::
  MouseMove, 386, 716
  return
:*:align_2::
  MouseMove, 965, 792
  return
:*:align_3::
  MouseMove, 1397, 350
  return


;------------------------------------------------------------------
;------------------------------------------------------------------
;     MAIN FUNCTIONS
;------------------------------------------------------------------
;------------------------------------------------------------------

mine_iron() {
  Loop
  {
    click_UP(3800)
    click_RIGHT(3800)
    DROP_ITEM(1, 1, 200)
    DROP_ITEM(1, 2, 200)
  }
}
mine_coal() {
  Loop 20
  {
    click_DOWN_RIGHT(14000)
    click_UP_LEFT_LEFT(14000)
    click_DOWN_LEFT(14000)
  }
}

high_alch(numLoop) {
  global
  ha_iter := -1
  Loop %numLoop% {
    ha_iter := ha_iter + 1
    ha_item_row := Floor(ha_iter / 4) + 1
    ha_item_col := Mod(ha_iter, 4) + 1
    SELECT_HIGH_ALCH(ha_item_row, ha_item_col)
  }
}

varrock_smith_medhelms() {
  global
  
  loop {
    GET_INGOTS_FROM_BANK()
    SMITH_MEDHELM()
  }
}


mining_guild_coal() {
    ; climb down mining shaft
  SingleClick(386, 716, 30000)

      ; mine enter
    SingleClick(965, 1024, 10000)
    SingleClick(1008, 684, 12000)
    DoubleClick(873, 647, 12000) ; 7
    DoubleClick(931, 644, 12000) ; 8
    DoubleClick(1062, 573, 12000) ; 9
    DoubleClick(974, 614, 12000) ; 10

      ; work the square
    loop 6 {
      DoubleClick(935, 473, 10000) ; top
      DoubleClick(928, 568, 10000) ; left
      DoubleClick(1029, 551, 10000) ; right
      DoubleClick(971, 612, 10000) ; bottom
    }

      ; return route
    DoubleClick(1025, 420, 12000)
    DoubleClick(971, 384, 12000)
  
    ; exit mine
  DoubleClick(885, 250, 10000)
    ; go to bank
  SingleClick(1397, 350, 30000)
    ; empty inventory
  SingleClick(1040, 837, 1000)
    ; exit bank
  SingleClick(1086, 81, 1000)
}


mining_guild_iron() {
    ; climb down mining shaft
  SingleClick(1660, 944, 16500)
  SingleClick(582, 754, 14000)

      ; mine enter
    SingleClick(1374, 585, 10000)

    loop 7{
      DoubleClick(971, 582, 2000)
      DoubleClick(937, 580, 3000)
      DoubleClick(964, 520, 2000)
      DoubleClick(1025, 549, 3000)
    }

    ; exit mine
  SingleClick(513, 495, 10000)
    ; go to bank
  SingleClick(788, 178, 29000)
    ; empty inventory
  SingleClick(1040, 837, 1000)
    ; exit bank
  SingleClick(1086, 81, 1000)
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

    GET_INGOTS_FROM_BANK(){
        ;open bank
      Send, {Click, 764, 249}
      sleep, 5000

      SELECT_ITEM(1, 2, 1000)

        ;select tab
      Send, {Click, 836, 89}
      sleep, 1000
        ;select ingot
      Send, {Click, 530, 130}
      sleep, 1000
        ;exit bank
      Send, {Click, 925, 51}
      sleep, 1000
    }

    SMITH_MEDHELM() {
        ; anvil
      Send, {Click, 916, 766}
      sleep, 5000
        ; select med helm
      Send, {Click, 478, 323}
      sleep, 85000
    }

    SELECT_FIRST_ITEM_FROM_BANK() {
        ; open bank
      Send, {Click, 742, 420}
      sleep, 2000

      Loop 2 {
          ; select item
        Send, {Click, 527, 125}
        sleep, 1000
      }

        ; exit bank
      Send, {Click, 926, 52}
      sleep, 1000
    }

    SELECT_HIGH_ALCH(i_row, i_col) {
      global

        ; set high alch icon position
      ha_row := 3
      ha_col := 3

      getRSFirstItem()
      Loop %ha_row% {
        ITEM_DOWN()
      }
      Loop %ha_col% {
        ITEM_RIGHT()
      }

      clickX := clickX + 15
      clickY := clickY - 15


        ; click backpack icon
      Send, {Click, 1296, 859}
      sleep, 500

        ; click magic book icon
      Send, {Click, 1393, 856}
      sleep, 500

        ; click high_alch icon
      Send, {Click, 1587, 696}
      sleep, 300

      SELECT_ITEM(i_row, i_col, 1000)

        ; first confirmation
      ;Send, {Click, 326, 823}
      ;sleep, 1000

        ; second confirmation
      ;Send, {Click, 267, 779}
      sleep, 1000

      return
    }

    SELECT_ITEM(row, col, sleeperTime) {
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
      sleep, %sleeperTime%
      return
    }

    DROP_ITEM(row, col, sleeperTime) {
      global
      Send {shift down}
        SELECT_ITEM(row, col, 0)
      Send {shift up}
      sleep, %sleeperTime%
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



