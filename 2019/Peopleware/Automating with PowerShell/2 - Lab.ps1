<# PeopleWare - Automating with PowerShell
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region Lab vragen Belangrijkste Cmdlets & Syntax
'1. Hoeveel cmdlets zijn er die met services werken?'
'2. Naar welke cmdlets kan je allemaal iets Outputten?'
'3. Hoeveel parameter sets en hoeveel parameters heefts Get-Event?'
'4. Welke werkwoorden zijn toegestaan om gebruikt te worden voor Cmdlets?'
'5. Welke Property eigenschappen heeft Get-Location?' 
'6. Geef de Namen van de eerste 10 processen weer op jou systeem'
'7. Als ik wil testen of een pad bestaat, welk commando heb ik nodig?'
'8. Wat voor type object geeft Get-ChildItem?'
#endregion

#region Lab antwoorden
Get-Command -Noun *service*
Get-Command -Noun service

Get-Command -Verb Out

help Get-Event -ShowWindow

Get-Command -Noun Verb
Get-Verb

Get-Location | Get-Member

(Get-Process).Name[0..9]

Get-Command -Noun Path
Get-Command -Verb Test
Test-Path

Get-ChildItem | Get-Member
cd HKCU:
Get-ChildItem | Get-Member
cd Scripts:
#endregion