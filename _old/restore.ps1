param(
    [Parameter(Mandatory)]
    [string]$BackupRoot,

    [switch]$RestoreRegistry,
    [switch]$RestoreScheduledTasks,
    [switch]$RestoreAnyDesk,
    [switch]$RestoreWslDistros,
    [switch]$WhatIf
)

$ErrorActionPreference = "Stop"

function Assert-BackupRoot {
    if (-not (Test-Path -LiteralPath $BackupRoot)) {
        throw "Backup root not found: $BackupRoot"
    }

    $manifestPath = Join-Path $BackupRoot "manifest.json"
    if (Test-Path -LiteralPath $manifestPath) {
        $script:Manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
    }
    else {
        Write-Warning "manifest.json not found. Restore will still copy files from the backup folder layout."
    }
}

function Invoke-Step {
    param(
        [Parameter(Mandatory)][string]$Message,
        [Parameter(Mandatory)][scriptblock]$Action
    )

    if ($WhatIf) {
        Write-Host "WhatIf: $Message"
        return
    }

    Write-Host $Message
    & $Action
}

function Restore-FileTree {
    param(
        [Parameter(Mandatory)][string]$SourceRoot
    )

    if (-not (Test-Path -LiteralPath $SourceRoot)) {
        return
    }

    Get-ChildItem -LiteralPath $SourceRoot -Directory -Force | ForEach-Object {
        $driveName = $_.Name
        $targetRoot = "{0}:\" -f $driveName
        Get-ChildItem -LiteralPath $_.FullName -Force | ForEach-Object {
            $source = $_.FullName
            Invoke-Step "Restoring $source -> $targetRoot" {
                Copy-Item -LiteralPath $source -Destination $targetRoot -Recurse -Force
            }
        }
    }
}

function Restore-ManifestFiles {
    if (-not $script:Manifest -or -not $script:Manifest.Items) {
        return $false
    }

    foreach ($entry in $script:Manifest.Items | Where-Object { $_.Status -eq "Copied" -and $_.Destination }) {
        $source = if ($entry.DestinationRelative) {
            Join-Path $BackupRoot $entry.DestinationRelative
        }
        else {
            $entry.Destination
        }
        $target = $_.Source

        if (-not (Test-Path -LiteralPath $source)) {
            Write-Warning "Backup item missing: $source"
            continue
        }

        $item = Get-Item -LiteralPath $source -Force
        if ($item.PSIsContainer) {
            Invoke-Step "Restoring $source -> $target" {
                New-Item -ItemType Directory -Force -Path $target | Out-Null
                Get-ChildItem -LiteralPath $source -Force | ForEach-Object {
                    Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse -Force
                }
            }
        }
        else {
            Invoke-Step "Restoring $source -> $target" {
                New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
                Copy-Item -LiteralPath $source -Destination $target -Force
            }
        }
    }

    return $true
}

function Restore-RegistryFiles {
    $registryDir = Join-Path $BackupRoot "registry"
    if (-not (Test-Path -LiteralPath $registryDir)) {
        Write-Host "No registry backup folder found."
        return
    }

    Get-ChildItem -LiteralPath $registryDir -Filter "*.reg" -Force | ForEach-Object {
        $file = $_.FullName
        Invoke-Step "Importing registry file: $file" {
            & reg.exe import $file | Out-Host
            if ($LASTEXITCODE -ne 0) {
                throw "Registry import failed: $file"
            }
        }
    }
}

function Restore-ScheduledTaskFiles {
    $tasksDir = Join-Path $BackupRoot "scheduled-tasks"
    if (-not (Test-Path -LiteralPath $tasksDir)) {
        Write-Host "No scheduled task backup folder found."
        return
    }

    Get-ChildItem -LiteralPath $tasksDir -Filter "*.xml" -Force | ForEach-Object {
        $file = $_.FullName
        $taskName = [IO.Path]::GetFileNameWithoutExtension($_.Name)
        Invoke-Step "Registering scheduled task: $taskName" {
            Register-ScheduledTask -TaskName $taskName -Xml (Get-Content -LiteralPath $file -Raw) -Force | Out-Null
        }
    }
}

function Stop-AnyDeskForRestore {
    Invoke-Step "Stopping AnyDesk before restoring identity/config files" {
        Get-Process -Name "AnyDesk" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        Get-Service -Name "AnyDesk*" -ErrorAction SilentlyContinue | Stop-Service -Force -ErrorAction SilentlyContinue
    }
}

function Restore-WslDistroExports {
    $wslDir = Join-Path $BackupRoot "wsl-distros"
    if (-not (Test-Path -LiteralPath $wslDir)) {
        Write-Host "No WSL distro export folder found."
        return
    }

    Get-ChildItem -LiteralPath $wslDir -Filter "*.tar" -Force | ForEach-Object {
        $name = [IO.Path]::GetFileNameWithoutExtension($_.Name)
        $target = Join-Path $env:LOCALAPPDATA (Join-Path "WSL" $name)
        Invoke-Step "Importing WSL distro $name -> $target" {
            New-Item -ItemType Directory -Force -Path $target | Out-Null
            wsl.exe --import $name $target $_.FullName
        }
    }
}

Assert-BackupRoot

Write-Host "Restore source: $BackupRoot"
Write-Host "Default restore copies files only. Registry, tasks, AnyDesk stop/start, and WSL imports require switches."

if ($RestoreAnyDesk) {
    Stop-AnyDeskForRestore
}

if (-not (Restore-ManifestFiles)) {
    Restore-FileTree -SourceRoot (Join-Path $BackupRoot "files\user-profile")
    Restore-FileTree -SourceRoot (Join-Path $BackupRoot "files\app-data")
    Restore-FileTree -SourceRoot (Join-Path $BackupRoot "files\powershell")
    Restore-FileTree -SourceRoot (Join-Path $BackupRoot "files\large-app-state")
}

if ($RestoreRegistry) {
    Restore-RegistryFiles
}

if ($RestoreScheduledTasks) {
    Restore-ScheduledTaskFiles
}

if ($RestoreWslDistros) {
    Restore-WslDistroExports
}

if ($RestoreAnyDesk -and -not $WhatIf) {
    Get-Service -Name "AnyDesk*" -ErrorAction SilentlyContinue | Start-Service -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "Restore complete."
Write-Host "Restart Windows after registry, AnyDesk, WSL, or shell profile restore."
