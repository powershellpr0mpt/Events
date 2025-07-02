#region 3 most valuable commands in PowerShell
Get-Command
Get-Help
Get-Member
#endregion

#region Find commands
Get-Command
(Get-Command).Count
Get-Command -Verb Get
Get-Command -Noun Process
Get-Command -Name *et-*Item*
Get-Command -Module DISM
#endregion

#region How to use the commands
Get-Help -Name Get-Process
Get-Help -Name Get-Process -Detailed
Get-Help -Name Get-Process -Examples
Get-Help -Name Get-Process -Full
help Get-Process -Full

Get-Service | Get-Member
Get-Help Start-Service -Parameter Name
Get-Service BITS | Stop-Service
#endregion

#region What information does a command provide
Get-Process -Name explorer
Get-Process -Name explorer | Select-Object ProcessName,'CPU(s)'
Get-Process | Get-Member
Get-Process | Select-Object Name,CPU
#endregion

#region PSDrives
Get-PSDrive
Set-Location Env:
Get-ChildItem
Set-Location HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run
Get-ItemProperty .
Set-Location C:
Get-PSProvider
#endregion

#region Sort, Group, Filter
Get-Service
Get-Service | Where-Object {$PSItem.Status -eq 'Running'}
Get-Service | Select-Object Name
Get-Service | Sort-Object Status
Get-Service | Group-Object Status
Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name,DisplayName,Status
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
#endregion

#region Displaying and outputting information
Get-Process -Name explorer
Get-Process -Name explorer | Format-Table 
Get-Process -Name explorer | Format-List
Get-Process -Name explorer | Format-List -Property *

Write-Host 'You can write messages here'
Write-Output 'And you can also write output here'
Write-Error 'testing 123'
Write-Host -ForegroundColor Black -BackgroundColor Yellow "You can give Write-Host some nice colours"

$Services = Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name,DisplayName,Status

$Services | Export-Csv $home\Services.csv -Delimiter ';' -NoTypeInformation
Invoke-Expression "$home\Services.csv"

$Services | ConvertTo-Html -Title "Services on $env:COMPUTERNAME" -CssUri .\style.css | Out-File $home\Services.html
Invoke-Expression "$home\Services.html"
#endregion