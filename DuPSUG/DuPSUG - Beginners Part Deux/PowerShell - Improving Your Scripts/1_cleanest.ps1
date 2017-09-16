# Create a function to provide a more 'PowerShell like' experience for other users of your tool
# Provide comment based help to assist other people in using your tool, instantly providing documentation

function Get-LockedFiles {
    <#
.SYNOPSIS
    Find locked files of a certain age
.DESCRIPTION
    Long description
.PARAMETER BasePath
    Declare which location you want to search for locked files.
    Mandatory parameter.
.PARAMETER Age
    Declare the age of the files to search for.
    Default value of 1
.PARAMETER OutputFolder
    When the -Save switch parameter is called, you can defne a location to save the files to.
    Default value of $PSScriptRoot with a filename of 'LockedFiles_<date>.csv'.
    Will automatically overwrite if already existing.
.EXAMPLE
    PS C:\> Get-LockedFiles -BasePath D:\inetpub -Age 10 -Save
    Checks for lock files in D:\inetpub which are 10 days or older and saves the output to default .csv location
.NOTES
    Created by: Robert Prüst
    http://powershellpr0mpt.com
#>
    [CmdletBinding()]
    param(
        [Parameter( Position = 0,
            Mandatory = $true)]
        [ValidateScript( {Test-Path $_})]
        [Alias('Please provide base path to start search')]
        $BasePath,
        [Parameter( Position = 1)]
        [int]$Age = 1,
        [Parameter( Position = 2)]
        [Alias('Please provide full path for output csv file')]
        [string]$OutputFolder = $PSScriptRoot,
        [Switch]$Save
    )

    $Date = (Get-Date).AddDays( - $Age)
    Get-ChildItem -Path $BasePath -Filter '~*.*' -File -Recurse -Force  |
        Where-Object {$_.LastAccessTime -le $Date} |
        Select-Object FullName, LastAccessTime, LastWriteTime |
        Tee-Object -Variable LockedFiles
    if ($Save) {
        $FileName = '\LockedFiles_' + (Get-Date -Format ddMMyyyy) + '.csv'
        $Output = Join-Path -Path $OutputFolder -ChildPath $FileName
        $LockedFiles | Export-Csv -NoTypeInformation -Path $Output -Encoding UTF8 -Force
    }

}