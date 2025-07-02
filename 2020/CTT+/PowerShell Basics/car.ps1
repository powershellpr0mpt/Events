$Car = [PSCustomObject]@{
    PSTypeName    = 'Car'
    Manufacturer  = 'VolksWagen'
    Model         = 'Golf'
    Type          = 'Stationwagon'
    NumberOfDoors = 5
    EngineSize    = '1.2 L'
    FuelType      = 'E10', 'Diesel'
    Colour        = 'Blue', 'Black'
}

$Car | Get-Member