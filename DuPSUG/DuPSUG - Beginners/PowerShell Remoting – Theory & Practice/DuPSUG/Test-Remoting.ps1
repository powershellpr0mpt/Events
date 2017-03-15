<# DuPSUG: PowerShell for Beginners
PowerShell Remoting - Theory & Practice
Robert Prüst
@r_prust
http://powershellpr0mpt.com

Test-Remoting script
#>

#region Define machines
$domain = 'CONTOSO.COM'

$dserver = "SRV02.$domain"
$dclt = "CLT02.$domain"
$wserver = '192.168.0.30'

#endregion

#region Test connection 
$dserver,$dclt,$wserver | Test-NetConnection -CommonTCPPort WINRM | select ComputerName, RemotePort,PingSucceeded,TcpTestSucceeded

#endregion

#region Try and connect
Enter-PSSession -ComputerName $dserver
Enter-PSSession -ComputerName $dclt
Enter-PSSession -ComputerName $wserver

#endregion