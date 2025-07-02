$ReadonlyClientId = '00000000-0000-0000-0000-000000000000'
$ClientId = '1111111-1111-1111-1111-111111111111' 

$tenantId = '2222222-2222-2222-2222-222222222222'

$ReadOnlyParams = @{
    ClientId = $ReadonlyClientId
    ClientSecret = $ReadonlyClientSecret
    TenantId = $tenantId
    Scope = 'https://graph.microsoft.com/.default'
}

$Params = @{
    ClientId = $ClientId
    ClientSecret = $ClientSecret
    TenantId = $tenantId
    Scope = 'https://graph.microsoft.com/.default'
}


$ReadonlyToken = Get-GraphToken $ReadOnlyParams
$Token = Get-GraphToken $Params

$ReadonlyToken | Set-Clipboard

$Token
$Token | Set-Clipboard