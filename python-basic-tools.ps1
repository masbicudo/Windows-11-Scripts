#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Installs common options for Python development.

    .NOTES
        # Script info
        Author:   Miguel Angelo Santos Bicudo
        Created:  2023-01-24
        Modified: 2023-01-24

        # Notes
        * https://github.com/masbicudo/Windows-11-Scripts

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param(
)


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

. .\libs\Ask.ps1
. .\libs\Load-DotEnv.ps1

Load-DotEnv

# Moving special folders
if (Ask -Text "Remove unwanted Python installer that comes with Windows" -Default "N") {
    Remove-Item $env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\python*.exe
}

if (Ask -Text "Install pyenv-win" -Default "N") {
    choco upgrade -y pyenv-win
}

if (Ask -Text "Install Python 3.10.4 as global Python interpreter" -Default "N") {
    pyenv install 3.10.4
    pyenv global 3.10.4
}

if (Ask -Text "Install PDM package manager" -Default "N") {
    pip install --user pdm
}

if (Ask -Text "Install Pipx" -Default "N") {
    pip install --user pipx
}
