##get_windows_update-logs2.ps1
## get windows-Update logs
##http://woshub.com/downloading-updates-0-issue-windows/
##http://woshub.com/viewing-windowsupdate-log-in-windows-10/

$String = $((get-date).ToLocalTime()).ToString("yyyy-MM-dd-HHmmss")
echo $String

Get-WindowsUpdateLog -logpath C:\upd_logs\WindowsUpdate-$String.log

#letzte 30 Zeilen
#Select-String -Pattern '\sagent\s' -Path C:\upd_logs\WindowsUpdate.log | Select-Object -Last 30
Select-String -Pattern '\sagent\s' -Path C:\upd_logs\WindowsUpdate-$String.log | Select-Object -Last 30

## select Strings aus log
#Select-String -Pattern '\sagent\s' -Path C:\upd_logs\WindowsUpdate-2021-05-19-093949.log | Select-Object -Last 30
#Select-String  -Path C:\upd_logs\WindowsUpdate-2021-05-19-093949.log | Select-Object -Last 30