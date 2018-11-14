#RequireAdmin
#include <FileConstants.au3>

AutoItSetOption('MouseCoordMode', 0)
Opt("WinSearchChildren", 1)
;Copies folders from the USB and places them in the C: Drive where they need to go.
;DirCopy(@ScriptDir & "BE Apps", "C:\Program Files\ITALYCS 5\",$FC_OVERWRITE )
;DirCopy(@ScriptDir & "Brampton", "C:\Brampton\",$FC_OVERWRITE )

;Installs DameWare
;RunWait("MsiExec.exe /i """ & @ScriptDir & "\Dameware\Dameware.MSI"" /qn+ /norestart")
;WinWait("DameWare Mini Remote Control Service", "OK")
;WinActivate("DameWare Mini Remote Control Service", "OK")
;MouseClick("Primary" , 158, 119 , 1 , 0)


Run("MsiExec.exe /i """ & @ScriptDir & "\Dameware\Dameware.MSI""  /norestart")
WinWait("DameWare Mini Remote Control Service Setup")
WinActivate("DameWare Mini Remote Control Service Setup")
MouseClick("Primary" , 351, 361 , 1 , 0)
MouseClick("Primary" , 351, 361 , 1 , 0)
WinWait("DameWare Mini Remote Control Service Setup", "Finish")
MouseClick("Primary" , 351, 361 , 1 , 0)