[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    $BasePath,
    [Parameter(Mandatory=$true)]
    $Output
)

$date = (get-date).AddDays(-1)
set-location $BasePath
$directory = (get-childitem -force -recurse | ? { $_.PSIsContainer } | select-object FullName)
$directory | foreach-object {get-childitem ($_.FullName) -force | where {($_.Name -like '~*.*') -and ($_.LastAccessTime -le $date)} | select-object FullName, LastAccessTime, LastWriteTime} | export-csv $output