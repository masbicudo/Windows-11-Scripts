
# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

. .\libs\Set-KnownFolderPath.ps1
. .\libs\Refresh-Explorer.ps1

function Move-Special-Folder
{

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$KnownFolder,
        [Parameter(Mandatory)]
        [string]$Path
    )

    $source = ""
    if ($KnownFolder -eq "Downloads")
    {
        $source = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
    }
    else {
        $source = [Environment]::GetFolderPath("$KnownFolder")
    }
    $target = "$Path"

    if ($source -eq $target) {
        Write-Information -MessageData "No need to move $KnownFolder"
        Write-Information -MessageData "    Already at $target"
    }
    else {
        Write-Information -MessageData "Moving $KnownFolder"
        Write-Information -MessageData "    From $source"
        Write-Information -MessageData "    To $target"
    
        ii $source
        md $target -Force
        ii $target
        Set-KnownFolderPath -KnownFolder $KnownFolder -Path $Path
        Get-ChildItem -Path "$source\*" -Force | Move-Item -Destination "$target\" -Force
    }
}

Move-Special-Folder -KnownFolder 'Desktop' -Path 'D:\Desktop'
Move-Special-Folder -KnownFolder 'Downloads' -Path 'D:\Downloads'

Refresh-Explorer
