#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Installs common options for my system environment setup.

    .NOTES
        # Script info
        Author:   Miguel Angelo Santos Bicudo
        Created:  2023-01-06
        Modified: 2023-01-06

        # Notes
        * https://github.com/masbicudo/Windows-11-Scripts

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param(
    # [Parameter()]
    # [switch] $Revert
)


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

. .\libs\Ask.ps1
. .\libs\Load-DotEnv.ps1

Load-DotEnv


# Moving special folders
if (Ask -Text "Move special folders for Desktop and Downloads to D:\" -Default "N") {
    . .\move-special-folders.ps1
}

# Install basic utilities
if (Ask -Text "Would you like to install basic file utilities" -Default "N") {
    . .\choco-bundles\basic-files-utilities.ps1
}

# Install dev tools
if (Ask -Text "Would you like to install basic dev tools" -Default "N") {
    . .\choco-bundles\basic-dev-tools.ps1
}

# Done
Write-Information -MessageData 'Done.'
