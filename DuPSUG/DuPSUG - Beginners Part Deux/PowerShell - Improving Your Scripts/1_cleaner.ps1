[CmdletBinding()]
param(
    [Parameter( Position = 0,
        Mandatory = $true)]
    [ValidateScript( {Test-Path $_})]
    $BasePath,
    [Parameter( Position = 1)]
    [int]$Age = 1,
    [Parameter( Position = 2)]
    [string]$Output = $PSScriptRoot + 'LockedFiles_' + (Get-Date -Format ddMMyyyy) + '.csv',
    [Switch]$Save
)

$Date = (Get-Date).AddDays( - $Age)
Get-ChildItem -Path $BasePath -Filter '~*.*' -File -Recurse -Force  |
    Where-Object {$_.LastAccessTime -le $Date} |
    Select-Object FullName, LastAccessTime, LastWriteTime |
    Tee-Object -Variable LockedFiles
if ($Save) {
    $LockedFiles | Export-Csv -NoTypeInformation -Path $Output -Encoding UTF8 -Force
}
