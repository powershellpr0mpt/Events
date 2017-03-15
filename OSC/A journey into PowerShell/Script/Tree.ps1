#requires -Version 2
Function Xmas-Tree 
{
    param
    (
        [array]$colors = ('red', 'white', 'magenta', 'blue', 'yellow', 'darkred', 'darkmagenta', 'cyan', 'darkcyan', 'darkyellow'),
        [string]$presentscolor = 'red'
    )

    $i = 0

    do 
    {
        $i++

        Clear-Host
        $color1 = (Get-Random -Maximum $colors)
        $color2 = (Get-Random -Maximum $colors)
        $lightscolor = (Get-Random -Maximum $colors)

write-host '
          _
       |\ 0 /|
        |/|\|
          |' -ForegroundColor Yellow
        Write-Host -Object '          @' -ForegroundColor $color1
        Write-Host -Object '         /' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '\' -ForegroundColor Green
        Write-Host -Object '        o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '/' -ForegroundColor Green -NoNewline
        Write-Host -Object '@' -ForegroundColor $color1 -NoNewline
        Write-Host -Object '\\' -ForegroundColor Green -NoNewline
        Write-Host -Object '            Merry Christmas'-ForegroundColor Green
        Write-Host -Object '       +' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '//' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '/\\' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '                 &'-ForegroundColor Red
        Write-Host -Object '      //' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '/' -ForegroundColor Green -NoNewline
        Write-Host -Object '@'  -ForegroundColor $color1 -NoNewline
        Write-Host -Object '\\/' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '         A happy new Year!'-ForegroundColor Green
        Write-Host -Object '     /\/' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '//' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '/\\\\' -ForegroundColor Green
        Write-Host -Object '    +' -ForegroundColor Green -NoNewline
        Write-Host -Object '///\//\' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '\' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '\\' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2
        Write-Host -Object '   o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '/' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '@' -ForegroundColor $color1 -NoNewline
        Write-Host -Object '/++/\\\' -ForegroundColor Green -NoNewline
        Write-Host -Object '@' -ForegroundColor $color1 -NoNewline
        Write-Host -Object '\\/\' -ForegroundColor Green -NoNewline
        Write-Host -Object '+ ' -ForegroundColor $lightscolor
        Write-Host -Object '  /\/' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '///' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '/' -ForegroundColor Green -NoNewline
        Write-Host -Object '@' -ForegroundColor $color1 -NoNewline
        Write-Host -Object '\' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '/\' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '\\' -ForegroundColor Green
        Write-Host -Object ' o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '/' -ForegroundColor Green -NoNewline
        Write-Host -Object '+' -ForegroundColor $lightscolor -NoNewline
        Write-Host -Object '/\/' -ForegroundColor Green -NoNewline
        Write-Host -Object '@' -ForegroundColor $color1 -NoNewline
        Write-Host -Object '//||\/\\' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2 -NoNewline
        Write-Host -Object '\\\' -ForegroundColor Green -NoNewline
        Write-Host -Object 'o' -ForegroundColor $color2
        Write-Host -Object '  /__ /|' -ForegroundColor $presentscolor -NoNewline
        Write-Host -Object '  ||' -ForegroundColor Green -NoNewline
        Write-Host -Object '   /__ /|' -ForegroundColor $presentscolor
        Write-Host -Object ' | * | |' -ForegroundColor $presentscolor -NoNewline
        Write-Host -Object ' (__)' -ForegroundColor Green -NoNewline
        Write-Host -Object ' | * | |' -ForegroundColor $presentscolor
        Write-Host -Object ' |___|/       |___|/ ' -ForegroundColor $presentscolor
        Write-Host -Object ''
        Write-Host -Object 'Press ANY button to change the light color' -ForegroundColor Gray
        Write-Host -Object 'Press ESC to exit' -ForegroundColor Gray

        $color1 = $null
        $color2 = $null
        $lightscolor = $null

        $key = if ($host.UI.RawUI.KeyAvailable) 
        {
            $host.UI.RawUI.ReadKey('NoEcho, IncludeKeyDown')
        }

        Start-Sleep -Milliseconds 500
    }
    until (($key.VirtualKeyCode -cmatch 27))
}

Xmas-Tree