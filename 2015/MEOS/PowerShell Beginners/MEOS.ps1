
#1
Get-Help
Get-Command

#2
Get-Process

#3
Get-Process -Name *explo*
Get-Process -Id 972

#4
Get-Process | Where-Object Handles -ge 1000
Get-Process | Where-Object Handles -ge 1000 | Sort-Object Handles
Get-Process | Where-Object Handles -ge 1000 | Sort-Object Handles -Descending
Get-Process | Where-Object Handles -ge 1000 | Sort-Object Handles -Descending | Format-Table ProcessName,Handles
Get-Process | Where-Object Handles -ge 1000 | Sort-Object Handles -Descending | Format-Table ProcessName,Handles -AutoSize

#5
Get-Process | Get-Member
Get-Process | Get-Member | Out-GridView

#6
Get-Process | Format-Table Name,Company,Description
Get-Process | Where-Object Company -NotLike *microsoft* | Format-Table Name,Company,Desc* -AutoSize
Get-Process | Format-Table -GroupBy Company
Get-Process | Sort-Object Company | Format-Table -GroupBy Company