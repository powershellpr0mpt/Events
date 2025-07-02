<# ProAct - Fear the Shell - or shouldn't you
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region de belangrijkste Cmdlets in PowerShell
Get-Command
Get-Help
Get-Member
#endregion

#region Get-Command
Get-Command
(Get-Command).Count
Get-Command -Verb Get
Get-Command -Noun Process
Get-Command -Name *et-*Item*
Get-Command -Module DISM
gcm *alias*
Get-Command -Name Get-Alias
Get-Alias gcm
#endregion

#region Get-Help
Get-Help Get-Help
Get-Help *process*
Get-Help Get-Process

Get-Help -Name Get-Process -Detailed
Get-Help -Name Get-Process -Parameter Id
Get-Help -Name Get-Process -Examples
Get-Help -Name Get-Process -ShowWindow
Get-Help -Name Get-Process -Full
help Get-Process -Full

help about_*

Update-Help #Run as administrator
Save-Help
#endregion

#region Get-Member
Get-Member
help Get-Member
Get-Process
Get-Process | Get-Member
Get-Date | Get-Member -MemberType Property
Get-Date | Get-Member -MemberType Method
Get-Service | Get-Member
Get-Member -InputObject (Get-Service)
(Get-Service).GetType()
(Get-Service).DisplayName
(Get-Service).Name[0]
(Get-Service).DisplayName[0..4]
#endregion


