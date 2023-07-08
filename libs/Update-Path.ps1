
<#
.SYNOPSIS
    Updates the environment variable PATH from the registry.
#>
function Update-Path {
    Param (
    )
    
    $Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")  
}