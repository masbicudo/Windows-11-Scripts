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
    # [Parameter()]
    # [switch] $Revert
)


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# # Self-elevate the script if required
# # ref: https://blog.expta.com/2017/03/how-to-self-elevate-powershell-script.html
# if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
#     if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
#         $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
#         Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
#         Exit
#     }
# }

# Assets
$Some = [string] ''

function Set-Env-Variable {

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
    Write-Information -MessageData 'Create it manually == or =='
    Read-Host "Press Enter to continue"
}

if (!(Test-Path -PathType Leaf ".env"))
{
    Write-Information -MessageData 'Some information is needed to use scripts:'

    $email = Set-Env-Variable -Variable "EMAIL" -Text "E-mail"

    Set-Env-Variable -Variable "DNS_HE_PASSWORD" -Text "DNS HE Password"

    Set-Env-Variable -Variable "CF_TOKEN" -Text "CloudFlare Account Token"
    Set-Env-Variable -Variable "CF_DOMAIN" -Text "CloudFlare Account Domain"
    Set-Env-Variable -Variable "CF_RECORD" -Text "CloudFlare Account Record"
    Set-Env-Variable -Variable "CF_EMAIL" -Text "CloudFlare Account E-mail" -Default $email
}

Install-Module -Name Set-PsEnv
Set-PsEnv


# Install Chocolatey
Write-Information -MessageData 'Installing Chocolatey'
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Git
Write-Information -MessageData 'Installing Git'
choco install -y git
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")  

# Create id_rsa file to use with GitHub
Write-Information "Creating ~/.ssh/id_rsa file"
if (!(Test-Path -PathType Leaf "$env:USERPROFILE\.ssh\id_rsa"))
{
    ssh-keygen -t rsa -b 4096 -C "$env:ID_RSA_EMAIL"
    Get-Content "$env:USERPROFILE\.ssh\id_rsa.pub"
    Write-Information "Paste the following content at"
    Write-Information "https://github.com/settings/ssh/new"
    Read-Host "Press Enter to continue"
}

# Create Projects directory
Write-Information -MessageData 'Creating Projects directory'
md -Force "D:\Projects"

# Cloning Windows-11-Scripts
if (Test-Path -PathType Container "D:\Projects")
{
    Write-Information -MessageData 'Cloning Windows-11-Scripts'
    pushd "D:\Projects"
    git clone "git@github.com:masbicudo/Windows-11-Scripts.git"
    Invoke-Item ".\Windows-11-Scripts"
    popd
}

if ((Test-Path -PathType Leaf ".env"))
{
    cp ".env" "D:\Projects\Windows-11-Scripts\" -Force
}

# Done
Write-Information -MessageData 'Done.'