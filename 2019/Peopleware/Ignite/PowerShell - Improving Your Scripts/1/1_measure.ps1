#region To be used later
if (!(Test-Path -Path PPW:)) {
    New-PSDrive -Name PPW -PSProvider FileSystem -Root "Git:\Events\Peopleware\Peopleware Ignite 2019\PowerShell - Improving Your Scripts" | Out-Null
}
$Path = 'PPW:'
Set-Location $Path
Clear-Host
#endregion

#region Original script

Measure-Command {
    .\1\1.ps1
} | Select-Object TotalSeconds

Set-Location $Path
#endregion

#region Clean script
Measure-Command {
    .\1\1_clean.ps1 -BasePath C:\Temp\Locks -Output C:\Temp\clean.csv
} | Select-Object TotalSeconds

Set-Location $Path
#endregion

#region Cleaner script
Measure-Command {
    .\1\1_cleaner.ps1 -BasePath C:\Temp\Locks -OutputFolder C:\Temp -Save
} | Select-Object TotalSeconds

Set-Location $Path
#endregion

#region Cleanest script
Measure-Command {
    . .\1\1_cleanest.ps1
    Get-LockedFiles -BasePath C:\Temp\Locks -OutputFolder C:\Temp -Save
} | Select-Object TotalSeconds
#endregion

#region Just for good 'measure' without preloading
Measure-Command {
    Get-LockedFiles -BasePath C:\Temp\Locks -OutputFolder C:\Temp -Save
} | Select-Object TotalSeconds
#endregion

#region Help me!
Clear-Host
Get-ChildItem -Path $Path\1 -Filter '1_*.ps1' -File | Where-Object {$_.Name -notlike '*measure*'} |
    ForEach-Object {
    Get-Help $_.FullName
}

Get-Help Get-LockedFiles -Full
#endregion