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
