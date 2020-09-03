#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force


ToolTipFM(Text="", WhichToolTip=16, xOffset=16, yOffset=16) { ; ToolTip which Follows the Mouse
  static LastText, hwnd, VirtualScreenWidth, VirtualScreenHeight ; http://www.autohotkey.com/forum/post-430240.html#430240

  if (VirtualScreenWidth = "" or VirtualScreenHeight = "")
  {
    SysGet, VirtualScreenWidth, 78
    SysGet, VirtualScreenHeight, 79
  }

  if (Text = "") ; destroy tooltip
  {
    ToolTip,,,, % WhichToolTip
    LastText := "", hwnd := ""
    return
  }
  else  ; move or recreate tooltip
  {
    CoordMode, Mouse, Screen
    MouseGetPos, x,y
    x += xOffset, y += yOffset
    WinGetPos,,,w,h, ahk_id %hwnd%

      ; if necessary, adjust Tooltip position
    if ((x+w) > VirtualScreenWidth)
      AdjustX := 1
    if ((y+h) > VirtualScreenHeight)
      AdjustY := 1

    if (AdjustX and AdjustY)
      x := x - xOffset*2 - w, y := y - yOffset*2 - h
    else if AdjustX
      x := VirtualScreenWidth - w
    else if AdjustY
      y := VirtualScreenHeight - h

    if (Text = LastText)  ; move tooltip
      DllCall("MoveWindow", A_PtrSize ? "UPTR" : "UInt",hwnd,"Int",x,"Int",y,"Int",w,"Int",h,"Int",0)
    else ; recreate tooltip
    {
        ; Perfect solution would be to update tooltip text (TTM_UPDATETIPTEXT), but must be compatible with all versions of AHK_L and AHK Basic.
        ; My Ask For Help link: http://www.autohotkey.com/forum/post-421841.html#421841
      CoordMode, ToolTip, Screen
      ToolTip,,,, % WhichToolTip ; destroy old
      ToolTip, % Text, x, y, % WhichToolTip ; show new
      hwnd := WinExist("ahk_class tooltips_class32 ahk_pid " DllCall("GetCurrentProcessId")), LastText := Text
      %A_ThisFunc%(Text, WhichToolTip, xOffset, yOffset) ; move new
    }

    Winset, AlwaysOnTop, on, ahk_id %hwnd%
  }
}


loop {
     ToolTipFM("discord.ahk")
     sleep, 20
     ; ToolTip("")
}


;$!q::
;  exitApp
;return