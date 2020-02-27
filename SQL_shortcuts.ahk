#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force



        :*:create ::CREATE{Space}
         :*:alter ::ALTER{Space}
          :*:drop ::DROP{Space}
           :*:add ::ADD{Space}

        :*:select ::SELECT{Space}
          :*:from ::FROM{Space}
        :*:concat(::CONCAT(

   :*:insert into ::INSERT INTO{Space}
        :*:values ::VALUES{Space}

         :*:table ::TABLE{Space}
        :*:column ::COLUMN{Space}

    :*:primary key::PRIMARY KEY 
    :*:foreign key::FOREIGN KEY
     :*:constraint::CONSTRAINT 
     :*:references::REFERENCES 
 :*:auto_increment::AUTO_INCREMENT
 :*:auto increment::AUTO_INCREMENT

          :*:join ::JOIN{Space}
          :*:left ::LEFT{Space}
         :*:right ::RIGHT{Space}
         :*:inner ::INNER{Space}
         :*:outer ::OUTER{Space}
          :*:full ::FULL{Space}
      :*:distinct ::DISTINCT{Space}

        :*:exists ::EXISTS{Space}
            :*:if ::IF{Space}
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
         :*:order ::ORDER{Space}
         :*:group ::GROUP{Space}
            :*:by ::BY{Space}

          :*:null ::NULL{Space}
       :*:default ::DEFAULT{Space}
             :*:vc::VARCHAR
        :*:varchar::VARCHAR
           :*:char::CHAR
           :*:int ::INT{Space}
      :*:smallint ::SMALLINT{Space}
       :*:longint ::LONGINT{Space}
          :*:date ::DATE{Space}

;aggregate functions

          :*:avg(::AVG(     ;'average'  : AVG(table.attribute) returns the average of the tables attribute
        :*:count(::COUNT(   ;'count'    : COUNT(table.attribute) number of times that attribute appears IN the table
          :*:max(::MAX(
          :*:min(::MIN(
          :*:sum(::SUM(
        :*:ucase(::UCASE(   ;'upper case'
        :*:lcase(::LCASE(   ;'loser case'
          


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