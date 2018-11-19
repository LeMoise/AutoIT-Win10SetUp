#RequireAdmin
#include <FileConstants.au3>

AutoItSetOption('MouseCoordMode', 0)
Opt("WinSearchChildren", 1)
;Copies folders from the USB and places them in the C: Drive where they need to go.
;DirCopy(@ScriptDir & "BE Apps", "C:\Program Files\ITALYCS 5\",$FC_OVERWRITE )
;DirCopy(@ScriptDir & "Brampton", "C:\Brampton\",$FC_OVERWRITE )


;Run("MsiExec.exe /i """ & @ScriptDir & "\Dameware\Dameware.MSI""  /norestart")
;WinWait("DameWare Mini Remote Control Service Setup")
;WinActivate("DameWare Mini Remote Control Service Setup")
;MouseClick("Primary" , 351, 361 , 1 , 0)
;MouseClick("Primary" , 351, 361 , 1 , 0)
;WinWait("DameWare Mini Remote Control Service Setup", "Finish")
;MouseClick("Primary" , 351, 361 , 1 , 0)

Run(@ScriptDir & "\RSLinx3.9\RSLinxDVD\Setup.exe")
WinWait("Rockwell Automation Installer")
WinActivate("Rockwell Automation Installer")
MouseClick("Primary", 172,255, 1, 0)
WinWait("End-User License Agreements")
WinActivate("End-User License Agreements")
MouseClick("Primary", 323,582, 1, 0)
Sleep(800000)
WinWait("Rockwell Automation Installer")
WinActivate("Rockwell Automation Installer")
MouseClick("Primary", 22,202, 1, 0)
MouseClick("Primary", 310,532, 1, 0)
MouseClick("Primary", 290,532, 1, 0)