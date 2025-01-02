FileEncoding, UTF-8
#SingleInstance, Force
#KeyHistory, 0
#NoEnv
CoordMode, Mouse, Screen
ListLines, Off
Process, Priority, , High
SetDefaultMouseSpeed, 0
SetControlDelay, -1
SetBatchLines, -1
SetMouseDelay, -1
SetKeyDelay, -1
SetWinDelay, -1
#MaxThreads 255
#MaxThreadsPerHotkey 255
#MaxHotkeysPerInterval 2147483647
IniRead, T92, WoT Crew Name Batcher Settings.ini, save, names
Loop, %0%
{
    60TP := %A_Index%
    break
}
M53M55 = 0
Loop, Parse, T92, `,
{
	M53M55++
}
GRILLE15=
SUPERCONQUEROR = msgid "names/
M40M43 = 1
IfInString, 60TP, -ezgif.com-mo-to-po-converter.po
{
	StringReplace, FV4005, 60TP, -ezgif.com-mo-to-po-converter.po, .po, All
}
Loop
{
	FileReadLine, TT130M, %60TP%, %A_Index%
	if (ErrorLevel = 1)
	{
		break
	}
	if (IS7 = 1)
	{
		Loop, Parse, T92, `,
		{
			if (A_Index = M40M43)
			{
				VZ55 := A_LoopField
			}
		}
		GRILLE15 = %GRILLE15%`rmsgstr "
		GRILLE15 = %GRILLE15%%VZ55%"
		IS7=
		M40M43++
		if (M40M43 > M53M55)
		{
			M40M43 = 1
		}
	}
	else
	{
		if (A_Index = 1)
		{
			GRILLE15 = %TT130M%
		}
		else
		{
			GRILLE15 = %GRILLE15%`r%TT130M%
		}
	}
	IfInString, TT130M, %SUPERCONQUEROR%
	{
		IS7 = 1
	}
}
FileAppend, %GRILLE15%, %FV4005%, UTF-8-RAW
ExitApp
