#jkon 30.01.20
# log-cleanUP after x days
#
$Path = C:\logs;
#Test
$History = 7; #in days

#Prod Time
#$History = 90; #in days

$Ordner = Get-ChildItem -Path $Path -Recurse;
foreach ($Datei in $Ordner)
{
    if ($Datei.CreationTime -lt $(Get-Date).AddDays($History * -1))
    {
        Remove-Item $Datei.FullName -Force;
    }
}

# logging of CleanUP

#$TimeStamp = Get-Date -Format o | foreach {$_ -replace ":", "."}  > c:\temp\Backup-Report.txt
$LOG = C:\logs\cleanup-Report.txt;
echo " "  > $LOG
echo "- - - - - !!! - - - - -"  >> $LOG
echo "check for Status is 'completed'"  >> $Path\cleanup-Report.txt
echo "!! only if 'completed' we go ahead  !!"  >> $Path\cleanup-Report.txt
echo "- - - - - - - - - -"  >> $Path\cleanup-Report.txt
Get-Date >> $Path\cleanup-Report.txt