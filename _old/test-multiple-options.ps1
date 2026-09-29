# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

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

while ($true)
{
    Write-Information -MessageData '1) Print "Hello!"'
    Write-Information -MessageData '2) Print "Hi!"'
    Write-Information -MessageData 'Q) quit'
    $choice = Multiple-Options -Text "Choose an option" -Options @( "1", "2", "q" )
    $choice = $choice.ToLower()
    if ($choice -eq "1")
    {
        Write-Host "Hello!" -ForegroundColor DarkGreen
    }
    if ($choice -eq "2")
    {
        Write-Host "Hi!" -ForegroundColor DarkGreen
    }
    if ($choice -eq "q")
    {
        Write-Host "Quitting" -ForegroundColor DarkGreen
        break
    }
    if ($choice -eq "invalid")
    {
        Write-Host "Invalid option" -ForegroundColor DarkRed
    }
}


while ($true)
{
    Write-Information -MessageData '1) Print "Hello!"'
    Write-Information -MessageData '2) Print "Hi!"'
    Write-Information -MessageData 'Q) quit'
    $choice = Multiple-Options -Text "Choose an option" -Options @( "1", "2", "q" ) -Default "q"
    $choice = $choice.ToLower()
    if ($choice -eq "1")
    {
        Write-Host "Hello!" -ForegroundColor DarkGreen
    }
    if ($choice -eq "2")
    {
        Write-Host "Hi!" -ForegroundColor DarkGreen
    }
    if ($choice -eq "q")
    {
        Write-Host "Quitting" -ForegroundColor DarkGreen
        break
    }
    if ($choice -eq "invalid")
    {
        Write-Host "Invalid option" -ForegroundColor DarkRed
    }
}
