@echo off

REM Name: DNS_logratate.cmd
REM Version: 2.0
REM Created: 27.01.2020  JKON
REM Last Modified: 27.01.2020
REM uses c:\scripts as script home dir
REM uses tec\svc-dns-log user for suiteable rights
REM
REM: based on example: 
REM: http://support.moonpoint.com/downloads/computer_languages/mswin_batch/rotatednslog.bat
REM
REM Description: When scheduled to run at the end of each day, this batch
REM file will roate the DNS server log. The DNS server service will be
REM stopped temporarily, so the current DNS log can be renamed to a log file
REM with the name DNS_YYYYMMDD.log, where YYYY is the year, MM the month, and
REM DD the day. The DNS server service will then be restarted creating a
REM new DNS log file. The current location of the DNS log file is obtained
REM from the Windows Registry.

REM Required for substituting the contents of a variable in string subsitution
REM employed to insert the contents of the date variable YYYYMMDD in the log
REM file name.

REM Environment:
rem date and time

set t=%time%
set TIME=%t:~0,2%%t:~3,2%%t:~6,2%
if "%TIME:~0,1%"==" " set SORTTIME=0%SORTTIME:~1,6%
echo %TIME%

set d=%date%
set DATE=%d:~-4%-%d:~3,2%-%d:~0,2%
echo %DATE%

SETLOCAL ENABLEDELAYEDEXPANSION

REM Windows Registry key holding the location of the DNS log file

SET regkey="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DNS\Parameters"

REM Registry value needed from the above key

SET regvalue="LogFilePath"

REM Extract only the file location from the output of the reg query command

FOR /F "tokens=3" %%G IN ('reg query %regkey% /v LogFilePath ^| find %regvalue%') DO set logfile=%%G

REM Set the variable YYYYMMDD to today's date in YYYYMMDD format where
REM YYYY = 4-digit year, MM is month (1-12), and DD is day (1-31)

SET YYYYMMDD=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%

REM Set the name for the rotated log file to have "_YYYYMMDD.log" at the
REM end of the file name.  Need to use delayed expansion.

SET renamedlog=!logfile:.log=_%DATE%_%TIME%.log!

REM Stop the DNS server service

NET STOP "DNS Server"

REM Move the log file to its new location with its new name.
REM Since you cannot specify a new drive or path for your destination file with
REM the RENAME command, I'm using the MOVE command, instead, in case I may
REM wish to update this batch script to move the file to another drive and/or
REM directory.

MOVE %logfile% %renamedlog%

REM Restart the DNS server service

NET START "DNS Server"