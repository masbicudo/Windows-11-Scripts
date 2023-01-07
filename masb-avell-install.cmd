@Echo off

:: Main function
GoTo :End_Main
:Main

  folder C:\Sync\nb-avell\Tools ^
        -lnk tools ^
        -sym C:\Tools

  folder D:\Projects\Siemens ^
        -lnk siemens

  folder D:\Projects ^
        -lnk projects ^
        -lnk projs 

  folder C:\Sync\nb-avell\Shortcuts ^
        -lnk shortcuts ^
        -lnk shct ^
        -sym C:\Shortcuts

  folder D:\Downloads ^
        -known Downloads ^
        -lnk downloads ^
        -lnk dls ^
        -sym C:\Shortcuts

  :DependenciesGroup

    choco upgrade -y vcredist-all

  :PackageManagementGroup

    choco upgrade -y chocolateygui

  :VideoToolsGroup

    choco upgrade -y handbrake

    REM :: Youtube DL is deprecated, should use yt-dlp
    REM choco upgrade -y youtube-dl
    choco upgrade -y yt-dlp
    choco upgrade -y ffmpeg
    choco upgrade -y atomicparsley

    choco upgrade -y obs-studio
    choco upgrade -y vlc

  :FontsGroup

    rem fontman install free-*
    rem fontman install odibee-sans-regular
    rem fontman install moonbright
    rem fontman install bpimperial-*
    rem fontman install rustycage-*

  :EnvironmentsGroup

    choco upgrade -y virtualbox

    choco upgrade -y haxm
    choco upgrade -y androidstudio

    choco upgrade -y msys2
    
    choco upgrade -y mingw
    
    choco upgrade -y docker-desktop

    rem rem dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    rem rem dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    rem abra https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
    rem rem wsl --set-default-version 2
    choco upgrade -y wsl-ubuntu-2004

  :LanguagesAndLibrariesGroup
  
    :: Python
    powershell -c "Remove-Item $env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\python*.exe"
    choco upgrade -y pyenv-win
    pyenv install 3.10.4
    pyenv global 3.10.4
    pip install --user pdm
    :: PDM alternative install = powershell "(Invoke-WebRequest -Uri https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py -UseBasicParsing).Content | python -"
    pip install --user pipx
    for /f %%i in ('es pipx.exe') do "%%~i" ensurepath
    choco upgrade -y dvc

    :: Node.js
    
      :: NVM Windows
      goto :skip_nvm
      :: PNPM already capable of managing Node.js versions
      :: using .npmrc file, and also global Node.js versions.
      :: NVM is not needed anymore!
      choco upgrade -y nvm
      nvm install 18.9.0
      nvm install 16.17.0
      nvm use 18.9.0
        npm install -g npm@latest
      nvm use 16.17.0
        npm install -g npm@latest
      nvm use 16.17.0 & npm --version
      nvm use 18.9.0 & npm --version
      :skip_nvm

      :: PNPM
      powershell "iwr https://get.pnpm.io/install.ps1 -useb | iex"
      pnpm update

    choco upgrade -y javaruntime
    choco upgrade -y ruby
    choco upgrade -y r
    choco upgrade -y r.studio
    choco upgrade -y powershell-core
    choco upgrade -y dotnet3.5

    choco upgrade -y julia
    julia -e "using Pkg; Pkg.add.([\"IJulia\"])"
    pip install jupyterlab

  :DevelopmentToolsGroup
  
    choco upgrade -y vscode
    rem choco upgrade -y visualstudio-installer

    choco upgrade -y notepadplusplus
    choco upgrade -y winmerge
    choco upgrade -y git --params "'/GitAndUnixToolsOnPath /WindowsTerminalProfile'" --params-global
    choco upgrade -y gitextensions
    choco upgrade -y kdiff3

    choco upgrade -y pgadmin4
    choco install -y postgresql --params '/Password:mig29' --params-global
    choco upgrade -y tad
    choco upgrade -y nginx
    choco upgrade -y win-acme

    :: GitHub CLI
    choco upgrade -y gh

    :: AWS CLI
    choco upgrade -y awscli

    :: Android
    REM choco upgrade -y adb

  :ReadingToolsGroup

    choco upgrade -y adobereader
    choco upgrade -y sumatrapdf
    choco upgrade -y sendtokindle

  :DrawingToolsGroup

    choco upgrade -y paint.net
    rem app install paintdotnet-plugins-vandermotten-*
    rem app install paintdotnet-plugins-boltbait-*
    rem app install paintdotnet-plugins-pyrochild-*
    rem app install paintdotnet-plugins-simonbrown-*
    rem app install paintdotnet-plugins-madjik-*
    rem app install paintdotnet-plugins-dpy-*
    rem app install paintdotnet-plugins-redochre-*
    rem app install paintdotnet-filetype-psd
    choco upgrade -y krita

  :SystemToolsGroup

    choco upgrade -y yumi
    choco upgrade -y rufus
    choco upgrade -y etcher
    choco upgrade -y speedtest
    choco upgrade -y shutup10
    choco upgrade -y revo-uninstaller
    choco upgrade -y hwinfo
    choco upgrade -y speccy
    choco upgrade -y crystaldiskmark
    choco upgrade -y crystaldiskinfo
    choco upgrade -y gpu-z
    choco upgrade -y sysinternals
    choco upgrade -y bleachbit
    choco upgrade -y linkshellextension
    choco upgrade -y sizer
    choco upgrade -y IconViewer
    choco upgrade -y imdisk-toolkit
    choco upgrade -y nssm
    choco upgrade -y powertoys
    choco upgrade -y procexp
    choco upgrade -y dontsleep
    choco upgrade -y msiafterburner

  :DownloadToolsGroup

    choco upgrade -y qbittorrent
    choco upgrade -y jackett
    rem start "https://github.com/qbittorrent/search-plugins/wiki/How-to-configure-Jackett-plugin"

  :RemoveAccessToolsGroup

    :: newer versions don't allow for free aliases anymore
    choco install -y anydesk --version=7.0.14

  :FileToolsGroup

    choco upgrade -y everything es
    choco upgrade -y wiztree

    choco upgrade -y fastcopy
    choco upgrade -y grepwin

    choco upgrade -y winrar
    choco upgrade -y 7zip
    rem choco upgrade -y modern7z

  :MessagingToolsGroup

    choco upgrade -y telegram
    choco upgrade -y whatsapp
    choco upgrade -y microsoft-teams
    choco upgrade -y discord

  :RemoteStorageToolsGroup

    choco upgrade -y synctrayzor

    choco upgrade -y winfsp
    rem abra https://github.com/billziss-gh/sshfs-win/releases/download/v3.7.21011/sshfs-win-3.7.21011-x64.msi
    rem abra https://github.com/evsar3/sshfs-win-manager/releases/download/v1.3.1/sshfs-win-manager-setup-v1.3.1.exe
    choco upgrade -y google-drive-file-stream

  :: Browsers
  choco upgrade -y googlechrome

  choco upgrade -y winauth

  choco upgrade -y virustotaluploader


  call :OhMyPosh
  
  call :LaTeX

Goto :eof
:End_Main


:: LaTeX function
GoTo :End_LaTeX
:LaTeX

  choco install -y texlive --params="'/scheme:full'" --execution-timeout=10000
  choco upgrade -y texstudio

Goto :eof
:End_LaTeX

:: OhMyPosh function
GoTo :End_OhMyPosh
:OhMyPosh

  :: alternatives: https://alternativeto.net/software/oh-my-posh/

  :: ref: https://ohmyposh.dev/docs/installation/windows
  winget install oh-my-posh
  winget upgrade oh-my-posh

  :: ref: https://ohmyposh.dev/docs/installation/prompt
  :: TODO: only execut these lines if the files don't already contain the lines
  pwsh echo "oh-my-posh init pwsh | Invoke-Expression" >> $PROFILE
  powershell echo "oh-my-posh init pwsh | Invoke-Expression" >> $PROFILE

  :: manual step: install fonts
  :: ref: https://ohmyposh.dev/docs/configuration/fonts
  :: es://Meslo%20!dz%20windows%20!\Windows%20regex%3A\bM\b
  :: NOTE: Could make a script for this:
  ::    es Meslo !dz windows !\Windows regex:\bM\b

Goto :eof
:End_OhMyPosh



::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: Automatically check & get admin rights
:: see "https://stackoverflow.com/a/12264592/1016343" for description
::::::::::::::::::::::::::::::::::::::::::::
 CLS
 ECHO.
 ECHO =============================
 ECHO Running Admin shell
 ECHO =============================

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  REM ECHO z = WScript.StdIn.Read^( 1 ^) >> "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B
 GoTo :eof

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
 REM Run shell as admin (example) - put here code as you like
 ECHO %batchName% Arguments: P1=%1 P2=%2 P3=%3 P4=%4 P5=%5 P6=%6 P7=%7 P8=%8 P9=%9
Call :Main %*
GoTo :eof
