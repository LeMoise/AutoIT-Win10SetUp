#RequireAdmin
#include <FileConstants.au3>

AutoItSetOption('MouseCoordMode', 0)
Opt("WinSearchChildren", 1)


;Copies folders from the USB and places them in the C: Drive where they need to go.
DirCopy(@ScriptDir & "BE Apps", "C:\Program Files\ITALYCS 5\",$FC_OVERWRITE )
DirCopy(@ScriptDir & "Brampton", "C:\Brampton\",$FC_OVERWRITE )

;Installs Dameware via its MSI
Run("MsiExec.exe /i """ & @ScriptDir & "\Dameware\Dameware.MSI""  /norestart")
WinWait("DameWare Mini Remote Control Service Setup")
WinActivate("DameWare Mini Remote Control Service Setup")
MouseClick("Primary" , 351, 361 , 1 , 0)
MouseClick("Primary" , 351, 361 , 1 , 0)
WinWait("DameWare Mini Remote Control Service Setup", "Finish")
MouseClick("Primary" , 351, 361 , 1 , 0)

;Installs UPDD driver for touch screen
Run(@ScriptDir & "\UPDD\setup.exe")
WinWait("Install", "hbInstall")
WinActivate("Install""hbInstall")
MouseClick("Primary", 417,333, 1, 0) ;Clicks Install
WinWait("Install", "hbInstall")
WinActivate("Install""hbInstall")
MouseClick("Primary", 507,333, 1, 0) ;Closes installer when done

;Installs RSLink 3.9
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


;Install and go through setup of SQLServer 2016
Run(@ScriptDir & "\SQLServer2016\SQLSetUp.exe") ;Run installer
Sleep(1000) ;Sleep 1000 miliseconds for window to appear
WinWait("SQL Server Installer") ;Waits for a Window with that title
WinActivate("SQL Server Installer") ;Activates the Window
MouseClick("Primary",418,368, 1, 0) ;Clicks 'Custom'
Sleep(1000) ;Sleeps program from 1000 miliseconds
MouseClick("Primary",731,617, 1, 0) ;Clicks 'Install'
WinWait("SQL Server Installation Center","Installation") ;Waits for this Window to open, checks for the 'Installation' keyword to verify
WinActivate("SQL Server Installation Center","Installation") ;Activates the above Window
MouseClick("Primary", 415,53, 1, 0) ;Clicks 'New SQL Server' option for installation
WinWait("SQL Server 2016 Setup") ;Waits for this sub Window to appear
WinActivate("SQL Server 2016 Setup") ;Activates it
;License Page
MouseClick("Primary", 229,464, 1, 0) ;Click 'Accept' checkbox
MouseClick("Primary", 661,582, 1, 0) ;Click 'Next'

;Feature selection. We need to scroll down and click LocalDB
MouseClickDrag("Primary", 510,180, 510,260)
