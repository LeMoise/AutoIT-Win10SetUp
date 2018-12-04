#RequireAdmin
#include <FileConstants.au3>

AutoItSetOption('MouseCoordMode', 0)
Opt("WinSearchChildren", 1)


;---------- Copy Folders to PC and create Italycs 5 desktop ----------
#CS
DirCopy(@ScriptDir & "BE Apps", "C:\Program Files\ITALYCS 5\",$FC_OVERWRITE )
DirCopy(@ScriptDir & "Brampton", "C:\Brampton\",$FC_OVERWRITE )
FileCreateShortcut("C:\Program Files\ITALYCS 5\BEMenu", @DesktopDir&"\Italycs 5")
#CE
;----------------------- End Dir Copy --------------------------------


;---------- Installs Dameware via its MSI ----------
#CS
Run("MsiExec.exe /i """ & @ScriptDir & "\Dameware\Dameware.MSI""  /norestart")
WinWait("DameWare Mini Remote Control Service Setup")
WinActivate("DameWare Mini Remote Control Service Setup")
MouseClick("Primary" , 351, 361 , 1 , 5)
MouseClick("Primary" , 351, 361 , 1 , 5)
WinWait("DameWare Mini Remote Control Service Setup", "Finish")
MouseClick("Primary" , 351, 361 , 1 , 5)
#CE
;---------- End Dameware Install -------------------


;---------- Installs UPDD driver for touch screen ----------
#CS
Run(@ScriptDir & "\UPDD\setup.exe")
WinWait("Install", "hbInstall")
WinActivate("Install""hbInstall")
MouseClick("Primary", 417,333, 1, 5) ;Clicks Install
WinWait("Install", "hbInstall")
WinActivate("Install""hbInstall")
MouseClick("Primary", 507,333, 1, 5) ;Closes installer when done
#CE
;---------- End UPDD Install -------------------------------


;---------- Installs RSLink 3.9 ----------
#CS
Run(@ScriptDir & "\RSLinx3.9\RSLinxDVD\Setup.exe")
Sleep(5000)
WinWait("Rockwell Automation Installer")
WinActivate("Rockwell Automation Installer")
MouseClick("Primary", 172,255, 1, 5)
WinWait("End-User License Agreements")
WinActivate("End-User License Agreements")
MouseClick("Primary", 323,582, 1, 5)
Sleep(800000)
WinWait("Rockwell Automation Installer")
WinActivate("Rockwell Automation Installer")
MouseClick("Primary", 22,202, 1, 5)
MouseClick("Primary", 310,532, 1, 5)
MouseClick("Primary", 290,532, 1, 5)
#CE
;---------- End RSLinx Install -----------


;--------- Install and go through setup of SQLServer 2016 ----------
#CS
Run(@ScriptDir & "\SQLServer2016\SQLSetUp.exe") ;Run installer
Sleep(1000) ;Sleep 1000 miliseconds for window to appear
WinWait("SQL Server Installer") ;Waits for a Window with that title
WinActivate("SQL Server Installer") ;Activates the Window
MouseClick("Primary",418,368, 1, 5) ;Clicks 'Custom'
Sleep(1000) ;Sleeps program from 1000 miliseconds
MouseClick("Primary",731,617, 1, 5) ;Clicks 'Install'
WinWait("SQL Server Installation Center","Installation") ;Waits for this Window to open, checks for the 'Installation' keyword to verify
WinActivate("SQL Server Installation Center","Installation") ;Activates the above Window
MouseClick("Primary", 415,53, 1, 5) ;Clicks 'New SQL Server' option for installation
WinWait("SQL Server 2016 Setup") ;Waits for this sub Window to appear
WinActivate("SQL Server 2016 Setup") ;Activates it

;License Page
MouseClick("Primary", 229,464, 1, 5) ;Click 'Accept' checkbox
MouseClick("Primary", 661,582, 1, 5) ;Click 'Next'

;Microsoft update
WinWait("SQL Server 2016 Setup", "Microsoft Update")
WinActivate("SQL Server 2016 Setup", "Microsoft Update")
MouseClick("Primary", 249,207, 1, 5) ;Click CheckBox
MouseClick("Primary", 660,580, 1, 5) ;Click Next

;Install Rules
WinWait("SQL Server 2016 Setup", "Install Rules")
WinActivate("SQL Server 2016 Setup", "Install Rules")
MouseClick("Primary", 660,580, 1, 5) ;Click Next

;Feature selection. We need to scroll down, click LocalDB and change the Instance Root Directory
WinWait("SQL Server 2016 Setup", "Feature Selection")
WinActivate("SQL Server 2016 Setup", "Feature Selection")
MouseClickDrag("Primary", 510,180, 510,260)
MouseClick("Primary", 252,343, 1, 5)
MouseClick("Primary", 500,465, 1, 5)
Send("^a")
send("{Del}")
Send("C:\Brampton\SQL")
MouseClick("Primary", 660,580, 1, 5)

;Instance Config Page
WinActivate("SQL Server 2016 Setup", "Instance Configuration")
MouseClick("Primary", 660,580, 1, 5)

;Server Config
WinActivate("SQL Server 2016 Setup", "Server Configuration")
MouseClick("Primary", 772,312, 1, 5)
MouseClick("Primary", 725,330, 1, 5)
MouseClick("Primary", 660,580, 1, 5)

;DB Configuration
WinActivate("SQL Server 2016 Setup", "Database Engine Configuration")
MouseClick("Primary", 390,140, 1, 5)
MouseClick("Primary", 540,235, 1, 5)
Send("^a")
send("{Del}")
Send("C:\Brampton\SQL")
MouseClick("Primary", 540,265, 1, 5)
Send("^a")
send("{Del}")
Send("C:\Brampton\SQL")
MouseClick("Primary", 660,580, 1, 5)

;Reporting Services Configuration
WinActivate("SQL Server 2016 Setup", "Reporting Services Configuration")
MouseClick("Primary", 250,230, 1, 5)
MouseClick("Primary", 660,580, 1, 5)

;Consent to Install Microsoft R open
WinActivate("SQL Server 2016 Setup", "Consent to install Microsoft R Open")
MouseClick("Primary", 280,510, 1, 5)
Sleep(2000)
MouseClick("Primary", 660,580, 1, 5)

;Complete
WinActivate("SQL Server 2016 Setup", "Complete")
MouseClick("Primary", 750,580, 1, 5)
#CE
;---------------- End Sql Install ----------------------------------


; ---------- Enables Windows Features ----------
#CS
Run("control.exe /NAME Microsoft.ProgramsAndFeatures")
WinWait("Programs and Features")
WinActivate("Programs and Features")
MouseClick("Primary", 100,145, 1, 5)
WinWait("Windows Features")
WinActivate("Windows Features")
MouseClickDrag("Primary", 400,148, 400,250)
MouseClick("Primary", 47,140, 1, 5)
MouseClick("Primary", 47,157, 1, 5)
MouseClick("Primary", 290,345, 1, 5)
MouseClick("Primary", 617,457, 1, 5)
#CE
;------------End Windows Features --------------

