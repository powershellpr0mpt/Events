#region Opdrachten van les 1

#region	vraag 1: Waar kan PowerShell objecten naar toe converteren?
Get-Command -Verb Convert*
Get-Command -Name *Convert*
Get-Command -Verb ConvertTo
#endregion

#region	vraag 2: Als ik wil testen of een pad bestaat, welk commando heb ik nodig?
Get-Command -Name *Test*
Get-Command -Name *Path*
Get-Command -Verb Test
Get-Command -Noun Path
Get-Command -Name Test-Path
#endregion

#region	vraag 3: Wat voor een soort input verwacht het Id parameter van Get-Process?
Get-Help -Name Get-Process
Get-Help -Name Get-Process -Detailed
Get-Help -Name Get-Process -Full
Get-Help -Name Get-Process -Parameter Id
#endregion

#region	vraag 4: Hoe kan ik zien welke CA certificates er op mijn lokale machine staan?
Push-Location 
Get-PSDrive
Set-Location Cert:
Get-ChildItem
Set-Location LocalMachine
Get-ChildItem
Set-Location CA
Pop-Location
Set-Location Cert:\LocalMachine\CA
Pop-Location
#endregion

#region	vraag 5: Hoe kan ik zien welke modules er beschikbaar zijn op mijn systeem, in het specifiek de naam, het versie nummer en de auteur van de module?
Get-Command -Verb Get -Noun *Module*
Get-Command Get-Module
Get-Module
Get-Module | Select-Object Name,Version,Author
#endregion

#region	vraag 6: Hoe kan ik de laatste 5 entries zien uit mijn Applicatie eventlog?
Get-Command -Verb Get -Noun *Eventlog*
Get-Help Get-EventLog
Get-Help Get-EventLog -Detailed
Get-EventLog -LogName Application -Newest 5
#endregion

#region	vraag 7: Welke eigenschappen kan ik allemaal vinden als ik de datum opvraag met PowerShell?
Get-Command -Verb Get -Noun *Date*
Get-Date
Get-Date | Get-Member
Get-Date | Get-Member -MemberType Property
#endregion

#endregion

#region Help - update & about
Get-Help
Get-Command -Noun Help
Get-Help Save-Help -Examples
Update-Help
Get-Help Get-Help
Get-Help about
Get-Help -Category HelpFile
#endregion

#region Operators
Get-Help about_Operators

#region Comparison Operators
Get-Help about_Comparison_Operators
# Compares values, -eq -ne -gt -ge -lt -le -like -notlike -match -notmatch -contains -notcontains -replace
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
# Logical operators to connect expressions & statements, -AND -OR -XOR -NOT !
Get-Service | Where-Object {$_.Status -eq 'Running' -AND $_.StartType -eq 'Auto'} | Select-Object Name,Status,StartType -First 5
(1 -eq 1)
Get-Service | Where-Object {! ($_.Status -eq 'Running')} | Select-Object -First 5

#endregion

#endregion

#region Filtering & Formatting

#region Filter Left
Get-ChildItem -Path "$env:windir\help" -Recurse | Where-Object {$_.Extension -eq '.CHM'}
Get-ChildItem -Path "$env:windir\help" -Recurse -Filter *.CHM

Measure-Command -Expression {Get-ChildItem -Path "$env:windir\help" -Recurse | Where-Object {$_.Extension -eq '.CHM'}}
Measure-Command -Expression {Get-ChildItem -Path "$env:windir\help" -Recurse -Filter *.CHM}
#endregion

#region Format Right
Get-Service | Where-Object {$_.Status -eq 'Running'} | Sort-Object DisplayName | Format-List -Property DisplayName,Status
Get-Service | Format-List -Property DisplayName,Status | Where-Object {$_.Status -eq 'Running'} | Sort-Object DisplayName

Get-Service | Where-Object {$_.Status -eq 'Running'} | Sort-Object DisplayName | Get-Member
Get-Service | Format-List -Property DisplayName,Status | Get-Member
#endregion

#region Format Data
Get-Process | Select-Object Name,VM,CPU
Get-Process | Select-Object Name,@{Name='VM(MB)';Expression={$_.VM / 1MB -as [int]}},@{Name='CPU(MHz)';Expression={$_.CPU -as [int]}}

Set-Location 'Y:\Downloads\Eigenhaard_PS1\Eigenhaard\2 - Refresh'
$HR = Import-Csv '.\HR_Info.csv'

$HR | Format-List
$HR | FL @{N='Name';E={$_.FullName}},@{N='GivenName';E={$_.FirstName}},@{L='SurName';E={$_.LastName}},Street,@{L='TelephoneNumber';E={$_.Phone}}
$HRNew = $HR | Select-Object @{N='Name';E={$_.FullName}},@{N='GivenName';E={$_.FirstName}},@{L='SurName';E={$_.LastName}},Street,@{L='TelephoneNumber';E={$_.Phone}}
$HRNew

#endregion

#endregion

#region Properties & Methods
Get-Service -Name BITS | Select-Object StartType #| Get-Member
(Get-Service -Name BITS).StartType #| Get-Member

Get-Process
(Get-Process).count
(Get-Process)[0]

Get-Date
(Get-Date).AddDays(2)
(Get-Date).AddDays(-2)
(Get-Date).AddHours(5.5)
#endregion
