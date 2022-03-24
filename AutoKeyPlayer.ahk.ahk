Gui, Add, Text,, ------------------------------------------Key Delay-----------------------------------------
Gui, Add, Edit, w300 vKeyDelay, 100
Gui, Add, Text,, ----------------------------------------Piano Music-----------------------------------------
Gui, Add, Edit, R10 w300 vPianoMusic
Gui, Add, Text,, 								  F4 To Play Piano Music
Gui, Add, Text,, 								Press F8 To Suspend/Resume
Gui, Add, Text,, 								  Edited by WalkerOnly
Gui, Show
F4::
!F4::
Gui, Submit, Nohide
PianoMusic := RegExReplace(PianoMusic, "`n|`r|/") ; Remove Stuff
X := 1
while (X:=RegExMatch(PianoMusic, "U)(\[.*]|.)",Keys, X))
{	
	X+=StrLen(Keys)
	Keys := Trim(Keys, "[]")
	SendInput % Keys
	Sleep, %KeyDelay%
}
return

f8::

Pause

Suspend

return

GuiClose:
	ExitApp