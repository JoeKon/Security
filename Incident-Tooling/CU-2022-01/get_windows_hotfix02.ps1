#JKON 080721
# get OS Hotfix information
#KB5009557  - 2022-01

#https://sid-500.com/2018/02/04/powershell-gathering-information-of-all-installed-updates-hotfixes-on-all-domain-computers/

Get-Hotfix

#Get-Hotfix | Where-Object HotfixID -like KB500*
Get-Hotfix | Where-Object HotfixID -eq "KB5009557"

#Retrieve all Windows Server Computer
Get-ADComputer -Filter 'operatingsystem -like "*server*" -and enabled -eq "true"' ` 
-Properties Name,Operatingsystem,OperatingSystemVersion,HotfixID | Where-Object HotfixID -eq "KB5009557" `|
Sort-Object -Property Operatingsystem |
Select-Object -Property Name,Operatingsystem,OperatingSystemVersion,HotfixID
##



#Getting a list of all installed Hotfixes on all Domain Computers
#Invoke-Command -ComputerName (Get-ADComputer -Filter *).Name {Get-HotFix} -ErrorAction SilentlyContinue | Select-Object PSComputername, HotfixID, InstalledOn | Out-GridView

#Finding Computers that haven’t installed a special Hotfix
(Get-ADComputer -Filter *).Name | Foreach-Object {If (!(Get-Hotfix -ID "KB5009557" -ComputerName $_ -ErrorAction SilentlyContinue)) {Add-Content $_ -Path C:\Temp\missing5009557.txt}}


#
$lastpatch = Get-WmiObject -ComputerName "w-sv-veadmga1" Win32_Quickfixengineering | select @{Name="InstalledOn";Expression={$_.InstalledOn -as [datetime]}} | Sort-Object -Property Installedon | select-object -property installedon -last 1
Get-Date $lastpatch.InstalledOn -format yyyy-MM-dd
$lastboot = Get-WmiObject -ComputerName "w-sv-veadmga1" win32_operatingsystem | select @{Name="LastBootUpTime";Expression={$_.ConverttoDateTime($_.lastbootuptime)}} | Select-Object -Property lastbootuptime
Get-Date $lastboot.lastbootuptime -Format "yyyy-MM-dd hh:mm:ss tt"

#
#Read-Host -Prompt "Server Name?"
$n = Read-Host -Prompt "Server Name?"
Write-Host -ForegroundColor Yellow "-"
Write-Host -ForegroundColor Red "Last Date of Patching: " -NoNewline
$lastpatch = Get-WmiObject -ComputerName "$n" Win32_Quickfixengineering | select @{Name="InstalledOn";Expression={$_.InstalledOn -as [datetime]}} | Sort-Object -Property Installedon | select-object -property installedon -last 1
Get-Date $lastpatch.InstalledOn -format yyyy-MM-dd
Write-Host -ForegroundColor Yellow  "-"
Write-Host -ForegroundColor Red  "Last Date of boot: " -NoNewline
$lastboot = Get-WmiObject -ComputerName "$n" win32_operatingsystem | select @{Name="LastBootUpTime";Expression={$_.ConverttoDateTime($_.lastbootuptime)}} | Select-Object -Property lastbootuptime
Get-Date $lastboot.lastbootuptime -Format "yyyy-MM-dd hh:mm:ss tt"


