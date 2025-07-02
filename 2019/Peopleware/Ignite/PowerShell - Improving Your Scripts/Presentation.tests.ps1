$PresentationFolder = "Git:\Events\Peopleware\Peopleware Ignite 2019\PowerShell - Improving Your Scripts"
$PresentationFile = Get-ChildItem -Path $PresentationFolder -Filter *.pptx -File

$Folders = @('C:\Temp\Locks\folder1','C:\Temp\Locks\folder2','C:\Temp')
$Browsers = @('Brave','Chrome','MSEdge')
$Processes = @('Outlook','Teams','Slack','Spotify','1Password')
$ZoomItPath = "$Home\OneDrive - PeopleWare ICT Solutions B.V\Documents\ZoomIt\ZoomIt.exe"


############
$PPTTitle = "{0} - PowerPoint" -f $PresentationFile.Name
############

<# Remediate
#Set location
Set-Location $PresentationFolder
#1 Powerpoint
Get-Process POWERPNT -ErrorAction SilentlyContinue| Stop-Process
#Open Presentation
Invoke-Item $PresentationFile
#Create missing folders
foreach ($Folder in $Folders){
    if (!(Test-Path -Path $Folder)){
        New-Item -Path (Split-Path -Path $Folder) -Name (Split-Path -Path $Folder -Leaf) -ItemType Directory
    }
}
#Close disturbing processes
foreach ($Process in $Processes){
    Get-Process $Process -ErrorAction SilentlyContinue | Stop-Process
}
#Close browsers
foreach ($Browser in $Browsers){
    Get-Process $Browser -ErrorAction SilentlyContinue| Stop-Process
}
#Open ZoomIT
Invoke-Item $ZoomItPath
#>

Describe "Preparing Presentation environment" {
    Context "VSCode" {
        It "Should have VS Code Open" {
            (Get-Process Code -ErrorAction SilentlyContinue)| Should -Not -BeNullOrEmpty
        }
    }
    Context "ZoomIt" {
        It "ZoomIt should be running" {
            (Get-Process ZoomIt -ErrorAction SilentlyContinue) | Should -Not -BeNullOrEmpty
            (Get-Process ZoomIt64 -ErrorAction SilentlyContinue) | Should -Not -BeNullOrEmpty
        }
    }
    Context "PowerPoint" {
        It "Should have PowerPoint Open" {
            (Get-Process POWERPNT -ErrorAction SilentlyContinue).Count | Should -Not -BeNullOrEmpty
        }
        It "Should have 1 PowerPoint process Open" {
            (Get-Process POWERPNT -ErrorAction SilentlyContinue).Count | Should -Be 1
        }
        It "Should have 1 PowerPoint presentation available" {
            $PresentationFile.Count | Should -Be 1
        }
        It "Should have the correct PowerPoint Presentation open" {
            (Get-Process POWERPNT -ErrorAction SilentlyContinue).MainWindowTitle| Should -Be $PPTTitle
        }
    }
    Context "Close disturbing processes" {
        foreach ($Process in $Processes){
            It "'$Process' Should be closed" {
                (Get-Process $Process -ErrorAction SilentlyContinue).Count | Should -Be 0
            }
        }
        foreach ($Browser in $Browsers){
            It "Browser '$Browser' should be closed"{
                (Get-Process $Browser -ErrorAction SilentlyContinue).Count | Should -Be 0
            }
        }
    }
    Context "Directories and Files should be available" {
        foreach ($Folder in $Folders) {
            It "Folder '$Folder' should exist"{
                Test-Path -Path $Folder -ErrorAction SilentlyContinue | Should -Be $true
            }
        }
        It "Current directory should be correct path" {
            (Get-Location).Path | Should -Be $PresentationFolder
        }
    }
}

