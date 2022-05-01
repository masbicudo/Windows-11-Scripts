@Echo off

:: Main function
GoTo :End_Main
:Main

  rem mkdir "C:/Shortcuts"
  rem mkdir "D:/Projects"
  rem rem mkdir "D:/Downloads"

  choco upgrade -y vcredist-all

  choco upgrade -y chocolateygui

  choco upgrade -y handbrake

  choco upgrade -y youtube-dl

  rem fontman install free-*
  rem fontman install odibee-sans-regular
  rem fontman install moonbright
  rem fontman install bpimperial-*
  rem fontman install rustycage-*

  choco upgrade -y haxm
  choco upgrade -y androidstudio

  :: Environments
  choco upgrade -y msys2
  choco upgrade -y mingw
  choco upgrade -y docker-desktop
  choco upgrade -y virtualbox

  :: Julia Language

  :: Languages
  choco upgrade -y python3
  choco upgrade -y pyenv-win
  choco upgrade -y nodejs
  choco upgrade -y ruby
  choco upgrade -y r
  choco upgrade -y powershell-core
  rem choco upgrade -y dotnet3.5
  choco upgrade -y julia

  :: Development Tools
  choco upgrade -y vscode
  rem choco upgrade -y visualstudio-installer
  choco upgrade -y pgadmin4
  choco install -y postgresql --params '/Password:mig29' --params-global
  choco upgrade -y notepadplusplus
  choco upgrade -y winmerge
  choco upgrade -y git --params "'/GitAndUnixToolsOnPath /WindowsTerminalProfile'" --params-global
  choco upgrade -y gitextensions
  choco upgrade -y kdiff3
  choco upgrade -y tad
  choco upgrade -y nginx
  choco upgrade -y win-acme

  :: Android Subsistem for Windows
  REM choco upgrade -y adb

  rem rem dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  rem rem dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  rem abra https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
  rem rem wsl --set-default-version 2
  choco upgrade -y wsl-ubuntu-2004

  :: Other Tools
  choco upgrade -y adobereader
  choco upgrade -y obs-studio

  choco upgrade -y paint.net
  rem app install paintdotnet-plugins-vandermotten-*
  rem app install paintdotnet-plugins-boltbait-*
  rem app install paintdotnet-plugins-pyrochild-*
  rem app install paintdotnet-plugins-simonbrown-*
  rem app install paintdotnet-plugins-madjik-*
  rem app install paintdotnet-plugins-dpy-*
  rem app install paintdotnet-plugins-redochre-*
  rem app install paintdotnet-filetype-psd

  choco upgrade -y everything
  choco upgrade -y wiztree

  choco upgrade -y yumi

  choco upgrade -y speedtest
  choco upgrade -y qbittorrent
  choco upgrade -y jackett
  rem start "https://github.com/qbittorrent/search-plugins/wiki/How-to-configure-Jackett-plugin"
  choco upgrade -y anydesk
  choco upgrade -y synctrayzor
  choco upgrade -y fastcopy
  choco upgrade -y grepwin

  choco upgrade -y winfsp
  rem abra https://github.com/billziss-gh/sshfs-win/releases/download/v3.7.21011/sshfs-win-3.7.21011-x64.msi
  rem abra https://github.com/evsar3/sshfs-win-manager/releases/download/v1.3.1/sshfs-win-manager-setup-v1.3.1.exe

  choco upgrade -y winrar
  choco upgrade -y 7zip
  rem choco upgrade -y modern7z

  choco upgrade -y dontsleep
  choco upgrade -y msiafterburner

  :: Messaging Tools
  choco upgrade -y telegram
  choco upgrade -y whatsapp
  choco upgrade -y microsoft-teams
  choco upgrade -y discord

  :: Online Storage Tools
  choco upgrade -y google-drive-file-stream

  :: Browsers
  choco upgrade -y googlechrome

  :: System Tools
  choco upgrade -y shutup10
  choco upgrade -y revo-uninstaller
  choco upgrade -y hwinfo
  choco upgrade -y speccy
  choco upgrade -y crystaldiskmark
  choco upgrade -y crystaldiskinfo
  choco upgrade -y gpu-z
  choco upgrade -y sysinternals
  choco upgrade -y bleachbit

  choco upgrade -y nssm

  choco upgrade -y winauth

Goto :eof
:End_Main




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
