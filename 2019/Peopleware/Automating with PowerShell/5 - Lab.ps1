<# PeopleWare - Automating with PowerShell
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region Lab vragen De Pipeline - part 1
'1. Geef alle processen welke meer als 100MB Working Set geheugen gebruiken EN gelijk of meer als 50 seconden CPU usage hebben.
Sorteer dit op Geheugen gebruik en geef alleen de proces naam,het geheugen en CPU usage weer.'

'2. Geef in een lijstweergave alle services welke op dit moment draaien, maar welke niet automatisch starten.
Geef alleen de displaynaam, status en de opstart manier weer.'

'3. Maak een lijst met alle commandos gegroepeerd op werkwoord, waarbij de meestvoorkomende boven staat.
Sla de eerste 10 resultaten vervolgens op als HMTL bestand op je bureaublad'
#endregion

#region Lab antwoorden
Get-Process | Where-Object {$_.WS -gt 100MB -AND $_.CPU -ge 50} | Sort-Object WS | Select-Object ProcessName,WS,CPU

Get-Service | Where-Object {$_.Status -eq 'Running' -AND $_.StartType -ne 'Automatic'} | Format-List DisplayName,Status,StartType

Get-Command | Group-Object Verb | Sort-Object Count -Descending | Select-Object -First 10 | ConvertTo-Html | Out-File $Env:USERPROFILE\Desktop\Commands.html 
ii $Env:USERPROFILE\Desktop\Commands.html
#endregion