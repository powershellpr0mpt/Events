$ObjectNumber = 10000
Measure-Command {
    $Process = Get-Process
    for ($i = 1; $i -lt $ObjectNumber; $i++) {
        Write-Output "This is mailbox $i of $($Process.count)"
    }
} | Select-Object TotalSeconds

Measure-Command {
    $Process = Get-Process
    $Count = $Process.Count
    for ($i = 1; $i -lt $ObjectNumber ; $i++) {
        Write-Output "This is mailbox $i of $Count"
    }
} | Select-Object TotalSeconds