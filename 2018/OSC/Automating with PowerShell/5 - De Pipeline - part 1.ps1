<# OSC - Automating with PowerShell
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region De Pipeline - part 1

#region Filtering
Get-Command -Noun Object

Get-Service
Get-Service | Get-Member

Get-Service | Sort-Object DisplayName # | Get-Member

Get-Service | Where Status -eq Stopped
Get-Service | ? {$PSItem.Status -eq 'Stopped'}
Get-Service | Where-Object {$_.Status -eq 'Stopped'} # | Get-Member
#ALWAYS FILTER LEFT!
Get-ChildItem -Path "$env:windir\help" -Recurse | Where-Object {$_.Extension -eq '.CHM'}
Get-ChildItem -Path "$env:windir\help" -Recurse -Filter *.CHM

Measure-Command -Expression {Get-ChildItem -Path "$env:windir\help" -Recurse | Where-Object {$_.Extension -eq '.CHM'}}
Measure-Command -Expression {Get-ChildItem -Path "$env:windir\help" -Recurse -Filter *.CHM}


Get-Service | Group-Object Status # | Get-Member
Get-Service | Group-Object StartType

Get-Service | Select-Object Name,StartType,Status # | Get-Member

Get-Command Get-Event
Get-Command Get-Event | Get-Member
Get-Command Get-Event | Select-Object Parameters
Get-Command Get-Event | Select-Object -ExpandProperty Parameters

Get-Service | Measure-Object
(Get-Service).Count
Get-Process | Measure-Object -Average Handles
Get-Process | Measure-Object -Maximum CPU
Get-ChildItem . | Measure-Object -Sum Length

Get-Service | Where-Object {$_.Status -eq 'Stopped' -AND $_.StartType -eq 'Automatic'} | Select-Object -First 2 Name,ServiceName,ServicesDependedOn

#endregion

#region Formatting
Get-Command -Verb Format
Get-Command -Verb Format -Module Microsoft.PowerShell.Utility

Get-Process | Select-Object -First 2
Get-Process | Select-Object -First 2 | Format-List
#ALWAYS FORMAT RIGHT!
Get-Process | Get-Member
Get-Process | Format-List | Get-Member

Get-Service BITS
Get-Service BITS | Get-Member
Get-Service BITS | Format-List *
Get-ItemProperty C:\Temp\LockedFiles_19092017.csv | Format-List *

Get-Service | Select-Object Name,Status,StartType,CanStop
Get-Service | Select-Object Name,Status,StartType,CanStop,CanShutdown
Get-Service | Format-Table Name,Status,StartType,CanStop,CanShutdown

#endregion

#region Outputting
Get-Command -Verb Out
Get-Process | Out-Gridview
Get-Process | Out-GridView -Title 'Alle processen' -PassThru | Out-Host
Get-Process | Select-Object -First 10 | Out-File C:\Temp\10process.txt
ii C:\Temp\10process.txt # Get-Alias ii
#endregion

#region Converting
Get-Command -Verb ConvertTo
Get-Process | ConvertTo-Html
Get-Process | ConvertTo-Html | Out-File C:\Temp\Process.html
ii C:\Temp\Process.html
#endregion

#region Exporting
Get-Command -Verb Export* -Module Microsoft.PowerShell.Utility
Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name,DisplayName,Status | Export-Csv -Path "$Env:USERPROFILE\Desktop\Services.csv" -Delimiter ',' # -NoTypeInformation 
ii $Env:USERPROFILE\Desktop\Services.csv

Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name,DisplayName,Status | Export-Clixml -Path "$Env:USERPROFILE\Desktop\Services.xml"
ii "$Env:USERPROFILE\Desktop\Services.xml"
Import-Clixml "$Env:USERPROFILE\Desktop\Services.xml"
Import-Clixml "$Env:USERPROFILE\Desktop\Services.xml" | Get-Member
#endregion

#region Operators
Get-Help about_Operators

#region Comparison Operators
help about_Comparison_Operators
# Vergelijk waardes, -eq -ne -gt -ge -lt -le -like -notlike -match -notmatch -contains -notcontains -replace
1 -eq 1
1 -eq 2
1 -ne 2

5 -gt 3
5 -ge 3
3 -lt 5
3 -le 5

'Robert' -like 'ro*'
'Robert' -notlike 'Ro*'

'Donderdag' -match 'dag'
'192.168.0.1' -match '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$'
'John','Ton','Marion','Andrea','Robert' -notmatch 'Robert'

1,2,3,4,5,4,3,2,1 -eq 2
1,2,3,4,5,4,3,2,1 -contains 2

'Maandag' -replace 'Maan','Zater'
12345 -replace 1,5
#endregion

#region Logical Operators
Get-Help about_Logical_Operators
# Logical operators verbinden expressions & statements, -AND -OR -XOR -NOT !
Get-Service | Where-Object {$_.Status -eq 'Running' -AND $_.StartType -eq 'Auto'} | Select-Object Name,Status,StartType -First 5
#endregion

#endregion

#endregion