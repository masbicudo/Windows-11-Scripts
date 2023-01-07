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
