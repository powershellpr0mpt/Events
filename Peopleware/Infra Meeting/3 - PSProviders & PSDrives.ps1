<# PeopleWare - Automating with PowerShell
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region PSProviders & PSDrives
Get-Command -Noun PSProvider
help Get-PSProvider
Get-PSProvider

Get-Alias cd
Get-Alias -Definition Set-Location
& regedit #help about_operators 
cd Registry:

Get-PSDrive -PSProvider Registry
cd HKCU:
Get-ChildItem .
Get-Childitem 'Environment'
Get-Item 'Environment'
Get-ItemProperty 'Environment'

New-Item -Path HKCU: -Name OSC
New-ItemProperty -Path HKCU:\OSC -Name PowerShell -PropertyType string -Value 'Is awesome!'
Remove-Item -Path HKCU:\OSC

Set-Location Scripts:

Get-ChildItem C:\Temp\
Get-Item C:\Temp\LockedFiles_19092017.csv
Get-ItemProperty C:\Temp\LockedFiles_19092017.csv
Get-ItemProperty C:\Temp\LockedFiles_19092017.csv | Get-Member


Get-ChildItem Alias:
Get-ChildItem Env:
Get-ChildItem Function:
Get-ChildItem Variable:
#endregion


