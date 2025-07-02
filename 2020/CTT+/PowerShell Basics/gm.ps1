# Get-Member

## Oh I know how this works
Get-Member

## Or not
help Get-Member

## Let's try this out
Get-Process
Get-Process | Get-Member

Get-Date | Get-Member -MemberType Property
Get-Date | Get-Member -MemberType Method

Get-Service | Get-Member
Get-Member -InputObject (Get-Service)
(Get-Service).GetType()