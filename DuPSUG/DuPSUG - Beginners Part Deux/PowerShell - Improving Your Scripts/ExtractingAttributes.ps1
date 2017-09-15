$ObjectNumber = 10000
Measure-Command {
    for ($i = 1; $i -lt $ObjectNumber; $i++) {
        $Process = Get-Process
        $Process.Count
    }
} | Select TotalSeconds

Measure-Command {
    for ($i = 1; $i -lt $ObjectNumber ; $i++) {
        $Process = Get-Process
        $Count = $Process.Count
        $Count
    }
} | Select TotalSeconds