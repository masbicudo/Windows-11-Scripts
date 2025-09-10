# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
}

# Package Management
# Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco upgrade -y chocolatey
choco upgrade -y chocolateygui

# Runtime Dependencies
choco upgrade -y vcredist-all
choco upgrade -y dotnet3.5
choco upgrade -y dotnet4.5
choco upgrade -y dotnet4.5.1
choco upgrade -y dotnet4.5.2
choco upgrade -y dotnet4.6.1
choco upgrade -y dotnet4.6.2
choco upgrade -y netfx-4.7.2
choco upgrade -y dotnetfx # 4.8
choco upgrade -y dotnet
choco upgrade -y dotnet-6.0-runtime
choco upgrade -y dotnet-7.0-runtime
choco upgrade -y dotnet-8.0-runtime
choco upgrade -y dotnet-9.0-runtime
choco upgrade -y dotnet-10.0-runtime --pre
choco upgrade -y dotnet-6.0-desktopruntime
choco upgrade -y dotnet-7.0-desktopruntime
choco upgrade -y dotnet-8.0-desktopruntime
choco upgrade -y dotnet-9.0-desktopruntime
choco upgrade -y dotnet-10.0-desktopruntime --pre
choco upgrade -y javaruntime
choco upgrade -y jre8

# MSYS2 and MinGW
choco upgrade -y msys2
choco upgrade -y mingw

# WSL
#dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
#dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
#abra https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
#wsl --set-default-version 2
#choco upgrade -y wsl-ubuntu-2004

# Development GUI Tools
choco upgrade -y vscode
choco upgrade -y vscode-insiders
#choco upgrade -y visualstudio-installer
choco upgrade -y notepadplusplus
choco upgrade -y gitextensions
choco upgrade -y winmerge # 2-way diff tool, supports folders
choco upgrade -y kdiff3   # 3-way diff tool, used by git
choco upgrade -y diffuse  # N-way diff tool

# Database Tools
choco upgrade -y sqlitebrowser
choco upgrade -y dbeaver
choco upgrade -y pgadmin4
choco uninstall -y postgresql11
choco uninstall -y postgresql12
choco uninstall -y postgresql13
choco upgrade -y postgresql14 --params '/Password:mig29' --params-global
choco uninstall -y postgresql15
choco uninstall -y postgresql16
choco upgrade -y postgresql17 --params '/Password:mig29' --params-global

# Other Dev Tools
choco upgrade -y tad # csv viewer and editor
choco upgrade -y nginx # web server
choco upgrade -y win-acme # SSL - letsencrypt client for windows

# Network Debugging Tools
choco upgrade -y wireshark
choco upgrade -y postman
choco upgrade -y fiddler

# Development CLI Tools
choco upgrade -y git --params "'/GitAndUnixToolsOnPath /WindowsTerminalProfile'" --params-global
choco upgrade -y cmake

# Virtualization
choco upgrade -y docker
choco upgrade -y virtualbox
choco upgrade -y sandboxie

# Development CLI Cloud Tools
choco upgrade -y gh
choco upgrade -y awscli
choco upgrade -y awscli-session-manager
choco upgrade -y gcloudsdk
# (New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
# & $env:Temp\GoogleCloudSDKInstaller.exe

# Network Tools
choco upgrade -y openvpn-connect

# Android Development
choco upgrade -y adb
choco upgrade -y androidstudio
#HAXM is a cross-platform hardware-assisted virtualization engine (hypervisor), widely used as an accelerator for Android Emulator and QEMU
choco upgrade -y haxm

# PowerShell Development
choco upgrade -y powershell -force # 5.1
choco upgrade -y powershell-core -force # 7.5
#choco upgrade -y powershell-core --pre -force # 7.6

# Haskell Development
#choco upgrade -y haskell-stack
choco upgrade -y ghc

# Java Development

# JavaScript/Node Development
#choco upgrade -y nodejs-lts
#choco upgrade -y nodejs
#choco upgrade -y nvm

# Python Development
# using pyenv-win to manage multiple python versions
#choco upgrade -y python --params "'/InstallDir:C:\Python39'" --params "'/AddToPath:1'" --params-global
choco upgrade -y pyenv-win

# Go Development

# Julia Development
choco upgrade -y julia

# R Development
choco upgrade -y r
choco upgrade -y r.studio

# Octave Development
#choco upgrade -y octave

# Rust Development

# Ruby Development
#choco upgrade -y ruby

# File System Tools
choco upgrade -y everything
choco upgrade -y es
$es = "$env:ProgramData\chocolatey\bin\es.exe"
choco upgrade -y wiztree
choco upgrade -y fastcopy
choco upgrade -y grepwin
choco upgrade -y linkshellextension
choco upgrade -y hashtab
#choco upgrade -y PartitionMasterFree

# File Compression Tools
choco upgrade -y winrar
choco upgrade -y 7zip
#choco upgrade -y modern7z
choco upgrade -y multipar
#choco upgrade -y freearc # not working, download and install manually
Invoke-WebRequest "https://web.archive.org/web/20150319224343if_/http://freearc.org/download/testing/FreeArc-0.67-alpha-win32.exe" -OutFile "$env:TEMP\FreeArc.exe"
Start-Process "$env:TEMP\FreeArc.exe" -ArgumentList "/S" -Wait

# File Sync Tools
choco upgrade -y synctrayzor
# this version of google drive is deprecated
choco uninstall -y google-drive-file-stream
Invoke-WebRequest "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe" -OutFile "$env:TEMP\GoogleDriveSetup.exe"
Start-Process "$env:TEMP\GoogleDriveSetup.exe" -ArgumentList "--silent --desktop_shortcut" -Wait
choco upgrade -y winfsp
#abra https://github.com/billziss-gh/sshfs-win/releases/download/v3.7.21011/sshfs-win-3.7.21011-x64.msi
#abra https://github.com/evsar3/sshfs-win-manager/releases/download/v1.3.1/sshfs-win-manager-setup-v1.3.1.exe
choco upgrade -y rclone

# Messaging Tools
choco upgrade -y telegram
choco uninstall -y whatsapp # old version from chocolatey
winget install -e --id 9NKSQGP7F2NH # WhatsApp
choco upgrade -y microsoft-teams
choco upgrade -y discord

# Reading Tools
choco upgrade -y adobereader
choco upgrade -y sumatrapdf
choco upgrade -y sendtokindle

# System Info Tools
choco upgrade -y cpu-z
choco upgrade -y gpu-z
choco upgrade -y speccy
choco upgrade -y crystaldiskinfo
choco upgrade -y crystaldiskmark
choco upgrade -y hwinfo

# System Cleaning Tools
choco upgrade -y bleachbit
choco upgrade -y ccleaner

# System Tweaking Tools
choco upgrade -y powertoys
choco upgrade -y autohotkey
choco upgrade -y speedtest
choco upgrade -y shutup10
choco upgrade -y revo-uninstaller
choco upgrade -y sysinternals
choco upgrade -y sizer
choco upgrade -y imdisk-toolkit
choco upgrade -y nssm
choco upgrade -y procexp
choco upgrade -y dontsleep
choco upgrade -y msiafterburner

# USB Drive Tools
choco upgrade -y rufus
choco upgrade -y etcher
#choco upgrade -y ventoy
# this version of yumi is deprecated, use YUMI-exFAT-1.0.3.0
#choco upgrade -y yumi
New-Item -ItemType Directory -Force -Path "C:\Tools\" | Out-Null
Invoke-WebRequest "https://pendrivelinux.com/downloads/YUMI/YUMI-exFAT-1.0.3.0.exe" -OutFile "C:\Tools\YUMI-exFAT-1.0.3.0.exe"

# Video Tools
choco upgrade -y vlc
# close edge if open, otherwise the upgrade of obs-studio will fail
Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue
choco upgrade -y obs-studio
choco upgrade -y handbrake
choco upgrade -y ffmpeg
#choco upgrade -y atomicparsley
choco upgrade -y videostream

# Download Tools
choco upgrade -y qbittorrent
choco upgrade -y jackett
#start "https://github.com/qbittorrent/search-plugins/wiki/How-to-configure-Jackett-plugin"
#Youtube DL is deprecated, should use yt-dlp
choco uninstall -y youtube-dl
choco upgrade -y yt-dlp
choco upgrade -y gallery-dl

# Image Tools
choco upgrade -y paint.net
#app install paintdotnet-plugins-vandermotten-*
#app install paintdotnet-plugins-boltbait-*
#app install paintdotnet-plugins-pyrochild-*
#app install paintdotnet-plugins-simonbrown-*
#app install paintdotnet-plugins-madjik-*
#app install paintdotnet-plugins-dpy-*
#app install paintdotnet-plugins-redochre-*
#app install paintdotnet-filetype-psd
##choco upgrade -y krita
#choco upgrade -y gimp
choco upgrade -y inkscape
#choco upgrade -y xnviewmp
choco upgrade -y IconViewer
choco upgrade -y irfanview

# Remote Access
# versions newer than 7.0.14 don't allow for free aliases anymore
#choco package is lying about the versions, they are actually 7.0.15
#choco install -y --force anydesk --version=7.0.14
#choco install -y --force anydesk --version=7.0.7
choco uninstall -y --force anydesk.portable
choco uninstall -y --force anydesk
Get-Process -Name "AnyDesk" -ErrorAction SilentlyContinue | Stop-Process -Force
sleep 1
$success = $false
$expected = "109B03FFC45231E5A4C8805A10926492890F7B568F8A93ABE1FA495B4BD42975"
$tempDownload = "$env:TEMP\anydesk-7-0-14.exe"
if (Test-Path "$env:TEMP\anydesk-7-0-14.exe") {
    $actual = (Get-FileHash "$tempDownload" -Algorithm SHA256).Hash
    if ($actual -ieq $expected) {
        $success = $true
    }
}
for ($i = 1; $i -le 3 -and -not $success; $i++) {
    curl "https://download2.fileeagle.com/files/2024/12/anydesk-7-0-14.exe" --output "$tempDownload"
    $actual = (Get-FileHash "$tempDownload" -Algorithm SHA256).Hash
    if ($actual -ieq $expected) {
        $success = $true
    }
}
Start-Process "$tempDownload" -ArgumentList "--install `"${env:ProgramFiles(x86)}\AnyDesk`" --start-with-win --create-desktop-icon" -Wait
#choco upgrade -y teamviewer
#choco upgrade -y chrome-remote-desktop-host
#choco upgrade -y tightvnc
#choco upgrade -y ultravnc
#choco upgrade -y mobaXterm

# Browsers
choco upgrade -y googlechrome
choco upgrade -y firefox

# Authentication Tools
choco upgrade -y winauth

# Anti-Virus
choco upgrade -y virustotaluploader

# Latex
choco upgrade -y texlive --params="'/scheme:full'" --execution-timeout=10000
choco upgrade -y texstudio
choco upgrade -y pandoc

# Fonts
#fontman install free-*
#fontman install odibee-sans-regular
#fontman install moonbright
#fontman install bpimperial-*
#fontman install rustycage-*

# Oh My Posh
# alternatives: https://alternativeto.net/software/oh-my-posh/
# ref: https://ohmyposh.dev/docs/installation/windows
winget install oh-my-posh
winget upgrade oh-my-posh
# ref: https://ohmyposh.dev/docs/installation/prompt
# get path to oh-my-posh executable
$ohMyPosh = & $es oh-my-posh *.exe
$profileLine = "$ohMyPosh init pwsh | Invoke-Expression"
$profile7 = pwsh -c 'echo $PROFILE'
if (-not (Select-String -Path $profile7 -Pattern ([regex]::Escape($profileLine)) -Quiet)) {
    Add-Content -Path $profile7 -Value $profileLine
}
$profile5 = powershell -c 'echo $PROFILE'
if (-not (Select-String -Path $profile5 -Pattern ([regex]::Escape($profileLine)) -Quiet)) {
    Add-Content -Path $profile5 -Value $profileLine
}
# install fonts
# ref: https://ohmyposh.dev/docs/installation/fonts
& $ohMyPosh font install meslo
