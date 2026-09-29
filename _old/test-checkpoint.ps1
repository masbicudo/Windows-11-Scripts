# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

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


if (!(Get-Check-Point "XPTO"))
{
    Write-Information "First time"
    Set-Check-Point "XPTO"
}
else {
    Write-Information "Not first time"
}
