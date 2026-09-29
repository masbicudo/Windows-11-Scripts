
# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

function Clone
{
    [CmdletBinding()]
    param (
        [string]$Owner,
        [Parameter(Mandatory)]
        [string]$Repository
    )
    
    Write-Information "Cloning/Updating $Repository"

    if ([string]::IsNullOrWhiteSpace($Owner)) {
        $Owner = "masbicudo"
    }

    if (!(Test-Path -PathType Container "$Repository"))
    {
        try {
            git clone "git@github.com:$Owner/$Repository.git"
        }
        catch {
            <#Do this if a terminating exception happens#>
        }
    }
    else
    {
        pushd "$Repository"
        try {
            git pull
        }
        finally {
            popd
        }
    }
}


pushd D:\Projects
try {
    Clone -Repository "Windows-11-Scripts"
    Clone -Repository "MoveShortcuts"
    Clone -Repository "lambda2js" -Owner "gearz-lab"
    Clone -Repository "Pandoc-Emojis-Filter"
    Clone -Repository "oqueeh"
    Clone -Repository "MS-SHLLINK.Net"
    Clone -Repository "masbicudo.github.io"
    Clone -Repository "Windows-10-Scripts"
    Clone -Repository "PlotInPy"
    Clone -Repository "git-scripts"
    Clone -Repository "WebGL-Tutorials"
    Clone -Repository "Mini-Web-Server"
    Clone -Repository "SimpleInjector.Advanced"
    Clone -Repository "SHA-3-FIPS-202"
    Clone -Repository "Windows-Scripts"
    Clone -Repository "NHibernate.JsonColumn"
    Clone -Repository "CVSS-MatLab"
    Clone -Repository "LetsEncrypt-Certificate-Creator"
    Clone -Repository "CVSS-Js"
    Clone -Repository "Chrono-Types"
    Clone -Repository "Fluent-Json.NET"
    Clone -Repository "My-Environment"
    Clone -Repository "colab-scripts"
    Clone -Repository "Cross-References-and-Lists-Add-on"
    Clone -Repository "Textructor"
    Clone -Repository "Trabalhos-UFRJ"
    Clone -Repository "Mathematics-Learning-Tools"
    Clone -Repository "Either-Type-DotNet"
    Clone -Repository "UFRJ-Trabalho-SO-Escalonador"
    Clone -Repository "gramdel"
}
finally {
    popd
}
