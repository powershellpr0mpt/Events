<# OSC - Automating with PowerShell
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region Snapins en Modules

#region PSSnapins
Get-PSSnapin -Registered
Add-PSSnapin Citrix*

#known Snapins include: Citrix, Exchange, SQL - require installation -> admin permissions
#endregion

#region Modules
Get-Command -Noun Module

Get-Module
Get-Help Get-Module -Detailed
Get-Module -ListAvailable

Get-Command -Module BitsTransfer
Get-Command | Group-Object Source | Sort-Object Count -Descending | Select-Object -Property Count,Name

Find-Module Pester
Find-Module *Azure*
Find-Module dbatools | Select-Object Name,Version,Description,ProjectUri,ReleaseNotes

#known Modules include: ActiveDirectory, Office365, Azure, PowerCLI - simply require importing
#endregion

#endregion