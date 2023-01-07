#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Installs prerrequisites for my system environment setup.

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

function Ask
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Text,
        [string]$Default
    )
    
    [string]$message = "$Text [Y/N]"
    if (!([string]::IsNullOrEmpty($Default)))
    {
        $message += " (default=$Default)"
    }

    if ($Force) {
        Write-Information "${message}: Y"
        return $true
    }
    while ($true) {
        $value = Read-Host "$message"
        if ([string]::IsNullOrWhiteSpace($value))
        {
            $value = $Default
        }
        if ($value -eq "Y" -Or $value -eq "y")
        {
            return $true
        }
        if ($value -eq "N" -Or $value -eq "n")
        {
            return $false
        }
    }
}
function Set-DotEnv-Variable {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Variable,
        [Parameter(Mandatory)]
        [string]$Text,
        [string]$Default
    )

    [string]$message = $Text
    if (!([string]::IsNullOrEmpty($Default)))
    {
        $message += " ($Default)"
    }

    $value = Read-Host "$message"
    if (!([string]::IsNullOrEmpty($value)))
    {
        "$Variable=$value" | Out-File -FilePath ".env" -Append
    }
    else {
        "$Variable=$Default" | Out-File -FilePath ".env" -Append
    }

    Write-Output $value
}


if (!(Test-Path -PathType Leaf ".env"))
{
    Write-Information -MessageData '.env file not found'
    Write-Information -MessageData 'You can answer some questions now to create the file'
    Write-Information -MessageData '    == or =='
    Write-Information -MessageData 'You can create the file yourself externally'
    Read-Host "Press Enter to continue"
}

if (!(Test-Path -PathType Leaf ".env"))
{
    Write-Information -MessageData 'Some information is needed to use scripts:'

    Write-Information -MessageData 'General questions about the user'

    $default_email = Set-DotEnv-Variable -Variable "EMAIL" -Text "E-mail"
    $default_user = Set-DotEnv-Variable -Variable "USER_NAME" -Text "Your name"

    Write-Information -MessageData 'Service provider questions'

    Set-DotEnv-Variable -Variable "DNS_HE_PASSWORD" -Text "DNS HE Password"

    Set-DotEnv-Variable -Variable "CF_TOKEN" -Text "CloudFlare Account Token"
    Set-DotEnv-Variable -Variable "CF_DOMAIN" -Text "CloudFlare Account Domain"
    Set-DotEnv-Variable -Variable "CF_RECORD" -Text "CloudFlare Account Record"
    Set-DotEnv-Variable -Variable "CF_EMAIL" -Text "CloudFlare Account E-mail" -Default $default_email

    Set-DotEnv-Variable -Variable "GIT_EMAIL" -Text "Git Config E-mail" -Default $default_email
    Set-DotEnv-Variable -Variable "GIT_USER_NAME" -Text "Git Config User Name" -Default $default_user
}

switch -File ".env" {
    default {
        $name, $value = $_.Trim() -split '=', 2
        if ($name -and $name[0] -ne '#') { # ignore blank and comment lines.
            Write-Information -MessageData "Env:$name = $value"
            Set-Item "Env:$name" $value
        }
    }
}


# Set execution policy
if (Ask -Text "Would you like to set ExecutionPolicy to Bypass for CurrentUser?" -Default "N")
{
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
}


# Install Chocolatey
if (Ask -Text "Would you like to install Chocolatey?" -Default "Y")
{
    Write-Information -MessageData 'Installing Chocolatey'
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}


# Install Git
if (Ask -Text "Would you like to install Git?" -Default "Y")
{
    Write-Information -MessageData 'Installing Git'
    choco upgrade -y git --params "'/GitAndUnixToolsOnPath /WindowsTerminalProfile'" --params-global
    $Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")  
}

if (Ask -Text "Would you like to set global Git configurations now?" -Default "Y") {
    Write-Information -MessageData 'Setting up Git'
    git config --global user.name "$Env:GIT_USER_NAME"
    git config --global user.name
    git config --global user.email "$Env:GIT_EMAIL"
    git config --global user.email
}


# Create id_rsa file to use with GitHub
if (Ask -Text "Would you like to create ~/.ssh/id_rsa now?" -Default "Y") {
    Write-Information "Creating ~/.ssh/id_rsa file"
    if (!(Test-Path -PathType Leaf "$Env:USERPROFILE\.ssh\id_rsa"))
    {
        ssh-keygen -t rsa -b 4096 -C "$Env:ID_RSA_EMAIL"
    }
}
if (Ask -Text "Would you like to setup GitHub now?" -Default "Y") {
    if (Test-Path -PathType Leaf "$Env:USERPROFILE\.ssh\id_rsa")
    {
        Write-Information "Paste the following content:"
        Write-Information ""
        Get-Content "$Env:USERPROFILE\.ssh\id_rsa.pub"
        Write-Information ""
        Write-Information "at: https://github.com/settings/ssh/new"
        Read-Host "Press Enter to continue"
    }
}


# Create Projects directory
if (Ask -Text "Would you like to create D:\Projects directory now?" -Default "Y") {
    Write-Information -MessageData 'Creating Projects directory'
    md -Force "D:\Projects"
}


# Cloning Windows-11-Scripts
if (Ask -Text "Would you like to clone Windows-11-Scripts now?" -Default "Y") {
    if (Test-Path -PathType Container "D:\Projects")
    {
        Write-Information -MessageData 'Cloning Windows-11-Scripts'
        pushd "D:\Projects"
        git clone "git@github.com:masbicudo/Windows-11-Scripts.git"
        Invoke-Item ".\Windows-11-Scripts"
        popd
    }
    Write-Information -MessageData 'Copying .env file to project directory'
    $location = (Get-Location).Path
    if (!($location -eq "D:\Projects\Windows-11-Scripts")) {
        if ((Test-Path -PathType Leaf ".env"))
        {
            cp ".env" "D:\Projects\Windows-11-Scripts\" -Force
        }    
    }
}


# Done
Write-Information -MessageData 'Done.'
