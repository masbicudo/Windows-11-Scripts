
<#
.SYNOPSIS
    Sets a known folders path using SHSetKnownFolderPath.
.PARAMETER Folder
    The known folder whose path to set.
.PARAMETER Path
    The path.
#>
function Load-DotEnv {
    Param (
        [string]$FileName
    )
    
    if ([string]::IsNullOrWhiteSpace($FileName))
    {
        $FileName = ".env"
    }

    switch -File $FileName {
        default {
            $name, $value = $_.Trim() -split '=', 2
            if ($name -and $name[0] -ne '#') { # ignore blank and comment lines.
                Write-Information -MessageData "Env:$name = $value"
                Set-Item "Env:$name" $value
            }
        }
    }
}