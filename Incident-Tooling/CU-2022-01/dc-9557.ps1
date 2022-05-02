(Get-ADComputer -Filter *).Name | Foreach-Object {If ((Get-Hotfix -ID "KB5009557" -ComputerName c-sv-vedc -ErrorAction SilentlyContinue)) {Add-Content $_ -Path C:\Temp\DC-already_5009557.txt}}
(Get-ADComputer -Filter *).Name | Foreach-Object {If ((Get-Hotfix -ID "KB5009557" -ComputerName m-sv-vedc -ErrorAction SilentlyContinue)) {Add-Content $_ -Path C:\Temp\DC-already_5009557.txt}}
(Get-ADComputer -Filter *).Name | Foreach-Object {If ((Get-Hotfix -ID "KB5009557" -ComputerName n-sv-vedc -ErrorAction SilentlyContinue)) {Add-Content $_ -Path C:\Temp\DC-already_5009557.txt}}
(Get-ADComputer -Filter *).Name | Foreach-Object {If ((Get-Hotfix -ID "KB5009557" -ComputerName t-sv-vedc -ErrorAction SilentlyContinue)) {Add-Content $_ -Path C:\Temp\DC-already_5009557.txt}}
(Get-ADComputer -Filter *).Name | Foreach-Object {If ((Get-Hotfix -ID "KB5009557" -ComputerName w-sv-vedc -ErrorAction SilentlyContinue)) {Add-Content $_ -Path C:\Temp\DC-already_5009557.txt}}
(Get-ADComputer -Filter *).Name | Foreach-Object {If ((Get-Hotfix -ID "KB5009557" -ComputerName s-sv-vedc -ErrorAction SilentlyContinue)) {Add-Content $_ -Path C:\Temp\DC-already_5009557.txt}}


