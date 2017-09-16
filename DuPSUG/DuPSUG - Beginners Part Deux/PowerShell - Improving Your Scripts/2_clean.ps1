[CmdletBinding()]
param (
    [string[]]$ComputerName
)

foreach ($Computer in $ComputerName) {
    Restart-Computer -ComputerName $Computer
}