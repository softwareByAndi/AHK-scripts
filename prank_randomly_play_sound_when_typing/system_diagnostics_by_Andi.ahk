; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
#InstallKeybdHook
#InstallMouseHook


count := 0
startup := 1
backspace_count := 0

playSound(file_name) {
    ; sound from InspectorJ @ https://freesound.org/people/InspectorJ/sounds/415209/
    audio_path := "E:\Documents\GitHub\AHK\prank_randomly_play_sound_when_typing\sound_files\original_recordings"
    extension := ".mp3"
    file_path := audio_path file_name extension
    MsgBox, %file_path%
    SoundPlay, %file_path%, wait
}

playCount(c) {
    if c && (Mod(c, 2000) == 0) ; 2000
    {
        playSound("you_little_bitch")
    }
    else if c && (Mod(c, 6500) == 0) ; 6500
    {
        playSound("love_you")
    }
    else if c && (Mod(c, 10500) == 0) ; 10500
    {
        playSound("ahhh")
        return 0
    }
    return c
}

playBackspace(b) {
    if b && (Mod(b, 300) == 0) ;300
    {
        playSound("do_better")
        return 0
    }
    return b
}

~1::
~2::
~3::
~4::
~5::
~6::
~7::
~8::
~9::
~0::


~a::
~b::
~c::
~d::
~e::
~f::
~g::
~h::
~i::
~j::
~k::
~l::
~m::
~n::
~o::
~p::
~q::
~r::
~s::
~t::
~u::
~v::
~w::
~x::
~y::
~z::

~!a::
~!b::
~!c::
~!d::
~!e::
~!f::
~!g::
~!h::
~!i::
~!j::
~!k::
~!l::
~!m::
~!n::
~!o::
~!p::
~!q::
~!r::
~!s::
~!t::
~!u::
~!v::
~!w::
~!x::
~!y::
~!z::


~+a::
~+b::
~+c::
~+d::
~+e::
~+f::
~+g::
~+h::
~+i::
~+j::
~+k::
~+l::
~+m::
~+n::
~+o::
~+p::
~+q::
~+r::
~+s::
~+t::
~+u::
~+v::
~+w::
~+x::
~+y::
~+z::


~^a::
~^b::
~^c::
~^d::
~^e::
~^f::
~^g::
~^h::
~^i::
~^j::
~^k::
~^l::
~^m::
~^n::
~^o::
~^p::
~^q::
~^r::
~^s::
~^t::
~^u::
~^v::
~^w::
~^x::
~^y::
~^z::


~+!a::
~+!b::
~+!c::
~+!d::
~+!e::
~+!f::
~+!g::
~+!h::
~+!i::
~+!j::
~+!k::
~+!l::
~+!m::
~+!n::
~+!o::
~+!p::
~+!q::
~+!r::
~+!s::
~+!t::
~+!u::
~+!v::
~+!w::
~+!x::
~+!y::
~+!z::


~+^a::
~+^b::
~+^c::
~+^d::
~+^e::
~+^f::
~+^g::
~+^h::
~+^i::
~+^j::
~+^k::
~+^l::
~+^m::
~+^n::
~+^o::
~+^p::
~+^q::
~+^r::
~+^s::
~+^t::
~+^u::
~+^v::
~+^w::
~+^x::
~+^y::
~+^z::


~^!a::
~^!b::
~^!c::
~^!d::
~^!e::
~^!f::
~^!g::
~^!h::
~^!i::
~^!j::
~^!k::
~^!l::
~^!m::
~^!n::
~^!o::
~^!p::
~^!q::
~^!r::
~^!s::
~^!t::
~^!u::
~^!v::
~^!w::
~^!x::
~^!y::
~^!z::


~+^!a::
~+^!b::
~+^!c::
~+^!d::
~+^!e::
~+^!f::
~+^!g::
~+^!h::
~+^!i::
~+^!j::
~+^!k::
~+^!l::
~+^!m::
~+^!n::
~+^!o::
~+^!p::
~+^!q::
~+^!r::
~+^!s::
~+^!t::
~+^!u::
~+^!v::
~+^!w::
~+^!x::
~+^!y::
~+^!z::

~LButton::
~RButton::
~MButton::
~XButton1::
~XButton2::

~Shift::
~Control::
~Alt::
    count := count + 1
    if (startup = 1) && (count > 30)
    {
        startup := 0
        playSound("love_you.wav")
    }
    else {
        count := playCount(count)
    }
    return

~Backspace::
    backspace_count := backspace_count + 1
    backspace_count := playBackspace(backspace_count)
    return

~Home::
    MsgBox % startup count
    return

