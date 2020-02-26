#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



         :*:create::CREATE
          :*:alter::ALTER
           :*:drop::DROP
            :*:add::ADD

         :*:select::SELECT
           :*:from::FROM

    :*:insert into::INSERT INTO 
         :*:values::VALUES

          :*:table::TABLE 
         :*:column::COLUMN 

    :*:primary key::PRIMARY KEY 
       :*:eign key::EIGN KEY ; FOR translates the first part
     :*:constraint::CONSTRAINT 
     :*:references::REFERENCES 
            :*:as ::AS{Space}
           :*:and ::AND{Space}
            :*:or ::OR{Space}
           :*:not ::NOT{Space}
            :*:in ::IN{Space}
          :*:like ::LIKE{Space}
           :*:for ::FOR{Space}
         :*:where ::WHERE{Space}
       :*:between ::BETWEEN{Space}
         :*:check ::CHECK{Space}

           :*:null::NULL
        :*:default::DEFAULT
             :*:vc::VARCHAR
           :*:char::CHAR
       :*:smallint::SMALLINT
        :*:longint::LONGINT
           :*:date::DATE




:*:""::""{Left}
:*:''::''{Left}
:*:()::(){Left}
:*:{}::{}{Left}

!q::
	;msgbox, exiting SQL_shortcuts.ahk
    exitApp
return
:*:ahk_disable(sqlShortcuts)::
    run E:\Documents\GitHub\AHK\SQL_shortcuts.ahk
return