<# ProAct - Fear the Shell - or shouldn't you
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

New-Item -Path HKCU: -Name ProAct
New-ItemProperty -Path HKCU:\ProAct -Name PowerShell -PropertyType String -Value 'Is awesome!'
Remove-Item -Path HKCU:\ProAct

Set-Location Scripts:

Get-ChildItem Alias:
Get-ChildItem Env:
Get-ChildItem Function:
Get-ChildItem Variable:
#endregion


