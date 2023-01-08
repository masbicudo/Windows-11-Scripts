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
