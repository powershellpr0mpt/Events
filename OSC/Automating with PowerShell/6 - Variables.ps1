<# OSC - Automating with PowerShell
Robert Prüst
@r_prust
http://powershellpr0mpt.com
#>

#region variables
#region Find variables
Get-ChildItem env:
Get-ChildItem variable:
Get-Variable
#endregion

#region basic variables
$a = 1
$a
$a | Get-Member -MemberType Method
$a.ToString()
$a.ToString() | Get-Member

$b = 'Hello World'
$b
$b | Get-Member -MemberType Method
$b.GetType().FullName

$c = Get-Service
$c
$c[0]
$c.DisplayName
#endregion

#region arrays and playing with variables
$c.count
$c[0..4]
$c[-1..-5]

$d = 'hello','world'
$d
$d | Get-Member
$d.GetType().FullName
$d[0]
$d[1]
$d[-1]
$d[0] + ' ' +$d[1]

$a
$e = 2
$a + $e
$b
$a + $b
$b + $a

$f = 'Robert'
$g = 'Prüst'
$f+ $g
$f + ' ' + $g

$h = Import-Csv -Path "$env:USERPROFILE\Google Drive\PowerShell\Presentations\OSC\Automating with PowerShell\Users.csv" -Delimiter ','
$h
$h.FirstName
$h.LastName
$h | Where-Object {$_.Department -eq 'DevOps'}
$h | ForEach-Object {$_.FirstName + ' ' + $_.LastName}

#endregion
#region variables and quotes
$h[0].FirstName
'Your name is $h[0].FirstName'
"Your name is $h[0].FirstName"

#region hide me
"Your name is $($h[0].FirstName)"
'Your name is {0}' -f $h[0].FirstName
'Your name is {0}{1}' -f $h[0].FirstName,$h[0].LastName
#endregion

#endregion 


#endregion