<# DuPSUG: PowerShell for Beginners
PowerShell Remoting - Theory & Practice
Robert Prüst
@r_prust
http://powershellpr0mpt.com

Main Lab script
#>


#region Test-Remoting on Lab Demo
PsEdit .\DuPSUG\Test-Remoting.ps1

#endregion

#region Enable-Remoting on Lab Demo
PsEdit .\DuPSUG\Connect-WorkGroup.ps1

#manually perform Enable-PSRemoting on CLT02
#Show GPO on DC01 for client remoting

#endregion

#region 1:1 Remoting
Start-Service -Name BITS
Get-Service -Name BITS

Enter-PSSession -ComputerName SRV02
hostname
Get-Service BITS
Enter-PSSession DC01
Exit-PSSession

#endregion

#region 1:N Remoting

#define remote computers
$computers = 'SRV02','CLT02','CLT01','DC01'

#Remote commands

Invoke-Command -ComputerName $computers -ScriptBlock {Get-Service -Name BITS}
Invoke-Command -ComputerName $computers -FilePath C:\Users\administrator\Desktop\DuPSUG\InvokeMe.ps1

#Difference remote vs local 

$computers = 'DC01','CLT01'

Get-EventLog -LogName Security -ComputerName $computers | Where-Object {$_.EventID -eq 4624}
Invoke-Command -ComputerName $computers -ScriptBlock {Get-EventLog -LogName Security | Where-Object {$_.EventID -eq 4624}}

Measure-Command {Get-EventLog -LogName Security -ComputerName $computers | Where-Object {$_.EventID -eq 4624}}
Measure-Command {Invoke-Command -ComputerName $computers -ScriptBlock {Get-EventLog -LogName Security | Where-Object {$_.EventID -eq 4624}}}

#endregion

#region Persistent Sessions
Invoke-Command -ComputerName DC01 -ScriptBlock {$test = 1}
Invoke-Command -ComputerName DC01 -ScriptBlock {$test}
Get-PSSession

$Session = New-PSSession -ComputerName DC01
Invoke-Command -Session $Session -ScriptBlock {$test = 1}
Invoke-Command -Session $Session -ScriptBlock {$test}
Remove-PSSession -Session $Session

Measure-Command {Invoke-Command -ComputerName DC01 -ScriptBlock {Get-Process}}
Measure-Command {Invoke-Command -Session $Session -ScriptBlock {Get-Process}}

#endregion

#region Implicit Remoting

#code should be run from SRV02
Get-ADUser -Filter *
$session = New-PSSession -ComputerName DC01
Import-Module -Name ActiveDirectory -PSSession $Session
Get-ADUser -Filter * | Select-Object Name

#endregion