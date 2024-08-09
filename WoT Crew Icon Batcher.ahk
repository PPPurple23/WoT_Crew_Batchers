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
C = china,czech,france,germany,italy,japan,poland,sweden,uk,usa,ussr
N = 0
J = 1
Loop, *.png, 0, 0
{
	N++
	N_%A_Index%_IMG := A_LoopFileName
}
Loop, %N%
{
	Loop, Parse, C, `,
	{
		if (C = "")
		{
			break
		}
		Loop, 100
		{
			XM = %A_LoopField%-%A_Index%.png ; china-1.png
			XF = %A_LoopField%-female-%A_Index%.png ; china-female-1.png
			T := N_%J%_IMG ; 1.png
			FileCopy, %T%, %XM%, 1
			FileCopy, %T%, %XF%, 1
			FileCopy, %T%, %A_Index%_.png, 1 ; 1_.png
			ToolTip, %XM%`n%XF%`n%A_Index%_.png`n`n%C%
			J++
			if (J > N)
			{
				J = 1
			}
		}
		J = 1
	}
	break
}
ExitApp

1::
ExitApp
