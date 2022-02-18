#region de belangrijkste Cmdlets in PowerShell
Get-Command
Get-Help
Get-Member
#endregion

#region Get-Command
Get-Command #geeft alle cmdlets in de PowerShell console
(Get-Command).Count #geeft het aantal cmdlets in de PowerShell console
Get-Command -Verb Get #geeft alle cmdlets die een Get verb hebben
Get-Command -Noun Process #geeft alle cmdlets die een Process noun hebben
Get-Command -Name *et-*Item* #geeft alle cmdlets die lijken op *et-*Item* (wildcard)
Get-Command -Module DISM #geeft alle cmdlets die in de DISM module zitten
gcm *alias* #geeft alle cmdlets met de naam *alias* , gcm is een alias voor Get-Command
Get-Command -Name Get-Alias #geeft alle cmdlets die een Get-Alias hebben
Get-Alias gcm #geeft de informatie van de alias gcm
#endregion

#region Get-Help
Get-Help Get-Help #geeft de hulp van de cmdlet Get-Help
Get-Help *process* #geeft aan welke hulp er van de cmdlets met *process* in de naam zijn
Get-Help Get-Process #geeft de hulp van de cmdlet Get-Process

Get-Help -Name Get-Process -Detailed #geeft de hulp van de cmdlet Get-Process met alle details
Get-Help -Name Get-Process -Parameter Id #geeft de hulp van de cmdlet Get-Process met de parameter Id
Get-Help -Name Get-Process -Examples #geeft de hulp van de cmdlet Get-Process met de parameter Examples om voorbeelden te tonen
Get-Help -Name Get-Process -ShowWindow #geeft de hulp van de cmdlet Get-Process met de parameter ShowWindow om de window te tonen
Get-Help -Name Get-Process -Full #geeft de hulp van de cmdlet Get-Process met alle details
help Get-Process -Full #geeft de hulp van de cmdlet Get-Process met alle details - het verschil tussen Get-Help en help is dat help alleen de info per pagina toont

help about_* #geeft de hulp van de about_* topics

Update-Help #update de hulp van de cmdlets op het systeem - MOET als admin gedraaid worden
Save-Help #slaat de hulp van de cmdlets op het systeem op
#endregion

#region Get-Member
Get-Member #geeft alle members /eigenschappen van het object weer in de PowerShell console
help Get-Member #geeft de hulp van de cmdlet Get-Member
Get-Process #geeft alle processen
Get-Process | Get-Member #geeft alle members /eigenschappen van alle processen
Get-Date | Get-Member -MemberType Property #geeft alle properties van het object dat deze cmdlet heeft
Get-Date | Get-Member -MemberType Method #geeft alle methods van het object dat deze cmdlet heeft
Get-Service | Get-Member #geeft alle members /eigenschappen van alle services
Get-Member -InputObject (Get-Service) #geeft alle members /eigenschappen van het object dat deze cmdlet heeft als inputobject in plaats van via de pipeline |
(Get-Service).GetType() #geeft de type van het object dat deze cmdlet heeft
(Get-Service).DisplayName #geeft de displaynames eigenschappen van alle services
(Get-Service).Name[0] #geeft de Name eigenschap van de eerste service
(Get-Service).DisplayName[0..4] #geeft de DisplayName eigenschap van de eerste service tot en met de vijfde service. Tellen begint altijd bij 0
#endregion


