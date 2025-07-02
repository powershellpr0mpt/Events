<# DuPSUG: PowerShell for Beginners
PowerShell Remoting - Theory & Practice
Robert Prüst
@r_prust
http://powershellpr0mpt.com

Connect-Workgroup script
#>

#region Provide remote system variables
$SName = 'WKG01'
$SIP = '192.168.0.30'
$SCred = Get-Credential -Credential "$SName\administrator"

#endregion

#region Configure local hosts file to add remote system

$HostsFile = $env:SystemRoot + '\System32\Drivers\etc\hosts' 
$Hosts = Get-Content $HostsFile 
$Line = "$SIP`t$SName"     
If ($Hosts -notcontains $line) {
 	$Hosts = $Hosts + $line
 	Write-Output "Adding... $line" 
} 
$Hosts | Set-Content $HostsFile –Force

#endregion

#region Configure local WinRM TrustedHosts
$CurrentLocalTrustedHosts = (Get-Item -Path WSMan:\localhost\Client\TrustedHosts).value
if ([string]::IsNullOrEmpty($CurrentLocalTrustedHosts)) {
	Set-Item -Path "WSMan:\$SName\Client\TrustedHosts" -Value "$SName" -Force
}
else {
	Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value "$CurrentLocalTrustedHosts,$SName" -Force
}
# Check local WinRM TrustedHosts
Get-Item -Path WSMAN:\localhost\Client\TrustedHosts

#endregion

#region Connect to remote system through WSMan
Connect-WSMan -ComputerName $SName -Credential $SCred

#endregion

#region Configure remote WinRM TrustedHosts
#Get local IP Address
$LocalIP = Get-NetAdapter -Physical | Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -like '192.168.0.*'} | Select-Object -ExpandProperty IPAddress

#Add local IP Address to remote WinRM TrustedHosts
$CurrentServerTrustedHosts = (Get-Item -Path "WSMan:\$SName\Client\TrustedHosts").value

if ([string]::IsNullOrEmpty($CurrentServerTrustedHosts)) {
	Set-Item -Path "WSMan:\$SName\Client\TrustedHosts" -Value "$LocalIP" -Force
}
else {
	Set-Item -Path "WSMan:\$SName\Client\TrustedHosts" -Value "$CurrentServerTrustedHosts,$LocalIP" -Force
}

#Check changes made to remote WinRM TrustedHosts
Get-Item -Path "WSMAN:\$SName\Client\TrustedHosts"

#endregion

#region Test to see if everything works
Enter-PSSession -ComputerName $SName -Credential $SCredhostname
Exit-PSSession

#endregion