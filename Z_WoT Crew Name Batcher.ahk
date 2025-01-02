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
IniRead, T92, Z_WoT Crew Name Batcher Settings.ini, save, names
FilePaths := ""
Loop, %0%
{
    FilePaths .= %A_Index% " "
}
60TP := Trim(FilePaths)
IfNotInString, 60TP, .mo
{
	MsgBox, 4112, WoT Crew Name Batcher, Not a .mo file.`nClosing script.
	return
}
SplitPath, 60TP, SP_FN, SP_OD, SP_EX
FileCreateDir, output_1
tempfiletarget := SP_OD . "\output_1\" . SP_FN
ConvertMOPO("D:\Program Files (x86)\gettext-iconv\bin", "mo2po", 60TP, tempfiletarget) ; Edit this path if you need.
Loop
{
	IfExist, %tempfiletarget%
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
60TP := tempfiletarget
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
FileCreateDir, output_2
FileCreateDir, output_3
FV4005 := SP_OD . "\output_2\" . SP_FN
FileAppend, %GRILLE15%, %FV4005%, UTF-8-RAW
Loop
{
	IfExist, %FV4005%
		break
}
TIGER:= SP_OD . "\output_3\" . SP_FN
ConvertMOPO("D:\Program Files (x86)\gettext-iconv\bin", "po2mo", FV4005, TIGER)
MsgBox, 4160, WoT Crew Name Batcher, Target File: %SP_FN%`n`nProcess Done!`nTake the new .po file from 'output_3' folder!`n`nYou can run the next file after this alert is closed., 5
ExitApp

ConvertMOPO(gettext_dir, ConversionType, SourceFile, OutputFile)
{
	msgfmtPath := gettext_dir . "\msgfmt.exe"
	msgunfmtPath := gettext_dir . "\msgunfmt.exe"
	if (ConversionType = "po2mo") {
		RunWait, %msgfmtPath% -o "%OutputFile%" "%SourceFile%"
	} else if (ConversionType = "mo2po") {
		RunWait, %msgunfmtPath% -o "%OutputFile%" "%SourceFile%"
	}
}