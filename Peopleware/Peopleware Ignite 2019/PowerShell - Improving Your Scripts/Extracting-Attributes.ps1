#How to extract attributes
$Services = Get-Service 
$UpdateService = Get-Service -DisplayName 'Windows Updates'

"The actual Windows Update Service name is $UpdateService.Name"
'Or it is Actually $UpdateService.Name'

#region Answer time!
"It's actually $($UpdateService.Name)"
#endregion

#region But what about multiple objects
$Services | ForEach-Object {"The Service name for $($_.DisplayName) is $($_.Name)"}
$Services[0].
$Services[-1].DisplayName
$Services[0..9]
$Services[0..9].Status
#endregion
