param(
    [string]$BackupRoot = (Join-Path $PSScriptRoot ("backup-{0}-{1}" -f $env:COMPUTERNAME, (Get-Date -Format "yyyyMMdd-HHmmss"))),
    [switch]$ExportWslDistros,
    [switch]$IncludeLargeAppState
)

$ErrorActionPreference = "Stop"

function New-Directory {
    param([Parameter(Mandatory)][string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Force -Path $Path | Out-Null
    }
}

function Convert-ToBackupPath {
    param(
        [Parameter(Mandatory)][string]$RootName,
        [Parameter(Mandatory)][string]$SourcePath
    )

    $drive = [IO.Path]::GetPathRoot($SourcePath).TrimEnd("\").TrimEnd(":")
    $relative = $SourcePath.Substring([IO.Path]::GetPathRoot($SourcePath).Length)
    Join-Path $BackupRoot (Join-Path "files" (Join-Path $RootName (Join-Path $drive $relative)))
}

function Copy-BackupItem {
    param(
        [Parameter(Mandatory)][string]$Source,
        [Parameter(Mandatory)][string]$RootName,
        [string[]]$ExcludeNames = @()
    )

    $expanded = [Environment]::ExpandEnvironmentVariables($Source)
    if (-not (Test-Path -LiteralPath $expanded)) {
        $script:Manifest.Items += [pscustomobject]@{ Source = $expanded; Status = "Missing"; Destination = $null }
        Write-Host "Missing: $expanded"
        return
    }

    $destination = Convert-ToBackupPath -RootName $RootName -SourcePath $expanded
    New-Directory -Path (Split-Path -Parent $destination)

    $item = Get-Item -LiteralPath $expanded -Force
    if ($item.PSIsContainer) {
        New-Directory -Path $destination
        Get-ChildItem -LiteralPath $expanded -Force | Where-Object { $_.Name -notin $ExcludeNames } | ForEach-Object {
            Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse -Force
        }
    }
    else {
        Copy-Item -LiteralPath $expanded -Destination $destination -Force
    }

    $relativeDestination = $destination.Substring($BackupRoot.TrimEnd("\").Length + 1)
    $script:Manifest.Items += [pscustomobject]@{ Source = $expanded; Status = "Copied"; Destination = $destination; DestinationRelative = $relativeDestination }
    Write-Host "Copied: $expanded"
}

function Export-RegistryKey {
    param(
        [Parameter(Mandatory)][string]$Key,
        [Parameter(Mandatory)][string]$FileName
    )

    $target = Join-Path $BackupRoot (Join-Path "registry" $FileName)
    New-Directory -Path (Split-Path -Parent $target)

    $null = & reg.exe export $Key $target /y 2>$null
    if ($LASTEXITCODE -eq 0) {
        $script:Manifest.Registry += [pscustomobject]@{ Key = $Key; Status = "Exported"; File = $target }
        Write-Host "Exported registry: $Key"
    }
    else {
        $script:Manifest.Registry += [pscustomobject]@{ Key = $Key; Status = "MissingOrDenied"; File = $target }
        Write-Host "Skipped registry: $Key"
    }
}

function Export-BackupScheduledTask {
    param([Parameter(Mandatory)][string]$TaskName)

    $safeName = ($TaskName -replace '[\\/:*?"<>|]', "_") + ".xml"
    $target = Join-Path $BackupRoot (Join-Path "scheduled-tasks" $safeName)
    New-Directory -Path (Split-Path -Parent $target)

    try {
        ScheduledTasks\Export-ScheduledTask -TaskName $TaskName | Set-Content -LiteralPath $target -Encoding UTF8
        $script:Manifest.ScheduledTasks += [pscustomobject]@{ TaskName = $TaskName; Status = "Exported"; File = $target }
        Write-Host "Exported scheduled task: $TaskName"
    }
    catch {
        $script:Manifest.ScheduledTasks += [pscustomobject]@{ TaskName = $TaskName; Status = "MissingOrDenied"; File = $target }
        Write-Host "Skipped scheduled task: $TaskName"
    }
}

New-Directory -Path $BackupRoot

$script:Manifest = [ordered]@{
    CreatedAt = (Get-Date).ToString("o")
    ComputerName = $env:COMPUTERNAME
    UserName = $env:USERNAME
    Notes = @(
        "This backup includes secrets and machine identity material: AnyDesk IDs/aliases, SSH keys, Git credentials, cloud CLI tokens, and rclone config.",
        "This backup also includes Copilot chat memory files under Code globalStorage so your saved preferences can be restored.",
        "Store it encrypted or on trusted media before reinstalling Windows."
    )
    Items = @()
    Registry = @()
    ScheduledTasks = @()
}

Write-Host "Backup root: $BackupRoot"

# User identity and developer shell state.
$userItems = @(
    "%USERPROFILE%\.wslconfig",
    "%USERPROFILE%\.ssh",
    "%USERPROFILE%\.gnupg",
    "%USERPROFILE%\.gitconfig",
    "%USERPROFILE%\.gitconfig.backup",
    "%USERPROFILE%\.git-credentials",
    "%USERPROFILE%\.kdiff3rc",
    "%USERPROFILE%\.bashrc",
    "%USERPROFILE%\.bash_profile",
    "%USERPROFILE%\.npmrc",
    "%USERPROFILE%\.boto",
    "%USERPROFILE%\.aws",
    "%USERPROFILE%\.azure",
    "%USERPROFILE%\.gsutil",
    "%USERPROFILE%\.docker",
    "%USERPROFILE%\.config\diffuse",
    "%USERPROFILE%\.config\configstore"
)

foreach ($item in $userItems) {
    Copy-BackupItem -Source $item -RootName "user-profile"
}

# App settings that are either custom, identity-bearing, or tedious to recreate.
$appItems = @(
    "%APPDATA%\AnyDesk\service.conf",
    "%APPDATA%\AnyDesk\system.conf",
    "%APPDATA%\AnyDesk\user.conf",
    "%ProgramData%\AnyDesk\service.conf",
    "%ProgramData%\AnyDesk\system.conf",
    "%APPDATA%\rclone\rclone.conf",
    "%APPDATA%\SyncTrayzor\config.xml",
    "%LOCALAPPDATA%\Syncthing",
    "%APPDATA%\Code\User\settings.json",
    "%APPDATA%\Code\User\keybindings.json",
    "%APPDATA%\Code\User\snippets",
    "%APPDATA%\Code\User\globalStorage\github.copilot-chat\memory-tool\memories",
    "%APPDATA%\Code - Insiders\User\settings.json",
    "%APPDATA%\Code - Insiders\User\keybindings.json",
    "%APPDATA%\Code - Insiders\User\snippets",
    "%APPDATA%\Code - Insiders\User\globalStorage\github.copilot-chat\memory-tool\memories",
    "%APPDATA%\qBittorrent\qBittorrent.ini",
    "%APPDATA%\qBittorrent\qBittorrent-data.ini",
    "%APPDATA%\qBittorrent\categories.json",
    "%APPDATA%\qBittorrent\watched_folders.json",
    "%APPDATA%\obs-studio\global.ini",
    "%APPDATA%\obs-studio\user.ini",
    "%APPDATA%\obs-studio\basic",
    "%APPDATA%\obs-studio\plugin_config",
    "%APPDATA%\WinAuth",
    "%APPDATA%\Notepad++",
    "%APPDATA%\SumatraPDF",
    "%APPDATA%\IrfanView",
    "%APPDATA%\WinMerge",
    "%APPDATA%\FastCopy",
    "%APPDATA%\Everything",
    "%APPDATA%\Postman",
    "%APPDATA%\DBeaverData"
)

foreach ($item in $appItems) {
    Copy-BackupItem -Source $item -RootName "app-data" -ExcludeNames @("logs", "cache", "Cache", "GPUCache", "Code Cache", "crashes", "updates")
}

if ($IncludeLargeAppState) {
    $largeItems = @(
        "%USERPROFILE%\.VirtualBox",
        "%USERPROFILE%\VirtualBox VMs",
        "%LOCALAPPDATA%\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm",
        "%APPDATA%\discord",
        "%APPDATA%\Telegram Desktop"
    )

    foreach ($item in $largeItems) {
        Copy-BackupItem -Source $item -RootName "large-app-state" -ExcludeNames @("Cache", "GPUCache", "Code Cache", "logs", "tmp")
    }
}

# PowerShell profiles are spread across Windows PowerShell and PowerShell 7.
$profilePaths = @(
    (powershell.exe -NoProfile -Command '$PROFILE.CurrentUserAllHosts'),
    (powershell.exe -NoProfile -Command '$PROFILE.CurrentUserCurrentHost')
)

if (Get-Command pwsh.exe -ErrorAction SilentlyContinue) {
    $profilePaths += (pwsh.exe -NoProfile -Command '$PROFILE.CurrentUserAllHosts')
    $profilePaths += (pwsh.exe -NoProfile -Command '$PROFILE.CurrentUserCurrentHost')
}

$profilePaths | Select-Object -Unique | ForEach-Object {
    Copy-BackupItem -Source $_ -RootName "powershell"
}

# Registry customizations from masb-avell-install.ps1 plus common app settings.
Export-RegistryKey -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -FileName "HKCU-Explorer-Advanced.reg"
Export-RegistryKey -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" -FileName "HKCU-Search.reg"
Export-RegistryKey -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\Flighting" -FileName "HKCU-Search-Flighting.reg"
Export-RegistryKey -Key "HKCU\Software\Policies\Microsoft\Windows\Explorer" -FileName "HKCU-Policy-Windows-Explorer.reg"
Export-RegistryKey -Key "HKLM\SOFTWARE\Policies\Microsoft\Edge" -FileName "HKLM-Policy-Edge.reg"
Export-RegistryKey -Key "HKLM\SOFTWARE\Policies\Microsoft\Dsh" -FileName "HKLM-Policy-Dsh.reg"
Export-RegistryKey -Key "HKCU\Environment" -FileName "HKCU-Environment.reg"
Export-RegistryKey -Key "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" -FileName "HKLM-Environment.reg"

# Scheduled tasks created by masb-avell-install.ps1.
@(
    "GoogleDrive Early Start",
    "Start SyncThing Delayed",
    "Start OneDrive Delayed",
    "Start Synology Delayed"
) | ForEach-Object { Export-BackupScheduledTask -TaskName $_ }

# Inventory outputs help rebuild the machine even when a package cannot be restored directly.
$inventoryDir = Join-Path $BackupRoot "inventory"
New-Directory -Path $inventoryDir

Get-ComputerInfo | ConvertTo-Json -Depth 3 | Set-Content -LiteralPath (Join-Path $inventoryDir "computer-info.json") -Encoding UTF8
Get-ChildItem Env: | Sort-Object Name | ConvertTo-Json -Depth 3 | Set-Content -LiteralPath (Join-Path $inventoryDir "environment.json") -Encoding UTF8

if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    choco list --local-only | Set-Content -LiteralPath (Join-Path $inventoryDir "choco-list.txt") -Encoding UTF8
}

if (Get-Command winget.exe -ErrorAction SilentlyContinue) {
    winget list | Set-Content -LiteralPath (Join-Path $inventoryDir "winget-list.txt") -Encoding UTF8
    winget export -o (Join-Path $inventoryDir "winget-export.json") --accept-source-agreements | Out-Null
}

if (Get-Command wsl.exe -ErrorAction SilentlyContinue) {
    wsl.exe --list --verbose | Set-Content -LiteralPath (Join-Path $inventoryDir "wsl-list.txt") -Encoding UTF8

    if ($ExportWslDistros) {
        $wslDir = Join-Path $BackupRoot "wsl-distros"
        New-Directory -Path $wslDir
        $distros = (& wsl.exe --list --quiet) | Where-Object { $_ -and $_.Trim() }
        foreach ($distro in $distros) {
            $cleanName = ($distro.Trim() -replace '[\\/:*?"<>|]', "_")
            Write-Host "Exporting WSL distro: $distro"
            wsl.exe --export $distro (Join-Path $wslDir "$cleanName.tar")
        }
    }
}

$script:Manifest | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $BackupRoot "manifest.json") -Encoding UTF8

Write-Host ""
Write-Host "Backup complete."
Write-Host "Review and encrypt/store safely: $BackupRoot"
