# 3 Basis cmdlets
# Get-Command
# Even om aan te geven hoeveel cmdlets er in Win8.1 zijn:
(Get-Command).count
Get-Command -Noun Service
# Get-Help
Get-Help Get-Service
# verschil tussen Get-Help en help
Get-Help Get-Service -Full
help Get-Service -Full
#Get-Member
Get-Service | Get-Member
# Laat alle services zien
Get-Service
# Gebruik van wildcards voor het zoeken van een specifieke service
Get-Service -DisplayName *trans*
# Zoek een specifieke service
Get-Service -Name BITS
# Stop een specifieke service
Stop-Service -Name BITS
# Controleer status van BITS
Get-Service -Name BITS
# Start een specifieke service
Start-Service BITS
# Gebruik de pipeline om acties direct uit te voeren op gewenste objects
Get-Service BITS | Stop-Service
'BITS' | Start-Service
# Zoek alleen stopped services
Get-Service | Where-Object {$_.Status -eq 'Stopped'}
# Gebruik van aliases om je script korter te maken
# maar gebruik dit alleen in console, nooit aliases in scripts
gsv | ? {$_.Status -eq 'Stopped'}
# Service ook te controleren via WMI
Get-WmiObject -Class Win32_Service
# Verschil met resultaat CIM t.o.v. WMI
Get-CimInstance -ClassName Win32_Service
# Dagelijks voorbeeld van hoe dit gebruikt kan worden
Get-CimInstance -ClassName Win32_Service -Filter "startmode = 'auto' AND state != 'running'"
# Geavanceerde versie hiervan i.v.m. Exit Codes 
Get-CimInstance -ClassName Win32_Service -Filter "startmode = 'auto' AND state != 'running' AND Exitcode != 0"
# Waarom zo veel mogelijk "links" filteren? - Performance!
# Test 1 - Filter voor de pipeline
Get-ChildItem -Path C:\PowerShell -Recurse -Include *.ps1
# Test 2 - Filter na de pipeline
Get-ChildItem -Path C:\PowerShell -Recurse | ? {$_.Extension -eq '.ps1'}
# Performance Test 1
Measure-Command -Expression {Get-ChildItem -Path C:\PowerShell -Recurse -Include *.ps1}
# Performance Test 2
Measure-Command -Expression {Get-ChildItem -Path C:\PowerShell -Recurse | ? {$_.Extension -eq '.ps1'}}
#Performance Test 3
Set-Location C:\Test
Measure-Command -Expression {$i=0;while($i -lt 100){md $i;$i++}}
# Werken met variabelen