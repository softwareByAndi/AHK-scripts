#SingleInstance force

FGP_Init()

CoordMode, ToolTip, screen
CoordMode, Mouse, screen
CoordMode, Pixel, screen

global RS_WIN_1 := 0
initRSWindow()

global ERROR_LOG_FILE :=	"E:\Documents\2019\OSRS Icons\__ErrorLog.txt"

global globalClickID := 0
global saveCurrentID := 0
global saveMousePos_X := 0
global saveMousePos_Y := 0


global SCREEN_X1 := 0
global SCREEN_Y1 := 0
global SCREEN_X2 := 0
global SCREEN_Y2 := 0

global MINIMAP_X1 := 0
global MINIMAP_Y1 := 0
global MINIMAP_X2 := 0
global MINIMAP_Y2 := 0

;-----------  screen 2 start ---------------

global SCREEN_X3 := 0
global SCREEN_Y3 := 0
global SCREEN_X4 := 0
global SCREEN_Y4 := 0

global MINIMAP_X3 := 0
global MINIMAP_Y3 := 0
global MINIMAP_X4 := 0
global MINIMAP_Y4 := 0

;------------ screen 2 end ----------------

global MM_CENTER_X_OFFSET := 90
global MM_CENTER_Y_OFFSET := 115
global MM_RADIUS := 74
findRSWindow()

global BACKPACK_X := 0
global BACKPACK_Y := 0



	; still need to be initialized for some reason
	; global variables initialized in command +^e
global GREEN := 0x005F00
global YELLOW := 0xD88020
global TAN_LOW := 0x900000
global SELLING_1 := 0x3D372E
global SELLING_2 := 0x3C352D
global EMPTY_SLOT_HIGH := 0x495000
global EMPTY_SLOT_LOW := 0x460000

global COLOR_ZAMORAK_WINE := 0xBD4C43

global NUM_AVAILABLE_SLOTS := 3

global ESCAPE_SEQUENCE := false			; false = continue with sequence
global CURRENT_LOOP := 0				; parameter to track current pos in a loop
global TOTAL_LOOPS := 0
global TOGGLE_MONITOR_LOOPS := false
global TOGGLE_TELE_GRAB := false

global HIGH_ALCH_ITEM := ""
global HIGH_ALCH_NUM := 0
global HIGH_ALCH_PRICE := 0
global HIGH_ALCH_BUY_LIMIT := 0
global HIGH_VALUE := false
global BUY_COUNT := 0
global GLOBAL_TIME_OUT := 48

global PERSISTENCE_TOGGLE := false












;--------------------------------------------------------------------------------------------------------------------
;												High Alch Items
;--------------------------------------------------------------------------------------------------------------------

global TITLE_MITHRIL_PICKAXE :=		"mithril pickaxe" ; x40 max num
global TITLE_MITHRIL_KITESHIELD :=	"mithril kiteshield" ; x125 max num
global TITLE_MITHRIL_2H_SWORD :=	"mithril 2h sword" ; x125 max num
global TITLE_MITHRIL_PLATEBODY :=	"mithril platebody" ; x125 max num
	global VALUE_MITHRIL_PICKAXE :=		536
	global VALUE_MITHRIL_KITESHIELD :=	1082
	global VALUE_MITHRIL_2H_SWORD :=	1316
	global VALUE_MITHRIL_PLATEBODY :=	2876

global TITLE_ADAMANT_SQ_SHIELD :=	"adamant sq" ; x125 max num
global TITLE_ADAMANT_KITESHIELD :=	"adamant kite" ; x125 max num
global TITLE_ADAMANT_2H_SWORD :=	"adamant 2h" ; x125 max num
global TITLE_ADAMANT_PLATEBODY :=	"adamant platebody" ; x125 max num
	global VALUE_ADAMANT_SQ_SHIELD :=	2060
	global VALUE_ADAMANT_KITESHIELD :=	3020
	global VALUE_ADAMANT_2H_SWORD :=	3596
	global VALUE_ADAMANT_PLATEBODY :=	9740

global TITLE_RUNE_MED_HELM :=	"rune med" ; x70 max num
global TITLE_RUNE_SCIMITAR :=	"rune scimitar" ; x70 max num
global TITLE_RUNE_FULL_HELM :=	"rune full" ; x70 max num
global TITLE_RUNE_SQ_SHIELD :=	"rune sq" ; x70 max num
global TITLE_RUNE_CHAINBODY :=	"rune chainbody" ; x70 max num
global TITLE_RUNE_KITESHIELD :=	"rune kite" ; x70 max num
global TITLE_RUNE_PLATELEGS :=	"rune platelegs" ; x70 max num
global TITLE_RUNE_PLATESKIRT :=	"rune plateskirt" ; x70 max num
global TITLE_RUNE_2H_SWORD :=	"rune 2h" ; x70 max num
global TITLE_RUNE_PLATEBODY :=	"rune platebody" ; x70 max num
	global VALUE_RUNE_MED_HELM :=	11200;
	global VALUE_RUNE_SCIMITAR :=	15060
	global VALUE_RUNE_FULL_HELM :=	20800
	global VALUE_RUNE_SQ_SHIELD :=	22700
	global VALUE_RUNE_CHAINBODY :=	29700
	global VALUE_RUNE_KITESHIELD :=	32300
	global VALUE_RUNE_PLATELEGS :=	38050
	global VALUE_RUNE_PLATESKIRT :=	38050
	global VALUE_RUNE_2H_SWORD :=	38100
	global VALUE_RUNE_PLATEBODY :=	38650

global TITLE_GREEN_DHIDE_BODY :=	"green d'hide body" ; x125 max num
	global VALUE_GREEN_DHIDE_BODY :=	4400
global TITLE_STEEL_PLATEBODY :=	"steel platebody" ; x125 max num
	global VALUE_STEEL_PLATEBODY :=	952
global TITLE_IRON_PLATEBODY :=	"iron platebody" ; x125 max num
	global VALUE_IRON_PLATEBODY :=	105


;--------------------------------------------------------------------------------------------------------------------
;												ICONS
;--------------------------------------------------------------------------------------------------------------------


global Click_X := 0
global Click_Y := 0

;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ LOGIN
;--------------------------------------------------------------------------------------------------------------------

global LOGIN_EXISTING_USER := 					"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0002s_0000_Login-Existing-User.png"
global LOGIN_CLICK_TO_SWITCH_WORLDS :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0002s_0002_Login-Click-to-switch-World.png"
global LOGIN_VERIFY_PASSWORD_IS_ENTERED :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0002s_0003_Login-Password-Entered.png"
global LOGIN_BUTTON :=							"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0002s_0004_Login-Button.png"
global LOGIN_CLICK_HERE_TO_PLAY :=				"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0002s_0006_Login-Click-Here-To-Play.png"
global LOGIN_MUSIC_ICON :=						"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0002s_0001_Login-Music-On.png"
global LOGIN_LOGO :=							"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0002s_0005_Login-Logo.png"
global LOGIN_SELECT_WORLD :=					"E:\Documents\2019\OSRS Icons\_World 379.png"


global COMPASS :=								"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0000_Compass.png"
global ZOOM_ICON :=								"E:\Documents\2019\OSRS Icons\_Zoom Icon.png"

;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ GE
;--------------------------------------------------------------------------------------------------------------------

global GE_TITLE_ICON := 			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0003_GE-Title.png"
global GE_EMPTY_SLOT := 			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0000_Empty-GE-Box.png"
global GE_BLANK_SLOT :=				"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0018_GE-BLANK-Box.png"
global GE_GREEN_SLOT :=				"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0016_GE-COMPLETED-Box.png"
global GE_NOT_SOLD_SLOT :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0017_GE-INCOMPLETE-Box.png"
global GE_SELL_ICON :=				"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0001_GE-Empty-Sell-Tab.png"
global GE_BUY_ICON :=				"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0002_GE-Empty-Buy-Tab.png"
global GE_EXIT_BUTTON :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0006_GE-Close-Button.png"
global GE_ABORT_OFFER_BUTTON :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0008_GE-Abort-Offer-Icon.png"
global GE_COLLECT_BUTTON :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0007_GE-Collect-Icon.png"
global GE_EMPTY_RETURN_BOX :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0009_GE-Empty-Return-Icon.png"
global GE_OFFER_RETURN_BUTTON :=	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0015_GE-Offer-Return-Button.png"
global GE_CONFIRM :=				"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0014_GE-Confirm-Offer-Button.png"
global GE_PRICE_SET_PAGE :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0010_GE-Price-to-pay.png"
global GE_PRICE_SET_BUTTON :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0013_GE-Set-Price-Button.png"
global GE_NUM_SET_PAGE :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0011_GE-How-many-to-buy.png"
global GE_NUM_SET_BUTTON :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0000s_0012_GE-Set-Quantity-Button.png"
global GE_WHAT_SET_PAGE :=			"E:\Documents\2019\OSRS Icons\_GE_what_to_buy_prompt.png"

;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ TABS
;--------------------------------------------------------------------------------------------------------------------

global TAB_COMBAT :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0001s_0006_Combat-Tab-Icon.png"
global TAB_BACKPACK :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0001s_0007_Backpack-Tab-Icon.png"
global TAB_EQUIPMENT :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0001s_0008_Equipment-Tab-Icon.png"
global TAB_PRAYER :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0001s_0009_Prayer-Tab-Icon.png"
global TAB_MAGIC :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0001s_0010_Magic-Tab-Icon.png"
global TAB_SETTINGS :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0001s_0011_Settings-Tab-Icon.png"


;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ BACKPACK
;--------------------------------------------------------------------------------------------------------------------
global FRAME_BACKPACK := 	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0003s_0000_Backpack.png"

global ITEM_NATURE_RUNE :=	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0003s_0001_Backpack-Nature-Rune.png"

;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ MAGIC
;--------------------------------------------------------------------------------------------------------------------

global SPELL_HIGH_ALCH := 	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0006s_0013_spell-high-alchemy.png"


;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ PROMPTS
;--------------------------------------------------------------------------------------------------------------------

global PROMPT_H_ALCH_1_WARNING :=	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0002_high-alchemy-prompt-1.png"
global PROMPT_H_ALCH_1_CONTINUE :=	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0001_paper-click-here-to-continue.png"
global PROMPT_H_ALCH_2_CONTINUE :=	"E:\Documents\2019\OSRS Icons\_High_alchemy_prompt_2_confirm.png"
global PROMPT_H_ALCH_2_CANCEL :=	"E:\Documents\2019\OSRS Icons\_High_alchemy_prompt_2_cancel.png"

global PROMPT_MINING_FULL 	:= 		"E:\Documents\2019\OSRS Icons\_RS_PROMPT_MINING_FULL.png"


;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ CLICK
;--------------------------------------------------------------------------------------------------------------------

global CLICK_EMPTY := 		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0004s_0000_Right-Click-Empty.png"
global PLAYER_HEAD :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0005_Black-Square-(player-head).png"
global CLICK_EXAMINE :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0004s_0001_Examine-Click.png"
global CLICK_DROP :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0004s_0002_Drop-Click.png"
global CLICK_EXCHANGE :=	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0004s_0003_Exchange-Click.png"



;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ MINI MAP
;--------------------------------------------------------------------------------------------------------------------

global FRAME_MINI_MAP :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0008s_0000_minimap-border.png"
global MINI_MAP_TREE :=			"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0008s_0002_minimap-tree.png"
global LOG_OUT_BUTTON :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0008s_0000_Logout-X.png"
global MINI_MAP_PLAYER :=		"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0008s_0003_minimap-player-dot.png"




global EXIT_APP_BUTTON_BLUE :=	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0005_exit-app.png"
global EXIT_APP_BUTTON_WHITE := "E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0006_exit-app-button-white.png"
global WINDOW_MAXIMIZE_BLUE :=	"E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0005_Window-Maximize-button-blue.png"
global WINDOW_MAXIMIZE_WHITE := "E:\Documents\2019\OSRS Icons\OSRS-Icon-Search_0005s_0006_Window-Maximize-button-white.png"
;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ GLOBAL MAP
;--------------------------------------------------------------------------------------------------------------------

global G_MAP_PLAYER_LOC :=		"E:\Pictures\Screenshots\Screenshot (128).png"




;--------------------------------------------------------------------------------------------------------------------
;												ICONS _ GLOBAL MAP
;--------------------------------------------------------------------------------------------------------------------

global SMELT_CLICK			:=	"E:\Documents\2019\OSRS Icons\_RS_SMELT_RCLICK.png"
global SMELT_BRONZE_ICON	:=	"E:\Documents\2019\OSRS Icons\_RS_SMELT_BRONZE_BUTTON.png"
global BANK_CLICK			:=	"E:\Documents\2019\OSRS Icons\_RS_BANK_RCLICK.png"
global TIN_ORE_ICON			:=	"E:\Documents\2019\OSRS Icons\_RS_COPPER_ORE_ICON.png"
global COPPER_ORE_ICON		:=	"E:\Documents\2019\OSRS Icons\_RS_TIN_ORE_ICON.png"




;--------   smelt gold amulet run -----------------------------
global GOLD_BAR_ICON			:=	"E:\Documents\2019\OSRS Icons\_RS_GOLD_BAR_ICON.png"
global SMELT_GOLD_AMULET_ICON	:=	"E:\Documents\2019\OSRS Icons\_RS_SMELT_GOLD_AMULET_ICON.png"
; global MAKE_ALL_GOLD_AMULET_CLICK	:=	"E:\Pictures\Screenshots\Screenshot (149).png"
global MAKE_ALL_GOLD_AMULET_CLICK	:=	"E:\Pictures\Screenshots\Screenshot (149).png"




;------------ superheat item --------------------------------------
global ICON_IRON_ORE		:=	"E:\Documents\2019\OSRS Icons\_RS_IRON_ORE_ICON.png"
global ICON_COAL			:=	"E:\Documents\2019\OSRS Icons\_RS_COAL_ICON.png"
global ICON_SUPERHEAT_ITEM	:=	"E:\Documents\2019\OSRS Icons\_RS_SUPERHEAT_ICON.png"


;------------ telegrab -------------------------------------------
global SPELL_TELE_GRAB		:=	"E:\Documents\2019\OSRS Icons\_RS_SPELL_TELE_GRAB.png"
global SPELL_TELE_GRAB_2		:=	"E:\Documents\2019\OSRS Icons\_RS_SPELL_TELE_GRAB_2.png"
global ITEM_ZAMORAK_WINE_JUG	:= 	"E:\Documents\2019\OSRS Icons\_RS_WIINE_JUG.png"
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------







sendToRS(text) {
	IfWinExist, Old School RuneScape 
		WinActivate
	Else
		return ExitFunction(false)

	waitForLiftKey_AndBlockInput()
		Loop, 20
		{
			send, {BackSpace}
		}
		send, %text%
	return ExitFunction(true)
}
initRSWindow() {
	WinGet, RS_WIN_1, ID, A


	;msgbox, % "rs win: " . RS_WIN_1
}

findRSWindow() {
	if WinExist("ahk_id " . RS_WIN_1)	{
		WinGetPos, SCREEN_X1, SCREEN_Y1, w, h, ahk_id %RS_WIN_1%
		SCREEN_X2 := SCREEN_X1 + w
		SCREEN_Y2 := SCREEN_Y1 + h

		return ExitFunction(true)
	}
	else {
		Log_Flag("**********    Old School RuneScape Window Is not Open!    **********")
		DEBUG("Old School RuneScape Window Is not Open!")
		return ExitFunction(false)
	}
}


Re_InitializeParameters()
{
	

	initRSWindow()
		
	CoordMode, ToolTip, screen
	CoordMode, Mouse, screen
	CoordMode, Pixel, screen




					 ERROR_LOG_FILE :=	"E:\Documents\2019\OSRS Icons\__ErrorLog.txt"

					 globalClickID := 0
					 saveCurrentID := 0
					 saveMousePos_X := 0
					 saveMousePos_Y := 0


					 SCREEN_X1 := 0
					 SCREEN_Y1 := 0
					 SCREEN_X2 := 0
					 SCREEN_Y2 := 0

					 BACKPACK_X := 0
					 BACKPACK_Y := 0



						; global variables re - initialized in command +^e
					 GREEN := 0x005F00
					 YELLOW := 0xD88020
					 TAN_LOW := 0x900000
					 SELLING_1 := 0x3D372E
					 SELLING_2 := 0x3C352D
					 EMPTY_SLOT_HIGH := 0x495000
					 EMPTY_SLOT_LOW := 0x460000
					
					 NUM_AVAILABLE_SLOTS := 3

					 ESCAPE_SEQUENCE := false			; false = continue with sequence
					 CURRENT_LOOP := 0				; parameter to track current pos in a loop
					 TOTAL_LOOPS := 0
					 TOGGLE_MONITOR_LOOPS := false

					 HIGH_ALCH_ITEM := ""
					 HIGH_ALCH_NUM := 0
					 HIGH_ALCH_PRICE := 0
					 HIGH_ALCH_BUY_LIMIT := 0
					 HIGH_VALUE := false
					 BUY_COUNT := 0
					 GLOBAL_TIME_OUT := 48

					 PERSISTENCE_TOGGLE := false



	findRSWindow()





	;MouseGetPos, xpos, ypos, globalClickID, control
	;WinGetTitle, title, ahk_id %globalClickID%
	;WinGetClass, class, ahk_id %globalClickID%
	;MsgBox, %xpos%  %ypos%`nahk_id %globalClickID%`nahk_class %class%`n%title%`nControl: %control%
}




reloadScript(){
	BlockInput Off
		MsgBox, reloading this script
		flag_SUCCESS("reloading Script", 2)
		Reload, E:\Documents\RuneScape HotKeys.ahk
}
+^r::
	reloadScript()
Return
:*:r()::
	reloadScript()
Return

+^p::
	if (PERSISTENCE_TOGGLE = false){
		PERSISTENCE_TOGGLE := true
		#Persistent
		CoordMode Pixel, Screen 
		CoordMode Mouse, Screen 
		SetTimer, WatchCursorColor, 100
	} else {
		PERSISTENCE_TOGGLE := true
		SetTimer, WatchCursorColor, Off
		tooltip								; disable tooltip
	}
Return
WatchCursorColor:
	MouseGetPos X, Y 
	PixelGetColor Color, %X%, %Y%, RGB
	ToolTip, %X% %Y% - %Color%
Return
+^o::
	tooltip			; disable tooltip
Return
+^w::
	MsgBox, gcId %globalClickID%
Return

	; initialize global variables
+^e::
	MsgBox, re-initializing global variables
	Re_InitializeParameters()
Return
+^q::
	if (PERSISTENCE_TOGGLE = false){
		PERSISTENCE_TOGGLE := true
		; This example allows you to move the mouse around to see
		; the title of the window currently under the cursor:
		#Persistent
		SetTimer, WatchCursor, 100
	} else {
		PERSISTENCE_TOGGLE := false
		SetTimer, WatchCursor, Off
		tooltip							; disable tooltip
	}
Return
WatchCursor:
	WinGetPos, x, y, w, h, Old School RuneScape
	ToolTip, %x%  %y% | %w% %h% | %WinTitle%
Return 


waitForLiftKey_AndBlockInput() {
	KeyWait Control
	KeyWait Shift
	KeyWait Alt
	KeyWait Del
	KeyWait BackSpace

	BlockInput On
}

















Log_Flag(text){
	FormatTime, TimeString
	text := "`n" . text . "    ---    " . TimeString
	FileAppend, %text%, %ERROR_LOG_FILE%

}
resetErrorLog(){
	FileDelete, %ERROR_LOG_FILE%
	FileAppend, RuneScape AHK Error Log:`n, %ERROR_LOG_FILE%
}

sendNotification(text, duration := 2) {
	TrayTip, OSRS AHK ERROR, %text%, %duration%
}
flag_error(text, duration := 2){
	TrayTip, OSRS AHK ERROR, %text%, %duration%
	Log_Flag(text)
}
flag_SUCCESS(text, duration) {
	;TrayTip, OSRS AHK NOTIFY, %text%, %duration%
	Log_Flag(text)
}




saveCurrentPosition()
{
	MouseGetPos, saveMousePos_X, saveMousePos_Y, saveCurrentID
	; DEBUG(saveMousePos_X . " " . saveMousePos_Y)
	; DEBUG_MOUSE_POS(saveMousePos_X, saveMousePos_Y)
}
returnToLastSavedPosition()
{
	winactivate, ahk_id %saveCurrentID%
	MouseMove, %saveMousePos_X%, %saveMousePos_Y%
}


writeToNotepad(text) {

	winactivate, Untitled - Notepad
	WinWaitActive, Untitled - Notepad
				send, %text%
	
}



























+^a::
	MouseGetPos, OVX, OVY
	writeToNotepad("{tab}{tab}RSClick(" . OVX . ", " . OVY . ", 100){enter}")
Return
+^c::
	MouseGetPos, OVX, OVY
	writeToNotepad("{tab}{tab}RSInputClick(" . OVX . ", " . OVY . ", 1000, EnterTextHere , 500)")
Return
+^x::
	
	MouseGetPos, OVX, OVY
	writeToNotepad("{tab}{tab}RSRightClick(" . OVX . ", " . OVY . ", 100){enter}")
Return






sendClick(x, y, mouse){
	if (mouse = left) {
		RSClick(x, y, 0)
	}
	else if (mouse = right) {
		RSRightClick(x, y, 0)
	}
	else {
		flag_error("sendClick() : mouse param error:  " . mouse, 2)
		return ExitFunction(false)
	}
	return ExitFunction(true)
}


RSClick(rsX, rsY, sleeperTime)
{
		; send click and input to RS
	Send {Click, %rsX%, %rsY%}
	sleep, %sleeperTime%
}

RSClick_X(rsX, rsY, sleeperTime)
{
	waitForLiftKey_AndBlockInput()
		RSClick(rsX, rsY, sleeperTime)
		resetClickPos()
	return ExitFunction(true)
}

RSInputClick(rsX := 0, rsY := 0, sleeperTime_One := 0, input := "", sleeperTime_Two := 0)
{
		; send click and input to RS
	if (rsX != 0) {
		send {Click, %rsX%, %rsY%}
	}

	sleep, %sleeperTime_One%
	send, %input%
	sleep, 1000
	send, {enter}
	sleep, %sleeperTime_Two%
}

RSRightClick(rsX, rsY, sleeperTime)
{
		; send right click to RS
	Send {Click, %rsX%, %rsY%, right}
	sleep, %sleeperTime%
}
RSRightClick_X(rsX, rsY, sleeperTime) {
	waitForLiftKey_AndBlockInput()
		RSRightClick(rsX, rsY, sleeperTime)
		resetClickPos()
	return ExitFunction(true)
}

RSKeyHold(input_down, input_up, sleeperTime){
	waitForLiftKey_AndBlockInput()
		send %input_down%
		sleep, sleeperTime
		send, %input_up%
	return ExitFunction(true)
}
RSSendInput(input){

	waitForLiftKey_AndBlockInput()
	winActivate, ahk_id %RS_WIN_1%
	send, %input%

	return ExitFunction(true)
}



ExitFunction(value){
	BlockInput Off
		return value
}







;------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------









clickIcon(image, maxWait := 1000, extra := "") {

	var := false

	if (extra = "silent") {
		if !waitFor_Icon_Silent(image, maxWait) {
			findRSWindow()
			var := waitFor_Icon_Silent(image, maxWait)
		} else {
			var := true
		}
	} else {
		if !waitFor_Icon_Silent(image, maxWait) {
			findRSWindow()
			var := waitFor_Icon_Verbose(image, maxWait)
		} else {
			var := true
		}
	}

	if (var = false) {
		if (ErrorLevel = 1){
			Log_Flag(image . " was not found! ")
		}
		else if (ErrorLevel = 2) {
			Log_Flag("was not able to search for image: " . image)
		}
		else {
			Log_Flag("unknown error occured. ErrorLevel: " . ErrorLevel)
		}
		return ExitFunction(false)
	}

		if (extra = "right") {
			RSRightClick_X(Click_X, Click_Y, 0)
		}
		else {
			RSClick_X(Click_X, Click_Y, 0)
		}

	return ExitFunction(true)
}


openGE() {
	Log_Flag("DEBUG:      initiating openGE()")
	timeOut := 5
	counter := 1

	if !searchScreen(GE_TITLE_ICON) {
		RSClickOnPlayerHead("right")
		if !clickIcon(CLICK_EXCHANGE, 200) {
			mousemove, %SCREEN_X2%, %SCREEN_Y2%
		}
	}

	while !waitFor_Icon_Silent(GE_TITLE_ICON, 600) {
		RSClickOnPlayerHead("right")
		if !clickIcon(CLICK_EXCHANGE, 200) {
			mousemove, %SCREEN_X2%, %SCREEN_Y2%
		}

		if (counter = timeOut) {
			Log_Flag("----  ERROR:    openGE() Time Out")
			return ExitFunction(false)
		}
		counter += 1
	}
	Log_Flag("*** EXIT_SUCCESS:   exiting openGE() : SUCCESS")
	return ExitFunction(true)
}

RSGetCenterScreen() {
	findRSWindow()
	w := SCREEN_X2 - SCREEN_X1
	h := SCREEN_Y2 - SCREEN_Y1
	Click_X := ( w / 2 ) + SCREEN_X1
	Click_Y := ( h / 2 ) + SCREEN_Y1


}
RSFindPlayerHead(){
	step := 100
	h := SCREEN_Y2 - SCREEN_Y1
	add := h / step
	Click_Y -= add		; move up 1 step from center
}
RSClickOnPlayerHead(mouse := "left"){
	Log_Flag("DEBUG:      initiating RSClickOnPlayerHead(" . mouse . ")")
	RSGetCenterScreen()
	RSFindPlayerHead()
	if (mouse = "right") {
		return ExitFunction(RSRightClick_X(Click_X, Click_Y, 0))
	} else {
		return ExitFunction(RSClick_X(Click_X, Click_Y, 0))
	}
	Log_Flag("*** EXIT_SUCCESS:   exiting RSClickOnPlayerHead() : SUCCESS")
}

RSEnterInTextBox(input, image){
	if !waitFor_Icon_Verbose(image, 2000){
		return ExitFunction(false)
	}
	RSInputClick(Click_X, Click_Y, 500, input, 300)		; click paper to enter text
	return ExitFunction(true)
}

openBackpack(){
	Log_Flag("DEBUG:      initiating openBackpack()")
	while !waitFor_Icon_Silent(FRAME_BACKPACK, 50) {
		Log_Flag("DEBUG:      FRAME_BACKPACK not found")
		if !clickIcon(TAB_BACKPACK, 100){
			Log_Flag("openBackpack() : Critical failure, reloading script")
			reloadScript()
		}
	}
	if (BACKPACK_X = 0) {
		searchScreen_TopLeft(FRAME_BACKPACK)
		BACKPACK_X := Click_X
		BACKPACK_Y := Click_Y
	}
	Log_Flag("*** EXIT_SUCCESS:   exiting openBackpack() SUCCESS")
	return ExitFunction(true)
}

dropInventoryItem(row, col) {
	Log_Flag("DEBUG:      initiating clickInventoryItem()")
	openBackpack()

	shift_x := ( getWidth(FRAME_BACKPACK) / 5 ) * col
	shift_y := ( getHeight(FRAME_BACKPACK) / 7.8 ) * row

	x := BACKPACK_X + shift_x
	y := BACKPACK_Y + shift_y


	waitForLiftKey_AndBlockInput()
		winActivate, %RS_WIN_1%
		Send, {Shift Down}
			RSClick(x, y, 0)
		Send, {Shift UP}
	
	return ExitFunction(true)
}


clickInventoryItem(row, col, mouse := "left") {
	Log_Flag("DEBUG:      initiating clickInventoryItem()")
	openBackpack()

	shift_x := ( getWidth(FRAME_BACKPACK) / 5 ) * col
	shift_y := ( getHeight(FRAME_BACKPACK) / 7.8 ) * row

	x := BACKPACK_X + shift_x
	y := BACKPACK_Y + shift_y


	
	if (mouse = "left"){
		RSClick_X(x, y, 0)
	}
	else if (mouse = "right") {
		RSRightClick_X(x, y, 0)
	}
	else {
		flag_error("clickInventoryItem() : Invalid mouse parameter", 2)
		return ExitFunction(false)
	}
	
	return ExitFunction(true)
} 


waitForSlot_ToFill(slot, sleeperTime := 2500, timeOut := 5000) {
	Log_Flag("DEBUG:      initiating waitFor_Icon_Silent() : " . image)

	if (sleeperTime > timeOut){
		sleeperTime := timeOut / 3
	}
	timeOut := timeOut / sleeperTime
	counter := 0

	x1 := 1
	y1 := 1
	
	while checkInventorySlot_Empty(x1, y1) {
		Log_Flag("WAIT:       waitFor_Icon_Silent() - image not found: " . image)
		if (ErrorLevel = 2) {
			Log_Flag("---- ERROR:   waitFor_Icon_Silent() - UNABLE TO SEARCH: ErrorLevel: " . ErrorLevel " - image: " . image)
			return ExitFunction(false)
		}
		if (counter >= timeOut or ESCAPE_SEQUENCE = true) {
			ESCAPE_SEQUENCE := false
			Log_Flag("WAIT:       waitFor_Icon_Silent() - Time Out : " . image)
			return ExitFunction(false)
		}
		counter := counter + 1
		if (timeOut != 0) {
			sleep, %sleeperTime%
		}
	}

	Log_Flag("*** EXIT_SUCCESS:   exiting waitFor_Icon_Silent() : SUCCESS : " . image)
	return ExitFunction(true)
}
checkInventorySlot(row, col, image){

	waitForLiftKey_AndBlockInput()
		Log_Flag("DEBUG:      initiating checkInventorySlot()")
		clickInventoryItem(row, col, "right")
	waitForLiftKey_AndBlockInput()
		sleep, 10
		var := searchScreen(image, BACKPACK_X, BACKPACK_Y)
		RSClick(Click_X, Click_Y, 0)

		if (var = true) {
			Log_Flag("*** EXIT_SUCCESS:    exiting checkInventorySlot() : " . var)
		} else {
			Log_Flag("*** EXIT_FAILURE:    exiting checkInventorySlot() : " . var)
		}
	return ExitFunction(var)
}
checkInventorySlot_Empty(row, col) {
	Log_Flag("DEBUG:      initiating checkInventorySlot_Empty()")
	var := checkInventorySlot(row, col, CLICK_EMPTY)
	if (var = true){
		Log_Flag("DEBUG:  Inventory Slot is Empty: " . row . " " . col)
	} else {
		Log_Flag("DEBUG:  Inventory Slot - Item Found: " . row . " " . col)
	}

	if (var = true) {
		Log_Flag("*** EXIT_SUCCESS:    exiting checkInventorySlot_Empty() : " . var)
	} else {
		Log_Flag("*** EXIT_FAILURE:    exiting checkInventorySlot_Empty() : " . var)
	}
	return ExitFunction(var)
}


examineInventorySlot(row, col) {
	clickInventoryItem(row, col, "right")
	clickIcon(CLICK_EXAMINE)
}


confirmNatureRune(){
	openBackpack()
	if waitFor_Icon_Silent(ITEM_NATURE_RUNE, 500) {
		Log_Flag("DEBUG:  Nature Rune Found!")
		return ExitFunction(true)
	} else {
		Log_Flag("DEBUG:  Nature Rune Not Found...")
		return ExitFunction(false)
	}
}


getImageValue(image, value){
	w := FGP_Value(image, FGP_Num(value))
	NewVar := RegExReplace(w, "\D")
	return NewVar
}

getWidth(image){
	return getImageValue(image, "Width")
}

getHeight(image){
	return getImageValue(image, "Height")
}


searchScreen_TopLeft(image, x1 := -1, y1 := -1, x2 := -1, y2 := -1) {
	if (x1 = -1){
		x1 := SCREEN_X1
	}
	if (y1 = -1){
		y1 := SCREEN_Y1
	}
	if (x2 = -1){
		x2 := SCREEN_X2 + 100
	}
	if (y2 = -1){
		y2 := SCREEN_Y2 + 100
	}

    ImageSearch, Click_X, Click_Y, x1, y1,x2,y2, *20 *TransBlack %image%
	if (ErrorLevel = 0){
		return ExitFunction(true)
	} else {
		return ExitFunction(false)
	}
}

searchScreen(image, x1 := -1, y1 := -1, x2 := -1, y2 := -1) {
	if searchScreen_TopLeft(image, x1, y1, x2, y2) {
		w := getImageValue(image, "Width")
		h := getImageValue(image, "Height")
		
		Click_X += (w / 2)
		Click_Y += (h / 2)
		return ExitFunction(true)
	} else {
		return ExitFunction(false)
	}
}
resetClickPos() {
	Click_X := 0
	Click_Y := 0
}
















;---------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------                      RS LOGIN                 ---------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------







RSLogin(){

	if !findRSWindow() {
		return ExitFunction(false)
	}

	waitForLiftKey_AndBlockInput()
		if clickIcon(LOGIN_EXISTING_USER) {
			if clickIcon(LOGIN_CLICK_TO_SWITCH_WORLDS) {
				if clickIcon(LOGIN_SELECT_WORLD){
					if waitFor_Icon_Verbose(LOGIN_LOGO) {
						RSInputClick( , , 100, "Ritakeykos0", 0)
						if clickIcon(LOGIN_CLICK_HERE_TO_PLAY, 4000) {
							return ExitFunction(true)
						}
					}
				}
			}
		}
	return ExitFunction(false)
}
RSSetView(){

	if !findRSWindow() {
		return ExitFunction(false)
	}

	waitForLiftKey_AndBlockInput()

		if clickIcon(COMPASS){
			if clickIcon(TAB_SETTINGS) {
				if waitFor_Icon_Verbose(ZOOM_ICON) {
					Click_X += 3.2 * getImageValue(ZOOM_ICON, "Width")
					RSClick(Click_X, Click_Y, 100)
					clickIcon(TAB_SETTINGS)
					RSKeyHold("{Up down}", "{Up up}", 2000)
					return ExitFunction(true)
				}
			}
		}

		
	return ExitFunction(false)
;
;		RSClick(2396, 1134, 500) 
;		RSClick(2471, 2110, 100) 
;		RSClick(2496, 1893, 100) 
;		RSClick(2471, 2110, 100)
;		RSKeyHold("{Up down}", "{Up up}", 2000)
;	return ExitFunction(true)
}



pause()
{
	BlockInput Off
		MsgBox, paused
}

DEBUG(text){
	BlockInput Off
		MsgBox, % text
}

DEBUG_MOUSE_POS(x := -1, y := -1){
	if (x = -1){
		x := Click_X
	}
	if (y = -1){
		y := Click_Y
	}
	MouseMove, %x%, %y%
	pause()
}










checkColor(x,y){
	waitForLiftKey_AndBlockInput()
		PixelGetColor, Color, %x%, %y%, RGB
	return ExitFunction(Color)
}

checkColor_TextBox_IsPaper(){
	if (checkColor(1713, 2029) > TAN_LOW) {
	return ExitFunction(true)
	} else {
	return ExitFunction(false)
	}
}

checkColor_GE_Open(){
	Color := checkColor(1910, 1432)
	if ( Color < EMPTY_SLOT_HIGH) {
		if (Color > EMPTY_SLOT_LOW) {
			return ExitFunction(true)
		} 
		return ExitFunction(false)
	}
	return ExitFunction(false)
}

waitForChangeInColor(x,y,color){
	sleeperTime := 100
	timeOut := 20		; 2 seconds
	counter := 0
		while (checkColor(x,y) = color) {
			if (counter = timeOut or ESCAPE_SEQUENCE = true) {
				flag_error("waitForChangeInColor() : Time Out", 2)
				ESCAPE_SEQUENCE := false
				return ExitFunction(false)
			}
			counter := counter + 1
			sleep, %sleeperTime%
		}
		return ExitFunction(true)
}


waitFor_Paper() {
	sleeperTime := 200
	timeOut := 10		; 2 seconds
	counter := 0
		while !checkColor_TextBox_IsPaper() {
			if (counter = timeOut or ESCAPE_SEQUENCE = true) {
				flag_error("waitFor_Paper() : Time Out", 2)
				ESCAPE_SEQUENCE := false
				return ExitFunction(false)
			}
			counter := counter + 1
			sleep, %sleeperTime%
		}
		return ExitFunction(true)
}

waitFor_GEOpen() {
	return ExitFunction(waitFor_Icon_Silent(GE_TITLE_ICON))
}

waitFor_Icon_Silent(image, timeOut := 1000, x1 := -1, y1 := -1, x2 := -1, y2 := -1){
	Log_Flag("DEBUG:      initiating waitFor_Icon_Silent() : " . image)
	if (x1 = -1){
		x1 := SCREEN_X1
	}
	if (y1 = -1){
		y1 := SCREEN_Y1
	}
	if (x2 = -1){
		x2 := SCREEN_X2
	}
	if (y2 = -1){
		y2 := SCREEN_Y2
	}

	sleeperTime := 200
	if (sleeperTime > timeOut){
		sleeperTime := timeOut / 3
	}
	timeOut := timeOut / sleeperTime
	counter := 0

	
	while !searchScreen(image, x1, y1, x2, y2) {
		Log_Flag("WAIT:       waitFor_Icon_Silent() - image not found: " . image)
		if (ErrorLevel = 2) {
			Log_Flag("---- ERROR:   waitFor_Icon_Silent() - UNABLE TO SEARCH: ErrorLevel: " . ErrorLevel " - image: " . image)
			return ExitFunction(false)
		}
		if (counter >= timeOut or ESCAPE_SEQUENCE = true) {
			ESCAPE_SEQUENCE := false
			Log_Flag("WAIT:       waitFor_Icon_Silent() - Time Out : " . image)
			return ExitFunction(false)
		}
		counter := counter + 1
		if (timeOut != 0) {
			sleep, %sleeperTime%
		}
	}

	Log_Flag("*** EXIT_SUCCESS:   exiting waitFor_Icon_Silent() : SUCCESS : " . image)
	return ExitFunction(true)
}

waitFor_Icon_Verbose(image, timeOut := 1000, x1 := -1, y1 := -1, x2 := -1, y2 := -1) {
	Log_Flag("DEBUG:      initiating waitFor_Icon_Verbose() : " . image)
	var := waitFor_Icon_Silent(image, timeOut, x1, y1, x2, y2)

	if (var = false) {
			sendNotification("TimeOut Notification : waitFor_Icon() has timed out : " . image)
			if (image = GE_EXIT_BUTTON) {
				DEBUG("Review log to check what's causing verbose for ge exit button")
			}
		return ExitFunction(var)
	}

	Log_Flag("*** EXIT_SUCCESS:   exiting waitFor_Icon_Verbose() : SUCCESS : " . image)
	return ExitFunction(var)
}
































geBuy(slot, whatBuy, numBuy, priceBuy)
{	
	Log_Flag("DEBUG:      initiating geBuy(" . slot . ", " . whatBuy . ", " . numBuy . ", " . priceBuy . ")")

	if !openGE() {
		return ExitFunction(false)
	}

	waitForLiftKey_AndBlockInput()
		i := 0
		while !geCheckIf_Empty(slot) {
			i := i + 1
			Log_Flag("DEBUG:      geBuy() - geCheckIf_Empty() FAILURE     loop: " . CURRENT_LOOP)
			temp := BUY_COUNT
			highAlchAbortSale(i)
			BUY_COUNT := temp
		}

Log_Flag("               geCheckIf_Empty(" . slot . ") SUCCESS")
		
		if !geCheckSlot(slot, GE_BUY_ICON) {
			Log_Flag("DEBUG:      GE_BUY_ICON - geCheckSlot() FAILURE     loop: " . CURRENT_LOOP)
			return ExitFunction(false)
		}
		RSClick(Click_X, Click_Y, 0)

Log_Flag("               geCheckSlot(" . slot . ", GE_BUY_ICON) SUCCESS")
		
		if !RSEnterInTextBox(whatBuy, GE_WHAT_SET_PAGE)	{
			Log_Flag("DEBUG:      GE_WHAT_SET_PAGE - RSEnterInTextBox() FAILURE     loop: " . CURRENT_LOOP)

			return ExitFunction(false)
		}

Log_Flag("               RSEnterInTextBox(" . slot . ", GE_WHAT_SET_PAGE) SUCCESS")

		
		if (numBuy != "1") {
			if !clickIcon(GE_NUM_SET_BUTTON) {	; click [...] button to set num
				Log_Flag("DEBUG:      GE_NUM_SET_BUTTON - clickIcon() FAILURE     loop: " . CURRENT_LOOP)
				return ExitFunction(false)
			}
Log_Flag("               clickIcon(GE_NUM_SET_BUTTON) SUCCESS")
			if !RSEnterInTextBox(numBuy, GE_NUM_SET_PAGE) {
				Log_Flag("DEBUG:      GE_NUM_SET_PAGE - RSEnterInTextBox() FAILURE     loop: " . CURRENT_LOOP)
				return ExitFunction(false)
			}
Log_Flag("               RSEnterInTextBox(" . slot . ", GE_NUM_SET_PAGE) SUCCESS")
		}
		if (priceBuy != "0") {
			if !searchScreen(GE_PRICE_SET_BUTTON) {	; click [...] button to set price
				Log_Flag("DEBUG:      GE_PRICE_SET_BUTTON - searchScreen() FAILURE     loop: " . CURRENT_LOOP)
				return ExitFunction(false)
			}
			RSClick(Click_X, Click_Y, 100)
Log_Flag("               searchScreen(GE_PRICE_SET_BUTTON) SUCCESS")

			if !RSEnterInTextBox(priceBuy, GE_PRICE_SET_PAGE)	{
				Log_Flag("DEBUG:      GE_PRICE_SET_PAGE - RSEnterInTextBox() FAILURE     loop: " . CURRENT_LOOP)
				return ExitFunction(false)
			}
Log_Flag("               RSEnterInTextBox(" . slot . ", GE_PRICE_SET_PAGE) SUCCESS")
		}

		sleep, 200
		if clickIcon(GE_CONFIRM) {
Log_Flag("               clickIcon(GE_CONFIRM) SUCCESS")
			if geExit() {
Log_Flag("               geExit() SUCCESS")
				return ExitFunction(true)
			}
		}

	return ExitFunction(false)
}







geFindNextBlankSlot(x := -1){
	if !searchScreen(GE_BLANK_SLOT, x) {
		Log_Flag("geFindNextBlankSlot() : Next blank slot not found.  x: " . x)
		return ExitFunction(false)
	}
	return ExitFunction(true)
}


geCheckSlot(slot, image) {			; image dependent
	;Log_Flag("DEBUG:      initiating geCheckSlot()       loop: " . CURRENT_LOOP)

	waitForLiftKey_AndBlockInput()
		waitTime := 400
		padding := getWidth(GE_BLANK_SLOT) / 1.8
		x := -1

		if (slot > NUM_AVAILABLE_SLOTS) {
			slot := NUM_AVAILABLE_SLOTS
		}

		Loop, %slot% 
		{
			geFindNextBlankSlot(x)
			x := Click_X
		}

		x1 := Click_X - padding
		X2 := Click_X + padding
	return ExitFunction( searchScreen(image, x1, -1, x2, -1) )
}

geCheckIf_Empty(slot){
	waitForLiftKey_AndBlockInput()
		return ExitFunction( geCheckSlot(slot, GE_EMPTY_SLOT) )
}
geCheckIf_Green(slot){
	waitForLiftKey_AndBlockInput()
		return ExitFunction( geCheckSlot(slot, GE_GREEN_SLOT) )
}

geConfirmAllSlotsEmpty(){
	Log_Flag("DEBUG:      initiating geConfirmAllSlotsEmpty()       loop: " . CURRENT_LOOP)

	if !geCheckIf_Empty(1) {
		Log_Flag("DEBUG:      slot 1 Full       loop: " . CURRENT_LOOP)
		return ExitFunction(false)
	}
	if !geCheckIf_Empty(2) {
		Log_Flag("DEBUG:      slot 2 Full       loop: " . CURRENT_LOOP)
		return ExitFunction(false)
	}
	if !geCheckIf_Empty(3) {
		Log_Flag("DEBUG:      slot 3 Full       loop: " . CURRENT_LOOP)
		return ExitFunction(false)
	}
	return ExitFunction(true)
}

geExit(){
	Log_Flag("DEBUG:      initiating geExit()       loop: " . CURRENT_LOOP)
	return ExitFunction( clickIcon(GE_EXIT_BUTTON, 500, "silent"))
}

geCollectWait(slot, TIME_OUT)
{
	Log_Flag("DEBUG:      initiating geCollectWait()       loop: " . CURRENT_LOOP)

	if (slot = "0") {
		ToolTip					; clear tooltip
		return ExitFunction(true)
	}

	SLEEP_TIME := 500				;
	TimerCount := 0
									; wait until slot is green
	while !geCheckIf_Green(slot){
		if (TimerCount = TIME_OUT or ESCAPE_SEQUENCE = true) {
			ToolTip					; clear tooltip
			Log_Flag("WAIT:       geCollectWait() : Time Out")
			ESCAPE_SEQUENCE := false
			return ExitFunction(false)
		}
		TimerCount := TimerCount + 1
		ToolTip, WAITING ON slot %slot%   -   TimerCount: %TimerCount% / %TIME_OUT%
		sleep, %SLEEP_TIME%
		if (SLEEP_TIME < 5000){
			SLEEP_TIME += 500
		}
	}
	ToolTip
	return ExitFunction(true)
}


geCollect(slot1, slot2, slot3, TIME_OUT)
{
	Log_Flag("DEBUG:      initiating geCollect()       loop: " . CURRENT_LOOP)

	
	RSClickOnPlayerHead()
	if !waitFor_GEOpen() {
		return ExitFunction(false)
	}

	if !geCollectWait(slot1, TIME_OUT){
		;geExit()
		return ExitFunction(false)
	}
	if !geCollectWait(slot2, TIME_OUT){
		;geExit()
		return ExitFunction(false)
	}
	if !geCollectWait(slot3, TIME_OUT){
		;geExit()
		return ExitFunction(false)
	}
	;ToolTip, COLLECTING Grand Exchange !
	waitForLiftKey_AndBlockInput()
	
		if clickIcon(GE_COLLECT_BUTTON) {
			if geExit() {
				ToolTip							; clear tooltip
				return ExitFunction(true)
			}
		}
	ToolTip							; clear tooltip
	return ExitFunction(false)
}
























setHighAlchItem(item := "", num := 0, price := 0, limit := 0, timer := 48 ) {
	txt := "DEBUG:      initiating setHighAlchItem(" . item . "   " . num . "   " . price . "   " . limit . ")"
	Log_Flag(txt)

	if (num = 0){
		InputBox, HIGH_ALCH_ITEM, set high alch item, what do you want to alch with?     		current item: %HIGH_ALCH_ITEM%
		InputBox, HIGH_ALCH_NUM, set number of items to alch, How many do you want to alch?     current num: %HIGH_ALCH_NUM%
		InputBox, HIGH_ALCH_PRICE, set price, what do you want to pay for this item?     		current price: %HIGH_ALCH_PRICE%
		InputBox, HIGH_VALUE, set alch value, is this a high value item?     					current value: %HIGH_VALUE%
	}
	else {
		HIGH_ALCH_ITEM := item
		HIGH_ALCH_NUM := num
		HIGH_ALCH_PRICE := price
		HIGH_ALCH_BUY_LIMIT := limit
		GLOBAL_TIME_OUT := timer
	}
}


highAlch(numLoop, subSleep := 0)
{
	SleeperTime1 := 800
	SleeperTime2 := 1500

	Log_Flag("DEBUG:      initiating highAlch()       loop: " . CURRENT_LOOP)

	if (numLoop = "0") {
		InputBox, numLoop, Performing High Alch{!}, how many times to loop? ;
	}

	if !clickIcon(TAB_MAGIC) {
		return ExitFunction(false)
	}


	Loop, %numLoop%
	{
		saveCurrentPosition()
			if ESCAPE_SEQUENCE {
				flag_error("highAlch() : ESCAPE WAS HIT  -  ABORTING LOOP  -  " . CURRENT_LOOP, 5)
				ESCAPE_SEQUENCE := false
				return ExitFunction(false)
			}

			waitForLiftKey_AndBlockInput()
			
				if !clickIcon(SPELL_HIGH_ALCH, 500) {
					if !clickIcon(TAB_MAGIC) {
						return ExitFunction(false)
					}
					if !clickIcon(SPELL_HIGH_ALCH) {
						return ExitFunction(false)
					}
				}
				clickInventoryItem(1, 2)
		returnToLastSavedPosition()

		if (waitFor_Icon_Silent(PROMPT_H_ALCH_1_WARNING, 600)) {
			saveCurrentPosition()
				if (subSleep >= SleeperTime1){
					SleeperTime := 0
				} else {
					SleeperTime := SleeperTime1 - subSleep
				}
				BlockInput Off
				waitForLiftKey_AndBlockInput()

				if !clickIcon(PROMPT_H_ALCH_1_CONTINUE) {
					return ExitFunction(false)
				}
				sleep, 250
				if !clickIcon(PROMPT_H_ALCH_2_CONTINUE) {
					return ExitFunction(false)
				}
			returnToLastSavedPosition()
		} else {
			if (subSleep >= SleeperTime2){
				SleeperTime := 0
			} else {
				SleeperTime := SleeperTime2 - subSleep
			}
		}

			
		BlockInput Off

		BUY_COUNT := BUY_COUNT + 1
		if (SleeperTime != 0){
			sleep, SleeperTime
		} else {
			Log_Flag("DEBUG:      highAlch()  --  skipping sleep")
		}
	}

	var := clickIcon(TAB_MAGIC)
		
	if (var = true) {
		Log_Flag("*** EXIT_SUCCESS:    exiting highAlch()       loop: " . CURRENT_LOOP)
	} else {
		Log_Flag("*** EXIT_FAILURE:    exiting highAlch()       loop: " . CURRENT_LOOP)
	}
	return ExitFunction(var)		; close magic tab
}

replenish_High_Alch_Materials()
{
	Log_Flag("DEBUG:      initiating replenish_High_Alch_Materials()       loop: " . CURRENT_LOOP)

	if ( (BUY_COUNT + HIGH_ALCH_NUM) > HIGH_ALCH_BUY_LIMIT ) {
		HIGH_ALCH_NUM := HIGH_ALCH_BUY_LIMIT - BUY_COUNT
	}

	if !geBuy(1, HIGH_ALCH_ITEM, HIGH_ALCH_NUM, HIGH_ALCH_PRICE) {
		Log_Flag("DEBUG:      geBuy() FAILURE     loop: " . CURRENT_LOOP)
		return ExitFunction(false)
	}
	
	if !openGE() {
		Log_Flag("----  ERROR:    replenish_High_Alch_Materials() : openGE() FAILURE     loop: " . CURRENT_LOOP)
	}

	if !geCollectWait(1, GLOBAL_TIME_OUT){
			Log_Flag("DEBUG:      geCollectWait() FAILURE     loop: " . CURRENT_LOOP)
			return ExitFunction(highAlchAbortSale())
	}

	if !geBuy(2, "nature rune", HIGH_ALCH_NUM, 241) {
		if !geBuy(2, "nature rune", HIGH_ALCH_NUM, 241) {
			flag_error("replenish_High_Alch_Materials() : Critical Failure, unable to purchase nature runes... reloading script", 2)
			reloadScript()
		}
	}
	return ExitFunction(true)
}


highAlchLoop(numLoop := 0) {
	Log_Flag("DEBUG:      initiating highAlchLoop()       numLoops: " . numLoop)


	CURRENT_LOOP := 0
	if (numLoop = 0) {
		InputBox, numLoop, High Alch Loop, how many loops?
	}
	TOTAL_LOOPS := numLoop
	Loop, %numLoop%
	{
		CURRENT_LOOP := CURRENT_LOOP + 1
		
		if ESCAPE_SEQUENCE {
			flag_error("ESCAPE WAS HIT  -  ABORTING LOOP", 5)
			ESCAPE_SEQUENCE := false
			return ExitFunction(false)
		}
		if !replenish_High_Alch_Materials() {
			Log_Flag("DEBUG:      replenish_High_Alch_Materials() FAILURE     loop: " . CURRENT_LOOP)
			return ExitFunction(false)
		}

		if !geCollect(1,2,0, GLOBAL_TIME_OUT) {
			Log_Flag("DEBUG:      geCollect() FAILURE     loop: " . CURRENT_LOOP)
			return ExitFunction(highAlchAbortSale())
		}

		sleep, 500
		highAlch(HIGH_ALCH_NUM, 500)
	}
	
	CURRENT_LOOP := 0
	TOTAL_LOOPS := 0

	examineInventorySlot(1, 1)		; examine Gold
	
	flag_SUCCESS(" High Alchemy Loop COMPLETED!  -  " . numLoop . " loops   --   Item: " . HIGH_ALCH_ITEM, 10)
	return ExitFunction(true)
}




highAlchAbortSale(iteration := 0) {
	Log_Flag("DEBUG:      initiating highAlchAbortSale()")

	i := 0
	Loop, 3
	{
		if !openGE() {
			return ExitFunction(false)
		}
		
		i := i + 1
		
		if !geCheckSlot(i, GE_GREEN_SLOT) && !geCheckSlot(i, GE_EMPTY_SLOT) {
			geCheckSlot(i, GE_Blank_SLOT)
			RSClick(Click_X, Click_Y, 0)

			if !clickIcon(GE_ABORT_OFFER_BUTTON){
				flag_error("highAlchAbortSale() : Critical Failure, GE_ABORT_OFFER_BUTTON  --  reloading script", 2)
				reloadScript()
			}
			Log_Flag("SUCCESS:   Abort button pressed")

			if !clickIcon(GE_OFFER_RETURN_BUTTON){
				flag_error("highAlchAbortSale() : Critical Failure, GE_OFFER_RETURN_BUTTON  --  reloading script", 2)
				reloadScript()
			}
			Log_Flag("SUCCESS:   return button pressed")

			sleep, 2000
			if !clickIcon(GE_COLLECT_BUTTON){
				flag_error("highAlchAbortSale() : Critical Failure, GE_COLLECT_BUTTON  --  reloading script", 2)
				reloadScript()
			}
			Log_Flag("SUCCESS:   collect button pressed")

			sleep, 2000
			if !geConfirmAllSlotsEmpty() {
				if (iteration >= 3) {
					flag_error("highAlchAbortSale() : Critical Failure, Slots are not emptying... reloading script", 2)
					reloadScript()
				}
				iteration := iteration + 1
				highAlchAbortSale(iteration)
			}
			Log_Flag("SUCCESS:   all GE Slots confirmed empty")

			if !geExit(){
				flag_error("highAlchAbortSale() : Critical Failure, reloading script", 2)
				reloadScript()
			}
			Log_Flag("SUCCESS:   GE Exit button pressed")

		}
	}

	alch_failure_recovery()
	Log_Flag("*** EXIT_SUCCESS:   exiting  highAlchAbortSale() after alch_failure_recovery()")
	return ExitFunction(false)
}

alch_failure_recovery() {
	Log_Flag("SUCCESS:   initiating alch_failure_recovery()")

	geExit()
	sleep, 500
	
	while !checkInventorySlot_Empty(1, 2) {
		if confirmNatureRune(){
			highAlch(1, 1500)
		} else {
			if !geBuy(2, "nature rune", 20, 244) {
				flag_error("alch_failure_recovery() : Critical Failure to buy nature runes in slot 3, reloading script")
				reloadScript()
			}
			if !geCollect(0, 0, 2, 24) {	; 2 min wait
				flag_error("alch_failure_recovery() : Critical Failure to collect nature runes in slot 3, reloading script")
				reloadScript()
			}
		}
	}
	
	Log_Flag("DEBUG:      Setting BUY_COUNT := HIGH_ALCH_BUY_LIMIT")
	BUY_COUNT := HIGH_ALCH_BUY_LIMIT			; move on to the next item
	examineInventorySlot(1, 1)		; examine Gold
	Log_Flag("*** EXIT_SUCCESS:   exiting  alch_failure_recovery()  SUCCESS")
	return ExitFunction(true)
}


highAlchIterateEntireSet(i) {
	Log_Flag("DEBUG:  highAlchIterateEntireSet( " . i . " )")

	level_1 := 125
	level_2 := 70
 	level_3 := 60

	if (i = 1) {
		setHighAlchItem(TITLE_MITHRIL_PLATEBODY, level_1, VALUE_MITHRIL_PLATEBODY, 125)
	}
	if (i = 2) {
		setHighAlchItem(TITLE_MITHRIL_KITESHIELD, level_1, VALUE_MITHRIL_KITESHIELD, 125)
	}
	if (i = 3) {
		setHighAlchItem(TITLE_MITHRIL_2H_SWORD, level_1, VALUE_MITHRIL_2H_SWORD, 125)
	}
	if (i = 4) {
		setHighAlchItem(TITLE_MITHRIL_PICKAXE, level_1, VALUE_MITHRIL_PICKAXE, 40)
	}

	if (i = 5) {
		setHighAlchItem(TITLE_ADAMANT_PLATEBODY, level_1, VALUE_ADAMANT_PLATEBODY, 125)
	}
	if (i = 6) {
		setHighAlchItem(TITLE_ADAMANT_SQ_SHIELD, level_1, VALUE_ADAMANT_SQ_SHIELD, 125)
	}
	if (i = 7) {
		setHighAlchItem(TITLE_ADAMANT_KITESHIELD, level_1, VALUE_ADAMANT_KITESHIELD, 125)
	}
	if (i = 8) {
		setHighAlchItem(TITLE_ADAMANT_2H_SWORD, level_1, VALUE_ADAMANT_2H_SWORD, 125)
	}

	if (i = 9) {
		setHighAlchItem(TITLE_RUNE_2H_SWORD, level_2, VALUE_RUNE_2H_SWORD, 70)
	}
	if (i = 10) {
		setHighAlchItem(TITLE_RUNE_MED_HELM, level_2, VALUE_RUNE_MED_HELM, 70)
	}
	if (i = 11) {
		setHighAlchItem(TITLE_RUNE_FULL_HELM, level_2, VALUE_RUNE_FULL_HELM, 70)
	}
	if (i = 12) {
		setHighAlchItem(TITLE_RUNE_CHAINBODY, level_2, VALUE_RUNE_CHAINBODY, 70)
	}
	if (i = 13) {
		setHighAlchItem(TITLE_RUNE_PLATEBODY, level_2, VALUE_RUNE_PLATEBODY, 70)
	}
	if (i = 14) {
		setHighAlchItem(TITLE_RUNE_SQ_SHIELD, level_2, VALUE_RUNE_SQ_SHIELD, 70)
	}
	if (i = 15) {
		setHighAlchItem(TITLE_RUNE_KITESHIELD, level_2, VALUE_RUNE_KITESHIELD, 70)
	}
	if (i = 16) {
		setHighAlchItem(TITLE_RUNE_PLATELEGS, level_2, VALUE_RUNE_PLATELEGS, 70)
	}
	if (i = 17) {
		setHighAlchItem(TITLE_RUNE_PLATESKIRT, level_2, VALUE_RUNE_PLATESKIRT, 70)
	}
	if (i = 18) {
		setHighAlchItem(TITLE_RUNE_SCIMITAR, level_2, VALUE_RUNE_SCIMITAR, 70)
	}

	if (i = 19) {
		setHighAlchItem(TITLE_GREEN_DHIDE_BODY, level_1, VALUE_GREEN_DHIDE_BODY, 125)
	}
}
highAlchEntireSet(i := 0) {
	numloop = 19
	if (i != 0) {
		numloop := 20 - i
	}
	Loop, %numloop%
	{
		i := i + 1
		BUY_COUNT := 0
		highAlchIterateEntireSet(i)
		while (BUY_COUNT < HIGH_ALCH_BUY_LIMIT) {
			if !highAlchLoop(1) {
				if !alch_failure_recovery(){
					flag_error("---- ERROR:    highAlchEntireSet() : Critical failure, reloading script", 2)
					reloadScript()
				}
			}
		}
	}
}























;--- this funciton assumes the player starts off at the al karid bank,
;--- at the stall directly to the west of the bank doors
test_smelting_run() {
	SleeperTime2 := 16000						; 15 seconds

					; move up from bank
	clickMiniMap("right", 0.35)
	sleep, 6500									; 6 seconds
	; //pause()
	clickMiniMap("up", 1)
	sleep, SleeperTime2
	; //DEBUG("Is this enough time?")
					; smelt
	if stepFind(SMELT_CLICK) {
		if clickIcon(SMELT_BRONZE_ICON) {
			sleep, 46000						; 46 seconds

			if searchScreen(PROMPT_H_ALCH_1_CONTINUE) {
				if !stepFind(SMELT_CLICK) {
					return ExitFunction(false)
				}
				if !clickIcon(SMELT_BRONZE_ICON) {
					return ExitFunction(false)
				}
				sleep, 46000						; 46 seconds
			}
			;  //DEBUG("Is this enough time?")

					; move down
			clickMiniMap("Down", 1)
			sleep, SleeperTime2
			;  //DEBUG("Is this enough time?")
					; bank
			if stepFind(BANK_CLICK, 1) {
				sleep, 4000						; 4 seconds

				if clickIcon(COPPER_ORE_ICON) {
					if clickInventoryItem(1, 1, "left") {
						if clickIcon(TIN_ORE_ICON) {
							return ExitFunction(true)
						}
					}
				}
			}
		}
	}
	return ExitFunction(false)	
}










;--- this funciton assumes the player starts off at the al karid bank,
;--- at the stall directly to the west of the bank doors
smelt_steel() {
	SleepSmith := 27000							; 27 sec
	SleeperTime2 := 16000						; 15 seconds

					; move up from bank
	clickMiniMap("right", 0.35)
	sleep, 6500									; 6 seconds
	; //pause()
	clickMiniMap("up", 1)
	sleep, SleeperTime2
	; //DEBUG("Is this enough time?")
					; smelt
	if stepFind(SMELT_CLICK) {
		if waitFor_Icon_Silent(SMELT_BRONZE_ICON, 3000) {
			waitForLiftKey_AndBlockInput()
				WinActivate, ahk_id %RS_WIN_1%
				send, 4
			BlockInput Off
				sleep, SleepSmith

			if searchScreen(PROMPT_H_ALCH_1_CONTINUE) {
				if !stepFind(SMELT_CLICK) {
					return ExitFunction(false)
				}
				if !waitFor_Icon_Silent(SMELT_BRONZE_ICON) {
					return ExitFunction(false)
				}
				waitForLiftKey_AndBlockInput()
					WinActivate, ahk_id %RS_WIN_1%
					send, 4
				BlockInput Off
				sleep, SleepSmith
			}
			;  //DEBUG("Is this enough time?")

					; move down
			clickMiniMap("Down", 1)
			sleep, SleeperTime2
			;  //DEBUG("Is this enough time?")
					; bank
			if stepFind(BANK_CLICK, 1) {
				sleep, 4000						; 4 seconds

				if clickIcon(ICON_COAL) {
					if clickInventoryItem(1, 1, "left") {
						if clickIcon(ICON_IRON_ORE) {
							return ExitFunction(true)
						}
					}
				}
			}
		}
	}
	return ExitFunction(false)	
}




;--- this funciton assumes the player starts off at the al karid bank,
;--- at the stall directly to the west of the bank doors
smelt_gold_amulet_run() {
	SleeperTime2 := 15000						; 15 seconds

						; move up from bank
	saveCurrentPosition()
		clickMiniMap("right", 0.35)
	returnToLastSavedPosition()
		sleep, 4500									; 6 seconds
		; //pause()

	saveCurrentPosition()
		clickMiniMap("up", 1)
	returnToLastSavedPosition()
		sleep, SleeperTime2
		; //DEBUG("Is this enough time?")
						; smelt
	saveCurrentPosition()
	if stepFind(SMELT_CLICK) {
		if clickIcon(SMELT_GOLD_AMULET_ICON, 600, "right") {
					if clickIcon(MAKE_ALL_GOLD_AMULET_CLICK) {
			returnToLastSavedPosition()
						sleep, 48000						; 46 seconds
		
				saveCurrentPosition()
					if searchScreen(PROMPT_H_ALCH_1_CONTINUE, SCREEN_X1) {
						if !stepFind(SMELT_CLICK) {
							return ExitFunction(false)
						}
						if !clickIcon(SMELT_GOLD_AMULET_ICON, 600, "right") {
							return ExitFunction(false)
						}
						if !clickIcon(MAKE_ALL_GOLD_AMULET_CLICK) {
							return ExitFunction(false)
						}
				returnToLastSavedPosition()
						sleep, 46000						; 46 seconds
					}
					else {
				returnToLastSavedPosition()
					}
					;  //DEBUG("Is this enough time?")

				
				saveCurrentPosition()
							; move down
					clickMiniMap("Down", 1)
				returnToLastSavedPosition()
					sleep, SleeperTime2
					;  //DEBUG("Is this enough time?")
							; bank
				saveCurrentPosition()
					if stepFind(BANK_CLICK, 1) {
				returnToLastSavedPosition()
						sleep, 4000						; 4 seconds

				saveCurrentPosition()
						if clickInventoryItem(1, 1, "left") {
							if clickIcon(GOLD_BAR_ICON) {
				returnToLastSavedPosition()
								return ExitFunction(true)
							}
						}
				returnToLastSavedPosition()
						
					}
				}
		}
	}


	return ExitFunction(false)	
}



smelt_steel_platebodies_run(){
	
	ICON_SMITH_STEEL_PLATEBODY	:="E:\Documents\2019\OSRS Icons\_RS_SMITH_PLATEBODY_ICON.png"
	CLICK_SMITH_ALL_STEEL_PLATEBODIES	:=	"E:\Documents\2019\OSRS Icons\_RS_SMITH_ALL_STEEL_PLATEBODY.png"
	ICON_STEEL_BAR	:=	"E:\Documents\2019\OSRS Icons\_RS_STEEL_BAR_ICON.png"

	sleepSmith	:= 16000
	sleepWalk	:= 10000

	step		:= 32
	y_offset	:= 12



	saveAndClickSquare(4, 11.75, y_offset, step, 0)					; anvil from bank

	if !clickIcon(ICON_SMITH_STEEL_PLATEBODY, sleepWalk, "right") {
		DEBUG("ICON FAIL")
		return ExitFunction(false)
	}
	if !clickIcon(CLICK_SMITH_ALL_STEEL_PLATEBODIES, 1000) {
		DEBUG("CLICK FAIL")
		return ExitFunction(false)
	}
	
	sleep, %sleepSmith%
	
	saveAndClickSquare(-1.7, -8.0, y_offset, step, 0)			; bank from anvil
	
	if !waitFor_Icon_Silent(ICON_STEEL_BAR, sleepWalk) {
		DEBUG("BANK FAIL")
		return ExitFunction(false)
	}
	clickInventoryItem(1,1)
	sleep, 50
	if !clickIcon(ICON_STEEL_BAR) {
		return ExitFunction(false)
	}

	sleep, 1000		
	return ExitFunction(true)
}


:*:asdf smith::
	InputBox, numloop, number of times to loop, how many times do you want to run this loop?

	Loop, %numloop%
	{
		if !smelt_steel_platebodies_run() {
			break
		}
	}

	MsgBox, Exiting smith loop
Return








stepFind(image, y_offset := 0) {
	
	findRSWindow()	
	step := 40
	h := SCREEN_Y2 - SCREEN_Y1
	add := h / step

	RSGetCenterScreen()
	save_X := Click_X
	save_Y := Click_Y
	save_X -= add
	if (y_offset != 0){
		save_Y := Click_Y + ( y_offset * add )
	}

	RSRightClick_X(save_X, save_Y, 0)

	while !waitFor_Icon_Silent(image, 0) {
		RSClick_X(save_X, save_Y, 100)		
		save_X -= add

		RSRightClick_X(save_X, save_Y, 0)
			; //pause()
	}
	RSClick_X(save_X, save_Y, 100)
	RSClick_X(save_X, save_Y, 0)
	return ExitFunction(true)
}


superheat_steel(){

	inputbox, numLoop, number of loops, how many times to loop?
	if !clickIcon(TAB_MAGIC) {
		DEBUG("failed to find superheat icon")
	}
	Loop, %numLoop%
	{
		Loop, 9
		{
			if !clickIcon(ICON_SUPERHEAT_ITEM, 3000) {
				DEBUG("failed to find superheat icon")
			}
			if !clickInventoryItem(3, 1) {
				DEBUG("Failed to click inventory 3:1")
			}			
		}

		RSGetCenterScreen()
		RSClick_X(Click_X, Click_Y, 0)


		if !clickIcon(ICON_COAL) {

			RSGetCenterScreen()
			RSClick_X(Click_X, Click_Y, 0)
			
			if !clickIcon(ICON_COAL, 3000) {
				DEBUG("failed to find coal icon")
			}
		}
		sleep, 250
		if !clickInventoryItem(1, 1){
			DEBUG("Failed to click inventory 1:1")
		}	
		if !clickIcon(ICON_IRON_ORE, 3000) {
			DEBUG("failed to find iron ore icon")
		}
		if !clickIcon(GE_EXIT_BUTTON) {
			DEBUG("failed to find exit icon")
		}
	}

	DEBUG("Exiting Loop")
}



superheat_iron(){

	inputbox, numLoop, number of loops, how many times to loop?
	if !clickIcon(TAB_MAGIC) {
		DEBUG("failed to find superheat icon")
	}
	Loop, %numLoop%
	{
		Loop, 27
		{
			if !clickIcon(ICON_SUPERHEAT_ITEM, 3000) {
				DEBUG("failed to find superheat icon")
			}
			if !clickInventoryItem(7, 3) {
				DEBUG("Failed to click inventory 7:3")
			}
			searchScreen(TAB_MAGIC)
			mousemove, %Click_X%, %Click_Y%		
		}


		sleep, 250
		RSGetCenterScreen()
		RSClick_X(Click_X, Click_Y, 0)

		sleep, 1000
		if !clickInventoryItem(1, 1){
			DEBUG("Failed to click inventory 1:1")
		}	
		if !clickIcon(ICON_IRON_ORE) {
			DEBUG("failed to find iron ore icon")
		}
		if !clickIcon(GE_EXIT_BUTTON) {
			DEBUG("failed to find exit icon")
		}
	}

	DEBUG("Exiting Loop")
}




























gMapPlayerLoc(){
	
	findRSWindow()
	w := SCREEN_X2 - SCREEN_X1
	h := SCREEN_Y2 - SCREEN_Y1
	Click_X := ( w / 2 ) + SCREEN_X1
	Click_Y := ( h / 2 ) + SCREEN_Y1

	Click_Y -= 90
	Click_X -= 108		; move up 1 step from center

	RSClick(Click_X, Click_Y, 0)
}

miniMapCenter() {
	findRSWindow()

	Click_X := SCREEN_X2 - MM_CENTER_X_OFFSET
	Click_Y := SCREEN_Y1 + MM_CENTER_Y_OFFSET
		
	MINIMAP_X1 := (Click_X - MM_RADIUS - 20)
	MINIMAP_Y1 := (Click_Y - MM_RADIUS - 20)
	MINIMAP_X2 := SCREEN_X2
	MINIMAP_Y2 := (Click_Y + MM_RADIUS + 20)
}
clickMiniMap(direction, offset){
	miniMapCenter()

	waitForLiftKey_AndBlockInput()

		if (offset = 0) {
			OFFSET := 0
		} else {
			OFFSET := MM_RADIUS * offset
		}

		if (direction = "up") {
			Click_Y -= OFFSET
		}
		if (direction = "down") {
			Click_Y += OFFSET
		}
		if (direction = "right") {
			Click_X += OFFSET
		}
		if (direction = "left") {
			Click_X -= OFFSET
		}

		RSClick(Click_X, Click_Y, 0)
	return ExitFunction(true)
}























































+^l::
	RSLogin()
Return
+^v::
	RSSetView()
Return
+^h::
	pause()
Return
+^g::
	inputbox, start, where to begin alching, where do you want to begin? adamant = 4  |  rune = 8  |  dhide = 18
	highAlchEntireSet(start)
Return

:*:asdf alch::
	InputBox, num, num loop, how many do you want to alch?
	highAlch(num, 1500)
Return
:*:asdf collect::
	geCollect(1,2,0,24)
Return
:*:asdf buy::
	replenish_High_Alch_Materials()
Return
:*:asdf set alch::
	setHighAlchItem()
Return

:*:asdf ak::
	InputBox, what, what to smelt, what would you like to smelt? : `ncopper bar - cb or `nsteel bar - sb or `ngold amulet - ga?
	InputBox, numloop, number of smelting loops?, please set the number of smelting loops

	i := 0
	Loop, %numloop%
	{
		i += 1

		sendToRS("   " . i . " / " . numloop)

		if (what = "cb") {
			if !test_smelting_run() {
				msgbox, % "smelting run failed - loop: " . i
				return
			}
		}

		if (what = "sb") {
			if !smelt_steel() {
				msgbox, % "smelting run failed - loop: " . i
				return
			}
		}
		
		else if (what = "ga") {
			if !smelt_gold_amulet_run() {
				msgbox, % "smelting run failed - loop: " . i
				return
			}
		}

		sleep, 250				; quarter of a second
	}
Return


:*:return(::
	send, return ExitFunction()
	send, {Left}
Return
:*:return (::
	send, return ExitFunction()
	send, {Left}
Return

:*:log reload()::
	resetErrorLog()
Return

:*:log debug::
	send Log_Flag("DEBUG:      ")
	send, {Left}
	send, {Left}
Return
:*:log wait::
	send Log_Flag("WAIT:       ")
	send, {Left}
	send, {Left}
Return
:*:log error::
	send Log_Flag("----  ERROR:    ")
	send, {Left}
	send, {Left}
Return
:*:log success::
	send Log_Flag("SUCCESS:    ")
	send, {Left}
	send, {Left}
Return
:*:log exit fail::
	send Log_Flag("*** EXIT_FAILURE:    ")
	send, {Left}
	send, {Left}
Return
:*:log exit success::
	send Log_Flag("*** EXIT_SUCCESS:    ")
	send, {Left}
	send, {Left}
Return




























checkFullMiningInventory(action := "drop") {
		if searchScreen(PROMPT_MINING_FULL) {
			if (action = "drop") {
				;	// helpDEBUG("FULL INVENTORY")
				i := 0
				j := 0
					Loop, 6
					{
						i := i + 1
						j := 0
						Loop, 4
						{
							j := j+1
							dropInventoryItem(i, j)
						}
					}
				return ExitFunction(true)
			}
			else if (action = "save") {
				DEBUG("inventory is FULL!")
			}
		}
		return ExitFunction(false)
}

saveAndClickSquare(pos_x, pos_y, y_offset, step, sleeperTime) {
		saveCurrentPosition()
			RSGetCenterScreen()
			x := Click_X + ( step * pos_x )
			y := Click_Y + y_offset + ( step * pos_y )
			RSClick_X(x, y, 0)
		returnToLastSavedPosition()
		sleep, sleeperTime
}



mine_iron(numloop, extra := "drop") {
	step := 32
	y_offset := 14
	sleeperTime := 2000
	
	toloop := numloop / 4
	Loop, %toloop%
	{
		checkFullMiningInventory(extra)
		saveAndClickSquare(2, 0, y_offset, step, 2500)
		
		checkFullMiningInventory(extra)
		saveAndClickSquare(0, 1, y_offset, step, 1500)

		checkFullMiningInventory(extra)
		saveAndClickSquare(-1, 1, y_offset, step, 2500)

		checkFullMiningInventory(extra)
		saveAndClickSquare(0, -1, y_offset, step, 1500)
	}
	
		DEBUG("exiting loop function")
}


:*:ahk mine iron::
	inputbox, numloop, Mining right down , number of loops?
	mine_iron(numloop, "drop")
Return
+^m::
	mine_iron(28, "save")
Return


:*:asdf mine coal::

	step := 32
	y_offset := 12
	sleeperTime := 10000	; 20 sec

	inputbox, numloop, Mining COAL , number of loops?
	
	toloop := numloop
	slot := 1

	Loop, %toloop%
	{
		checkFullMiningInventory("save")
		saveAndClickSquare(1, -1, y_offset, step, sleeperTime)

		checkFullMiningInventory("save")
		saveAndClickSquare(0, 1, y_offset, step, sleeperTime)
		
		checkFullMiningInventory("save")
		saveAndClickSquare(2, 1, y_offset, step, sleeperTime)
		
		checkFullMiningInventory("save")
		saveAndClickSquare(3, 0, y_offset, step, sleeperTime)
		
		checkFullMiningInventory("save")
		saveAndClickSquare(-1, 2, y_offset, step, sleeperTime)
		
		checkFullMiningInventory("save")
		saveAndClickSquare(-5, -1, y_offset, step, sleeperTime)
	}
	
		DEBUG("exiting loop function")
Return


:*:toggle telegrab::
	if (TOGGLE_TELE_GRAB = false) {
		DEBUG("turning toggle on")
		TOGGLE_TELE_GRAB := true
	}
	else {
		DEBUG("turning toggle off")
		TOGGLE_TELE_GRAB := false
	}
Return

activate_telegrab() {
		if !searchScreen(SPELL_TELE_GRAB) {
			if !searchScreen(SPELL_TELE_GRAB_2) {
				clickIcon(TAB_MAGIC)
				if !searchScreen(SPELL_TELE_GRAB) {
					clickIcon(SPELL_TELE_GRAB_2)
				} else {
					clickIcon(SPELL_TELE_GRAB)
				}
			} else {	
				clickIcon(SPELL_TELE_GRAB_2)
			}

		} else {
			clickIcon(SPELL_TELE_GRAB, 0)
		}
	return true
}


:*:asdf winegrab::

	RSGetCenterScreen()

	sleeperTime := 27300

	while true {
		waitForLiftKey_AndBlockInput()
			saveCurrentPosition()
				activate_telegrab()
			returnToLastSavedPosition()

			
				saveAndClickSquare(-1.3, -0.94, 0, 200, 0)
				; //pause()

				;// if waitFor_Icon_Silent(ITEM_ZAMORAK_WINE_JUG, 30000) {		; spawns every 27 ish seconds i think
				;//											; saves current position before clicking
				;//	saveCurrentPosition()
				;//	RSClick_X(Click_X, Click_Y, 0)
				;// }
				if !checkInventorySlot(6,3, CLICK_EMPTY) {
					break
				}
			returnToLastSavedPosition()
		BlockInput Off

		sleep, sleeperTime
	}
	returnToLastSavedPosition()
	BlockInput Off
	DEBUG("wine slot is full")
Return

$TAB::
	if (TOGGLE_TELE_GRAB = true){
		waitForLiftKey_AndBlockInput()
			saveCurrentPosition()
				activate_telegrab()
			returnToLastSavedPosition()
		BlockInput Off
	}
	else {
		send, {TAB}
	}
Return








:*:asdf superheat steel::
	superheat_steel()
Return

:*:asdf superheat iron::
	superheat_iron()
Return
































^$ESC::
	ESCAPE_SEQUENCE := true
	Log_Flag("****************************  ESCAPE_SEQUENCE ACTIVATED")
	msgbox, % "Escape: " . ESCAPE_SEQUENCE
Return
+^ESC::
	ESCAPE_SEQUENCE := false
	Log_Flag("****************************  ESCAPE_SEQUENCE RELEASED")
	msgbox, % "Escape: " . ESCAPE_SEQUENCE
Return

^+i::
	if ( TOGGLE_MONITOR_LOOPS = false ){
		TOGGLE_MONITOR_LOOPS := true
		vTickCount1 := A_TickCount
		SetTimer, WatchLoop
	} else {
		TOGGLE_MONITOR_LOOPS := false
		SetTimer, WatchLoop, Off
		ToolTip							; disable tooltip
	}
Return
WatchLoop:
	ToolTip, CurrentLoop : %CURRENT_LOOP% / %TOTAL_LOOPS%   -   Buy Count: %BUY_COUNT%
Return


searchTest(fileName, x := -1, y := -1, x2 := -1, y2 := -1) {

	if searchScreen(fileName, x, y, x2, y2) {
		MsgBox, Found!
	} else {
		MsgBox, Not Found...
	}

	MouseMove, %Click_X%, %Click_Y%
}



+^t::
	RSGetCenterScreen()

	if (PERSISTENCE_TOGGLE = false){
		PERSISTENCE_TOGGLE := true
		#Persistent
		CoordMode Mouse, Screen 
		SetTimer, WatchCursorStep, 100
	} else {
		PERSISTENCE_TOGGLE := true
		SetTimer, WatchCursorStep, Off
		tooltip								; disable tooltip
	}
Return
WatchCursorStep:
	step := 32
	y_offset := 12
	MouseGetPos, X, Y 
	v_x := (X - Click_X) / step
	v_y := (Y - (Click_Y + y_offset)) / step
	ToolTip, %v_x% %v_y%
Return









































;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------


; Kon's File Get Properties Script






/*  FGP_Init()
 *		Gets an object containing all of the property numbers that have corresponding names. 
 *		Used to initialize the other functions.
 *	Returns
 *		An object with the following format:
 *			PropTable.Name["PropName"]	:= PropNum
 *			PropTable.Num[PropNum]		:= "PropName"
 */
FGP_Init() {
	static PropTable
	if (!PropTable) {
		PropTable := {Name: {}, Num: {}}, Gap := 0
		oShell := ComObjCreate("Shell.Application")
		oFolder := oShell.NameSpace(0)
		while (Gap < 11)
			if (PropName := oFolder.GetDetailsOf(0, A_Index - 1)) {
				PropTable.Name[PropName] := A_Index - 1
				PropTable.Num[A_Index - 1] := PropName
				Gap := 0
			}
			else
				Gap++
	}
	return PropTable
}


/*  FGP_List(FilePath)
 *		Gets all of a file's non-blank properties.
 *	Parameters
 *		FilePath	- The full path of a file.
 *	Returns
 *		An object with the following format:
 *			PropList.CSV				:= "PropNum,PropName,PropVal`r`n..."
 *			PropList.Name["PropName"]	:= PropVal
 *			PropList.Num[PropNum]		:= PropVal
 */
FGP_List(FilePath) {
	static PropTable := FGP_Init()
	SplitPath, FilePath, FileName, DirPath
	oShell := ComObjCreate("Shell.Application")
	oFolder := oShell.NameSpace(DirPath)
	oFolderItem := oFolder.ParseName(FileName)
	PropList := {CSV: "", Name: {}, Num: {}}
	for PropNum, PropName in PropTable.Num
		if (PropVal := oFolder.GetDetailsOf(oFolderItem, PropNum)) {
			PropList.Num[PropNum] := PropVal
			PropList.Name[PropName] := PropVal
			PropList.CSV .= PropNum "," PropName "," PropVal "`r`n"
		}
	PropList.CSV := RTrim(PropList.CSV, "`r`n")
	return PropList
}


/*  FGP_Name(PropNum)
 *		Gets a property name based on the property number.
 *	Parameters
 *		PropNum		- The property number.
 *	Returns
 *		If succesful the file property name is returned. Otherwise:
 *		-1			- The property number does not have an associated name.
 */
FGP_Name(PropNum) {
	static PropTable := FGP_Init()
	if (PropTable.Num[PropNum] != "")
		return PropTable.Num[PropNum]
	return -1
}


/*  FGP_Num(PropName)
 *		Gets a property number based on the property name.
 *	Parameters
 *		PropName	- The property name.
 *	Returns
 *		If succesful the file property number is returned. Otherwise:
 *		-1			- The property name does not have an associated number.
 */
FGP_Num(PropName) {
	static PropTable := FGP_Init()
	if (PropTable.Name[PropName] != "")
		return PropTable.Name[PropName]
	return -1
}


/*  FGP_Value(FilePath, Property)
 *		Gets a file property value.
 *	Parameters
 *		FilePath	- The full path of a file.
 *		Property	- Either the name or number of a property.
 *	Returns
 *		If succesful the file property value is returned. Otherwise:
 *		0			- The property is blank.
 *		-1			- The property name or number is not valid.
 */
FGP_Value(FilePath, Property) {
	static PropTable := FGP_Init()
	if ((PropNum := PropTable.Name[Property] != "" ? PropTable.Name[Property]
	: PropTable.Num[Property] ? Property : "") != "") {
		SplitPath, FilePath, FileName, DirPath
		oShell := ComObjCreate("Shell.Application")
		oFolder := oShell.NameSpace(DirPath)
		oFolderItem := oFolder.ParseName(FileName)
		if (PropVal := oFolder.GetDetailsOf(oFolderItem, PropNum))
			return PropVal
		return 0
	}
	return -1
}