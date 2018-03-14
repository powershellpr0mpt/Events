<# OSC - Automating with PowerShell
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region Lab vragen PSProviders & PSDrives 
'1. Welke PSProviders worden niet automatisch geladen maar hebben wel PSDrives beschikbaar?'
'2. Wat is de processor architectuur van jou omgeving?'
'3. Wat is het pad voor jou persoonlijke profiel? Dit is een variabele?'
'4. Hoe kan ik de opstartende programmas terugvinden onder HKEY_LOCAL_MACHINE:\Software\Microsoft\Windows\CurrentVersion\Run ?' 
'5. Welke versie PowerShell draai je nu precies?'
#endregion

#region Lab antwoorden
Get-PSProvider
Get-PSDrive
Get-PSProvider
cd Cert:
cd Wsman:
Get-PSProvider

Get-Item Env:\PROCESSOR_ARCHITECTURE

Get-Item Variable:\profile
$profile

Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

Get-Item Variable:\PSVersionTable
$PSVersionTable
#endregion