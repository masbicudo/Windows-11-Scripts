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
    [Parameter()]
    [switch] $Force
)


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

. .\libs\Ask.ps1
. .\libs\Load-DotEnv.ps1
. .\libs\Add-Path-First.ps1

Load-DotEnv


# Moving special folders
if (Ask -Text "Move special folders for Desktop and Downloads to D:\" -Default "N") {
    . .\move-special-folders.ps1
}


# Create Shortcuts directory
if (Ask -Text "Would you like to create C:\Shortcuts directory now?" -Default "N") {
    Write-Information -MessageData 'Creating Shortcuts directory'
    md -Force "C:\Shortcuts"
}

if (Ask -Text "Would you like to add Shortcuts folder to PATH now?" -Default "N") {
    Write-Information -MessageData 'Adding Shortcuts folder to PATH'
    Add-Path-First "C:\Shortcuts"
}


# Clone MoveShortcuts
if (Ask -Text "Would you like to clone MoveShortcuts project now?" -Default "N") {
    pushd "D:\Projects"
    try {
        if (!(Test-Path -PathType Container "MoveShortcuts")) {
            Write-Information -MessageData 'Cloning MoveShortcuts project'
                git clone "git@github.com:masbicudo/MoveShortcuts.git"
        }
        else {
            Write-Information -MessageData 'Updating MoveShortcuts project'
            pushd "MoveShortcuts"
            try {
                git pull
            }
            finally {
                popd
            }
        }
    } finally {
        popd
    }
}

# Clone MoveShortcuts
if (Ask -Text "Would you like to build MoveShortcuts project now?" -Default "N") {
    pushd "D:\Projects\MoveShortcuts"
    try {
        if (Test-Path -PathType Container "MoveShortcuts") {
            dotnet build --configuration Release "MoveShortcuts\MoveShortcuts.csproj"
        }
        else {
            Write-Information "MoveShortcuts project not cloned, cannot build"
        }
    } finally {
        popd
    }
}


# Install basic utilities
if (Ask -Text "Would you like to install basic file utilities" -Default "N") {
    . .\choco-bundles\basic-files-utilities.ps1
}

# Install basic utilities
Write-Information "File Synchronization Tools"
Write-Information "    SyncThing can be used to synchronize the D:\Projects folder."
Write-Information "    To do this, you must delete or rename the current Projects folder,"
Write-Information "    Then import Projects folder using SyncThing."
if (Ask -Text "Would you like to install file synch tools" -Default "N") {
    . .\choco-bundles\file-sync-tools.ps1
}

# Install dev tools
if (Ask -Text "Would you like to install basic dev tools" -Default "N") {
    . .\choco-bundles\basic-dev-tools.ps1
}
if (Ask -Text "Would you like visit Visual Studio Community download web page" -Default "N") {
    Start-Process "https://visualstudio.microsoft.com/vs/community/"
}

# Done
Write-Information -MessageData 'Done.'
