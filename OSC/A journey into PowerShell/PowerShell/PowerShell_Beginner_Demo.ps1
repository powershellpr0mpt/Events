#region 3 most valuable commands in PowerShell
Get-Command
Get-Help
Get-Member
#endregion

#region Find commands
Get-Command
(Get-Command).Count
Get-Command -Verb Get
Get-Command -Noun Process
Get-Command -Name *et-*Item*
Get-Command -Module DISM
#endregion

#region How to use the commands
Get-Help Get-Process
Get-Help Get-Process -Detailed
Get-Help Get-Process -Examples
Get-Help Get-Process -Full
help Get-Process -Full

Get-Service | Get-Member
Get-Help Start-Service -Parameter Name
Get-Service BITS | Stop-Service
#endregion

#region What information does a command provide
Get-Process -Name explorer
Get-Process -Name explorer | Select ProcessName,'CPU(s)'
Get-Process | Get-Member
Get-Process | Select-Object Name,CPU
#endregion

#region PSDrives
Get-PSDrive
Set-Location Env:
Get-ChildItem
Set-Location HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run
Get-ItemProperty .
Set-Location C:
Get-PSProvider
#endregion

#region Sort, Group, Filter
Get-Service
Get-Service | Where-Object {$PSItem.Status -eq 'Running'}
Get-Service | Select-Object Name
Get-Service | Sort-Object Status
Get-Service | Group-Object Status
Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name,DisplayName,Status
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
#endregion

#region Displaying and outputting information
Get-Process -Name explorer
Get-Process -Name explorer | Format-Table 
Get-Process -Name explorer | Format-List
Get-Process -Name explorer | Format-List -Property *

Write-Host 'You can write messages here'
Write-Output 'And you can also write output here'
Write-Error 'testing 123'
Write-Host -ForegroundColor Black -BackgroundColor Yellow "You can give Write-Host some nice colours"
start powershell.exe '..\Script\Tree.ps1'

$Services = Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name,DisplayName,Status

$Services | Export-Csv $home\Desktop\Services.csv -Delimiter ';' -NoTypeInformation
Invoke-Expression "$home\Desktop\Services.csv"

$Services | ConvertTo-Html -Title "Services on $env:COMPUTERNAME" -CssUri .\style.css | Out-File $home\Desktop\Services.html
Invoke-Expression "$home\Desktop\Services.html"
#endregion

#region Prep AD
Import-Module ActiveDirectory
$dn = (Get-ADDomain).DistinguishedName
$forest = (Get-ADDomain).Forest

$ou = Get-ADOrganizationalUnit -Filter 'name -eq "Demo Users"'
if($ou -eq $null) {
    New-ADOrganizationalUnit -Name "Demo Users" -Path $dn
    $ou = Get-ADOrganizationalUnit -Filter 'name -eq "Demo Users"'
}
$NL_ou = Get-ADOrganizationalUnit -Filter 'name -eq "NL"'
if($NL_ou -eq $null) {
    New-ADOrganizationalUnit -Name "NL" -Path $dn
    $NL_ou = Get-ADOrganizationalUnit -Filter 'name -eq "NL"'
}

(Get-ADUser -Filter * -SearchBase $ou).count
#endregion


#endregion

#region AD Demo 990 Unique Users
$Data = Import-Csv ..\RandomUsers\1000_RandomUsers.csv

$RefinedData = $data | select  @{Name="Name";Expression={$_.Surname + ", " + $_.GivenName}},`
         @{Name="SamAccountName"; Expression={$_.Username}},`
         @{Name="UserPrincipalName"; Expression={$_.Username +"@" + $forest}},`
         @{Name="GivenName"; Expression={$_.GivenName}},`
         @{Name="Surname"; Expression={$_.Surname}},`
         @{Name="DisplayName"; Expression={$_.Surname + ", " + $_.GivenName}},`
         @{Name="City"; Expression={$_.City}},`
         @{Name="StreetAddress"; Expression={$_.StreetAddress}},`
         @{Name="State"; Expression={$_.State}},`
         @{Name="Country"; Expression={$_.Country}},`
         @{Name="PostalCode"; Expression={$_.ZipCode}},`
         @{Name="EmailAddress"; Expression={$_.EmailAddress}},`
         @{Name="AccountPassword"; Expression={ (Convertto-SecureString -Force -AsPlainText "WelcomeToPowerShell!!1!1one")}},`
         @{Name="OfficePhone"; Expression={$_.TelephoneNumber}},`
         @{Name="Title"; Expression={$_.Occupation}},`
         @{Name="Enabled"; Expression={$true}},`
         @{Name="PasswordNeverExpires"; Expression={$true}}

$refineddata | % {
    $subou = Get-ADOrganizationalUnit -Filter "name -eq ""$($_.Country)""" -SearchBase $ou.DistinguishedName        
    if($subou -eq $null) {
        New-ADOrganizationalUnit -Name $_.Country -Path $ou.DistinguishedName
        $subou = Get-ADOrganizationalUnit -Filter "name -eq ""$($_.Country)""" -SearchBase $ou.DistinguishedName        
    }
    $_ | Select @{Name="Path"; Expression={$subou.DistinguishedName}},* | New-ADUser  
}

(Get-ADUser -Filter * -SearchBase $ou).count
#endregion