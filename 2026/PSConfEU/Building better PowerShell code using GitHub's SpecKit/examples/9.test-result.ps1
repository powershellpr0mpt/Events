$path = "C:\PSConfEU2026\SpecKit\claude-demo"
Set-Location -Path $path

Import-Module .\PSExcuse.psd1
New-Excuse
New-Excuse -Severity CareerEnding
New-Excuse -Blame TheIntern
New-Excuse -Format Slack