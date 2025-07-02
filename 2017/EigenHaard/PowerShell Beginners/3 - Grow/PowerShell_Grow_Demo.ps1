#region Opdrachten van les 2

#region	vraag 1: Geef alle processen welke meer als 100MB Working Set geheugen gebruiken EN gelijk of meer als 50 seconden CPU usage hebben. 
#Sorteer dit op Geheugen gebruik en geef alleen de proces naam,het geheugen [in MB's] en CPU usage weer.
Get-Process | Where-Object {$_.WS -gt 100MB -AND $_.CPU -ge 50} | Sort-Object WS | Select-Object ProcessName,@{N='WS(MB)';E={$_.WS / 1MB -as [int]}},CPU
#endregion

#region vraag 2: Geef in een lijstweergave alle services welke op dit moment draaien, maar welke niet automatisch starten.
# Geef alleen de displaynaam, status en de opstart manier weer.
Get-Service | Where-Object {$_.Status -eq 'Running' -AND $_.StartType -ne 'Automatic'} | Format-List DisplayName,Status,StartType
#endregion

#region vraag 3: Geef de naam van het laatst draaiende process op de machine
(Get-Process).ProcessName[-1]
#endregion

#endregion

#region Modules and Snapins

#region Modules
Get-Command -Noun Module

Get-Module
Get-Help Get-Module -Detailed

Get-Module
Get-Module -ListAvailable

Get-Command -Module BitsTransfer
Get-Command | Group-Object Source | Sort-Object Count | select Count,Name

#known Modules include: ActiveDirectory, Office365, Azure, PowerCLI - simply require importing
#endregion

#region PSSnapins
Get-PSSnapin -Registered
Add-PSSnapin Citrix*

#known Snapins include: Citrix, Exchange, SQL - require installation -> admin permissions
#endregion

#endregion

#region WMI & CIM
Get-Command -Noun WMI*
Get-Help Get-WmiObject -Examples
Get-WmiObject -Class Win32_ComputerSystem
Get-WmiObject -Class Win32_OperatingSystem
Get-WmiObject -Class Win32_DiskDrive

Get-Command -Noun CIM*
Get-CimInstance -ClassName Win32_ComputerSystem 
Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_DiskDrive
Get-CimClass

Get-WmiObject -Class Win32_OperatingSystem | Select-Object LastBootUpTime
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object LastBootUpTime
#tab completion op NameSpace en ClassName onder CIM

#endregion

#region variables

#region find variables
Push-Location -Path PowerShell
Set-Location Variable:
Get-ChildItem
Set-Locationion env:
Get-ChildItem
Pop-Location
#endregion

#region basic variables
$a = 1
$a
$a | Get-Member -MemberType Method
$a.ToString()
$a.ToString() | Get-Member

$b = 'Hello World'
$b
$b | Get-Member -MemberType Method
$b.GetType().FullName

$c = Get-Service
$c
$c[0]
$c.DisplayName
#endregion

#region arrays and playing with variables
$c.count
$c[0..4]
$c[-1..-5]

$d = 'hello','world'
$d
$d | Get-Member
$d.GetType().FullName
$d[0]
$d[1]
$d[-1]
$d[0] + ' ' +$d[1]

$a
$e = 2
$a + $e
$b
$a + $b
$b + $a

$f = 'Robert'
$g = 'Prüst'
$f+ $g
$f + ' ' + $g 

$h = Import-Csv -Path Y:\Downloads\Eigenhaard_PS1\Eigenhaard\3 - Grow\Users.csv -Delimiter ','
$h
$h.FirstName
$h.LastName
$h | Where-Object {$_.Department -eq 'I&A'}
$h | ForEach-Object {$_.FirstName + ' ' + $_.LastName}

#endregion

#endregion