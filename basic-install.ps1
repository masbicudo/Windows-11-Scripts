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


# NOTE: This file is intended to be executed directly from the web,
# using the IEX command. This makes it impossible to SOURCE import
# other ps1 files. If you need any library, either install them from
# NuGet package available online, or copy the contents of the file
# here instead.

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

    # Force must be a global or local
    # variable defined in the scope of the
    # file that imported this library
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
function Multiple-Options
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Text,
        [string[]]$Options,
        [string]$Default
    )
    
    $OptTxt = "["+[string]::Join("/", $Options)+"]"
    [string]$message = "$Text $OptTxt"
    if (!([string]::IsNullOrEmpty($Default)))
    {
        $message += " (default=$Default)"
    }

    while ($true) {
        $value = Read-Host "$message"
        if ([string]::IsNullOrWhiteSpace($value))
        {
            $value = $Default
        }
        if ($Options -contains $value)
        {
            return $value
        }
        else {
            return "invalid"
        }
    }
}
function GetSet-DotEnv-Variable {

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

    try {
        $value = (Get-Item "Env:$Variable").Value
    } catch {
        <#Do this if a terminating exception happens#>
        $value = ""
    }

    if ([string]::IsNullOrWhiteSpace($value))
    {
        $value = Read-Host "$message"
        if (!([string]::IsNullOrEmpty($value)))
        {
            "$Variable=$value" | Out-File -encoding "utf8" -FilePath ".env" -Append
        }
        else {
            "$Variable=$Default" | Out-File -encoding "utf8" -FilePath ".env" -Append
        }
    }
    else {
        $message += ": $value"
        Write-Information $message
    }

    Write-Output $value
}
function Get-Check-Point {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Variable
    )
    if (!(Test-Path -PathType Leaf "$Env:USERPROFILE\init-script.env"))
    {
        return $false
    }
    switch -File "$Env:USERPROFILE\init-script.env" {
        default {
            $name, $value = $_.Trim() -split '=', 2
            if ($name -and $name[0] -ne '#') { # ignore blank and comment lines.
                if ($name -eq $Variable)
                {
                    return $true
                }
            }
        }
    }

    return $false
}
function Set-Check-Point {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Variable
    )

    $value = "ok"
    "$Variable=$value" | Out-File -encoding "utf8" -FilePath "$Env:USERPROFILE\init-script.env" -Append
}
function Load-DotEnv {
    Param (
        [string]$FileName
    )
    
    if ([string]::IsNullOrWhiteSpace($FileName))
    {
        $FileName = ".env"
    }

    Write-Information ("Loading .env file from "+(Get-Location).Path)
    switch -File $FileName {
        default {
            $name, $value = $_.Trim() -split '=', 2
            if ($name -and $name[0] -ne '#') { # ignore blank and comment lines.
                Write-Information "    Env:$name = $value"
                Set-Item "Env:$name" $value
            }
        }
    }
}

Write-Information "Windows Environment Setup Script"
Write-Information "    by Miguel Angelo"
Write-Information "    latest: 2023-01-12"
Write-Information "    version: 1.0.2"

Write-Information "Index:"
Write-Information "    # Set execution policy"
Write-Information "    # Install Chocolatey"
Write-Information "    # Install Git"
Write-Information "    # Create id_rsa file to use with GitHub"
Write-Information "    # Setup GitHub"
Write-Information "    # Create Projects directory"
Write-Information "    # Projects firewall exclusion"
Write-Information "    # Cloning Windows-11-Scripts"
Write-Information "    # Other operations"


if (Test-Path -PathType Container "D:\Projects\Windows-11-Scripts")
{
    cd "D:\Projects\Windows-11-Scripts"
}
else
{
}


if (Test-Path -PathType Leaf ".env")
{
    $location = (Get-Location).Path
    Write-Information "Found .env file at $location"
}
else
{
    $location = (Get-Location).Path
    Write-Information '.env file not found'
    Write-Information 'You can answer some questions when required to fill the file'
    Write-Information '    == or =='
    Write-Information 'You can create the file yourself externally'
    Write-Information ('    at ' + $location + "\.env")
    Read-Host "Press Enter to continue"
}

Load-DotEnv

Write-Information 'Some information is needed to use this script.'

Write-Information 'General questions about the user'

$default_email = GetSet-DotEnv-Variable -Variable "EMAIL" -Text "E-mail"
$default_user = GetSet-DotEnv-Variable -Variable "USER_NAME" -Text "Your name"

GetSet-DotEnv-Variable -Variable "GIT_EMAIL" -Text "Git Config E-mail" -Default $default_email
GetSet-DotEnv-Variable -Variable "GIT_USER_NAME" -Text "Git Config User Name" -Default $default_user

Write-Information 'Service provider questions'

# GetSet-DotEnv-Variable -Variable "DNS_HE_PASSWORD" -Text "DNS HE Password"

# GetSet-DotEnv-Variable -Variable "CF_TOKEN" -Text "CloudFlare Account Token"
# GetSet-DotEnv-Variable -Variable "CF_DOMAIN" -Text "CloudFlare Account Domain"
# GetSet-DotEnv-Variable -Variable "CF_RECORD" -Text "CloudFlare Account Record"
# GetSet-DotEnv-Variable -Variable "CF_EMAIL" -Text "CloudFlare Account E-mail" -Default $default_email


# Set execution policy
if (!((Get-ExecutionPolicy) -eq "Bypass"))
{
    if (Ask -Text "Would you like to set ExecutionPolicy to Bypass for CurrentUser?" -Default "N")
    {
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
    }    
}
else
{
    Write-Information "Execution policy = Bypass"
}


# Install Chocolatey
if (Where.exe "choco")
{
    Write-Information "Chocolatey already installed"
}
elseif (Ask -Text "Would you like to install Chocolatey?" -Default "Y")
{
    Write-Information 'Installing Chocolatey'
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}


# Install Git
if (Where.exe "git")
{
    Write-Information "Git already installed"
}
elseif (Ask -Text "Would you like to install Git?" -Default "Y")
{
    Write-Information 'Installing Git'
    choco upgrade -y git --params "'/GitAndUnixToolsOnPath /WindowsTerminalProfile'" --params-global
    $Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")  
}

$git_global_username = git config --global user.name
$git_global_email = git config --global user.email
if (([string]::IsNullOrWhiteSpace($git_global_username)) -or ([string]::IsNullOrWhiteSpace($git_global_email)))
{
    if (Ask -Text "Would you like to set global Git configurations now?" -Default "Y") {
        Write-Information 'Setting up Git'
        git config --global user.name "$Env:GIT_USER_NAME"
        git config --global user.name
        git config --global user.email "$Env:GIT_EMAIL"
        git config --global user.email
    }    
}
else
{
    Write-Information 'Get global username and email already set'
}


# Create id_rsa file to use with GitHub
Write-Information "An id_rsa file will be needed to setup online services like GitHub."
if (Test-Path -PathType Leaf "$Env:USERPROFILE\.ssh\id_rsa")
{
    Write-Information "Private key ~/.ssh/id_rsa already created"
}
elseif (Ask -Text "Would you like to create ~/.ssh/id_rsa now?" -Default "Y")
{
    Write-Information "Creating ~/.ssh/id_rsa file"
    if (!(Test-Path -PathType Leaf "$Env:USERPROFILE\.ssh\id_rsa"))
    {
        ssh-keygen -t rsa -b 4096 -C "$Env:ID_RSA_EMAIL"
    }
}


# Setup GitHub
if (Get-Check-Point "GITHUB")
{
    Write-Information "GitHub already configured before"
}
elseif (Ask -Text "Would you like to setup GitHub now?" -Default "Y")
{
    if (Test-Path -PathType Leaf "$Env:USERPROFILE\.ssh\id_rsa.pub")
    {
        Write-Information "Paste the following content:"
        Write-Information ""
        Get-Content "$Env:USERPROFILE\.ssh\id_rsa.pub"
        Write-Information ""
        Write-Information "at: https://github.com/settings/ssh/new"
        Read-Host "Press Enter to continue"
    }
    else {
        Write-Information "Could not find id_rsa.pub file"
    }

    Set-Check-Point "GITHUB"
}


# Create Projects directory
if (Test-Path -PathType Container "D:\Projects")
{
    Write-Information "D:\Projects already created"
}
elseif (Ask -Text "Would you like to create D:\Projects directory now?" -Default "Y") {
    Write-Information 'Creating Projects directory'
    Write-Information "    There are 2 ways of creating the projects folder."
    Write-Information "1) Just create folder"
    Write-Information "2) Use SyncThing + SyncTrayzor to synchronize with another computer"
    $choice = Multiple-Options -Text "Choose an option" -Options @( "1", "2" )
    if ($choice -eq "1")
    {
        md -Force "D:\Projects"
    }
    if ($choice -eq "2")
    {
        choco upgrade -y synctrayzor
        Write-Information "Use SyncTrayzor to synchronize the Projects folder now"
    }
}


# Projects firewall exclusion
if (Get-Check-Point "FIREWALL_EXCLUSION_PROJECTS")
{
    Write-Information "Firewall exclusion for Projects already configured before"
}
elseif (Ask -Text "Would you like to create a firewall exclusion for D:\Projects directory now?" -Default "Y")
{
    Add-MpPreference -ExclusionPath "D:\Projects"
    Set-Check-Point "FIREWALL_EXCLUSION_PROJECTS"
}


# Cloning Windows-11-Scripts
if (Test-Path -PathType Container "D:\Projects\Windows-11-Scripts")
{
    Write-Information "D:\Projects\Windows-11-Scripts already cloned"
}
elseif (Ask -Text "Would you like to clone Windows-11-Scripts now?" -Default "Y")
{
    if (Test-Path -PathType Container "D:\Projects")
    {
        Write-Information 'Cloning Windows-11-Scripts'
        pushd "D:\Projects"
        git clone "git@github.com:masbicudo/Windows-11-Scripts.git"
        Invoke-Item ".\Windows-11-Scripts"
        popd
    }
    Write-Information 'Copying .env file to project directory'
    $location = (Get-Location).Path
    if (!($location -eq "D:\Projects\Windows-11-Scripts")) {
        if ((Test-Path -PathType Leaf ".env"))
        {
            cp ".env" "D:\Projects\Windows-11-Scripts\" -Force
        }
    }
}


# Done
Write-Information 'Basic install is done.'

# Other operations
while (Test-Path -PathType Container "D:\Projects\Windows-11-Scripts")
{
    cd "D:\Projects\Windows-11-Scripts"

    Write-Information 'You can now run other setup steps:'
    Write-Information '1) common-install.ps1: installs common tools, such as VS Code, Everything, and so on'
    Write-Information '2) clone-my-projects.ps1: clones projects from GitHub'
    Write-Information '3) python-basic-tools.ps1: installs basic Python tools'
    Write-Information 'Q) quit'
    $choice = Multiple-Options -Text "Choose an option" -Options @( "1", "2", "3", "q" )
    $choice = $choice.ToLower()
    if ($choice -eq "1")
    {
        .\common-install.ps1
    }
    if ($choice -eq "2")
    {
        .\clone-my-projects.ps1
    }
    if ($choice -eq "3")
    {
        .\python-basic-tools.ps1
    }
    if ($choice -eq "q")
    {
        break
    }

}

Write-Information 'Done'
