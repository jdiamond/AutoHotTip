#Persistent

SecondsBetweenTips := 300
DefaultTitle := "Tip"
NotifyCommand := """" . A_ScriptDir . "\growlnotify.exe"" /a:AutoHotTip /r:Tip /n:Tip ""/i:{Icon}"" ""/t:{Title}"" ""{Tip}"""
IconPath := A_ScriptDir . "\ktip_1453_32.png"

Menu Tray, Icon, %A_ScriptDir%\ktip_1453_32.ico, , 1

TipFileCount := 0

Loop %A_ScriptDir%\*.tips
{
    TipFileCount += 1
    TipCount := 0
    TipFile%TipFileCount%Pattern := ""

    Loop Read, %A_LoopFileFullPath%
    {
        If (TipFile%TipFileCount%Pattern = "")
        {
            TipFile%TipFileCount%Pattern := A_LoopReadLine
        }
        Else
        {
            Tip := RegExReplace(A_LoopReadLine, "^\s*|\s*$", "")

            If (Tip != "")
            {
                TipCount += 1
                TipFile%TipFileCount%TipCount := TipCount
                TipFile%TipFileCount%Tip%TipCount% := Tip
            }
        }
    }
}

SetTitleMatchMode 2

Loop
{
    Loop %TipFileCount%
    {
        CurrentPattern := TipFile%A_Index%Pattern

        If (WinActive(CurrentPattern))
        {
            Title := DefaultTitle

            Random N, 1, TipFile%A_Index%TipCount
            Tip := TipFile%A_Index%Tip%N%

            RegExMatch(Tip, "^\s*(.+)\s+::\s+(.+)$", Match)

            If (Match != "")
            {
                Title := Match1
                Tip := Match2
            }

            Command := NotifyCommand
            Command := RegExReplace(Command, "\{Title\}", Title)
            Command := RegExReplace(Command, "\{Tip\}", Tip)
            Command := RegExReplace(Command, "\{Icon\}", IconPath)

            Run %Command%

            Sleep (SecondsBetweenTips * 1000)
        }
    }

    Sleep 1000
}

Return
