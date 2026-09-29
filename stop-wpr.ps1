param(
    [switch]$Fix
)

$ErrorActionPreference = "Continue"

$patterns = @(
    "wpr",
    "wprui",
    "xperf",
    "wpa",
    "Windows Performance Recorder",
    "Windows Performance Toolkit"
)

function Test-MatchAny {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return $false }
    foreach ($p in $patterns) {
        if ($Text -match [regex]::Escape($p)) { return $true }
    }
    return $false
}

function Header($text) {
    Write-Host ""
    Write-Host "==== $text ====" -ForegroundColor Cyan
}

function Warn($text) {
    Write-Host "[!] $text" -ForegroundColor Yellow
}

function Good($text) {
    Write-Host "[OK] $text" -ForegroundColor Green
}

function Action($text) {
    Write-Host "[ACTION] $text" -ForegroundColor Magenta
}

$log = Join-Path $env:USERPROFILE "Desktop\wpr_cleanup_report_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
Start-Transcript -Path $log -Force | Out-Null

Header "Modo"
if ($Fix) {
    Warn "Rodando em modo CORREÇÃO. O script tentará desativar/remover entradas suspeitas."
} else {
    Good "Rodando em modo somente verificação. Nada será alterado."
    Write-Host "Para corrigir, rode: .\Stop-WPR-Autostart.ps1 -Fix"
}

Header "Verificando privilégio de administrador"
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Warn "Não está rodando como administrador. Algumas correções não funcionarão."
} else {
    Good "Rodando como administrador."
}

Header "Status atual do WPR"
try {
    wpr -status
} catch {
    Warn "Não foi possível executar wpr -status"
}

Header "Cancelando boot trace do WPR, se existir"
if ($Fix) {
    try {
        Action "Executando: wpr -cancelboot"
        wpr -cancelboot
    } catch {
        Warn "Falhou: wpr -cancelboot"
    }

    try {
        Action "Executando: wpr -cancel"
        wpr -cancel
    } catch {
        Warn "Falhou: wpr -cancel"
    }
} else {
    Write-Host "Com -Fix, o script executará:"
    Write-Host "  wpr -cancelboot"
    Write-Host "  wpr -cancel"
}

Header "Procurando arquivos WPR gigantes no TEMP"
$tempPaths = @(
    $env:TEMP,
    "$env:LOCALAPPDATA\Temp",
    "C:\Windows\Temp"
) | Select-Object -Unique

foreach ($tp in $tempPaths) {
    if (Test-Path $tp) {
        Write-Host "Verificando: $tp"
        Get-ChildItem $tp -Filter "WPR_initiated_*" -ErrorAction SilentlyContinue | ForEach-Object {
            $gb = [math]::Round($_.Length / 1GB, 2)
            Warn "Encontrado: $($_.FullName) [$gb GB]"

            if ($Fix) {
                try {
                    Action "Removendo $($_.FullName)"
                    Remove-Item $_.FullName -Force
                } catch {
                    Warn "Não consegui remover: $($_.FullName)"
                }
            }
        }
    }
}

Header "Procurando tarefas agendadas suspeitas"
$tasks = Get-ScheduledTask -ErrorAction SilentlyContinue

foreach ($task in $tasks) {
    $taskText = @(
        $task.TaskName
        $task.TaskPath
        ($task.Actions | Out-String)
        ($task.Triggers | Out-String)
    ) -join "`n"

    if (Test-MatchAny $taskText) {
        Warn "Tarefa suspeita: $($task.TaskPath)$($task.TaskName)"
        Write-Host ($task.Actions | Out-String)

        if ($Fix) {
            try {
                Action "Desativando tarefa: $($task.TaskPath)$($task.TaskName)"
                Disable-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath | Out-Null
            } catch {
                Warn "Falhou ao desativar tarefa: $($task.TaskPath)$($task.TaskName)"
            }
        }
    }
}

Header "Procurando entradas Run/RunOnce no Registro"
$runKeys = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\RunOnce"
)

foreach ($key in $runKeys) {
    if (Test-Path $key) {
        Write-Host "Verificando: $key"
        $props = Get-ItemProperty $key

        foreach ($prop in $props.PSObject.Properties) {
            if ($prop.Name -like "PS*") { continue }

            $name = $prop.Name
            $value = [string]$prop.Value

            if (Test-MatchAny "$name $value") {
                Warn "Entrada suspeita em ${key}: $name = $value"

                if ($Fix) {
                    try {
                        Action "Removendo entrada: $name"
                        Remove-ItemProperty -Path $key -Name $name -Force
                    } catch {
                        Warn "Falhou ao remover entrada: $name"
                    }
                }
            }
        }
    }
}

Header "Procurando atalhos na inicialização"
$startupFolders = @(
    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
)

$wsh = New-Object -ComObject WScript.Shell

foreach ($folder in $startupFolders) {
    if (Test-Path $folder) {
        Write-Host "Verificando: $folder"

        Get-ChildItem $folder -File -ErrorAction SilentlyContinue | ForEach-Object {
            $suspicious = $false
            $info = $_.FullName

            if ($_.Extension -ieq ".lnk") {
                try {
                    $shortcut = $wsh.CreateShortcut($_.FullName)
                    $info = "$($_.FullName) -> $($shortcut.TargetPath) $($shortcut.Arguments)"
                } catch {}
            }

            if (Test-MatchAny $info) {
                Warn "Item suspeito na inicialização: $info"

                if ($Fix) {
                    try {
                        Action "Removendo item de inicialização: $($_.FullName)"
                        Remove-Item $_.FullName -Force
                    } catch {
                        Warn "Falhou ao remover: $($_.FullName)"
                    }
                }
            }
        }
    }
}

Header "Procurando Autologgers relacionados a WPR"
$autologgerPath = "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger"

if (Test-Path $autologgerPath) {
    Get-ChildItem $autologgerPath -ErrorAction SilentlyContinue | ForEach-Object {
        $name = $_.PSChildName
        $full = $_.PSPath

        $text = $name
        try {
            $props = Get-ItemProperty $full
            $text += "`n" + ($props | Out-String)
        } catch {}

        if (Test-MatchAny $text) {
            Warn "Autologger suspeito: $name"

            if ($Fix) {
                try {
                    Action "Desativando Autologger: $name"
                    Set-ItemProperty -Path $full -Name "Start" -Value 0 -Force
                } catch {
                    Warn "Falhou ao desativar Autologger: $name"
                }
            }
        }
    }
}

Header "Sessões ETW atualmente em execução"
try {
    logman query -ets
} catch {
    Warn "Falhou ao executar logman query -ets"
}

Header "Processos relacionados"
Get-Process | Where-Object {
    $_.ProcessName -match "wpr|wprui|xperf|wpa|perf"
} | Format-Table -AutoSize

Header "Resumo"
if ($Fix) {
    Good "Correções tentadas. Recomendo reiniciar agora."
    Write-Host "Depois do reboot, rode:"
    Write-Host "  wpr -status"
    Write-Host "  logman query -ets"
} else {
    Good "Verificação concluída. Nenhuma alteração foi feita."
    Write-Host "Relatório salvo em: $log"
    Write-Host "Para corrigir, rode novamente com:"
    Write-Host "  .\Stop-WPR-Autostart.ps1 -Fix"
}

Stop-Transcript | Out-Null