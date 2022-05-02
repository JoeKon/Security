# collect evetn 4720 - new account generation
# http://woshub.com/getting-ad-accounts-created-in-the-last-24-hours/
# gen_new_accunt_report1.ps1
#
$Report = @()
# 8 Tage
#$time = (get-date) - (new-timespan -hour 192)
# 14 Tage
$time = (get-date) - (new-timespan -hour 336)
$AllDCs = Get-ADDomainController -Filter *
ForEach($DC in $AllDCs)
{
Get-WinEvent -ComputerName $dc.Name -FilterHashtable @{LogName="Security";ID=4720;StartTime=$Time}| Foreach {
$event = [xml]$_.ToXml()
if($event)
{
$Time = Get-Date $_.TimeCreated -UFormat "%Y-%m-%d %H:%M:%S"
$CreatorUser = $event.Event.EventData.Data[4]."#text"
$NewUser = $event.Event.EventData.Data[0]."#text"
$objReport = [PSCustomObject]@{
User = $NewUser
Creator = $CreatorUser
DC = $event.Event.System.computer
CreationDate = $Time
}
}
$Report += $objReport
}
}
$Report

$filename = Get-Date -Format yyyy.MM.dd-hhmm
$exportcsv=”c:\logs\ad_users_creators-” + $filename + “.csv”
$Report | Export-Csv $exportcsv -append -NoTypeInformation -Delimiter ","