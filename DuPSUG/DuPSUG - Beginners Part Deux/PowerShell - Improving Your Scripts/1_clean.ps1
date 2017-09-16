[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    $BasePath,
    [Parameter(Mandatory = $true)]
    $Output
)

$Date = (Get-Date).AddDays(-1)
Set-Location $BasePath
$Directory = (Get-Childitem -Force -Recurse | Where-Object { $_.PSIsContainer } | Select-Object FullName)
$Directory | Foreach-Object {Get-Childitem ($_.FullName) -Force | Where-Object {($_.Name -like '~*.*') -and ($_.LastAccessTime -le $date)} | Select-Object FullName, LastAccessTime, LastWriteTime} | Export-Csv $output