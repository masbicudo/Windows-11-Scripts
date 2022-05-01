@if (@X)==(@Y) @end /* Harmless hybrid line that begins a JScript comment
:: -------- Batch code --------------
@Echo off

::
:: Main
::
GoTo :Main_End
:Main
  :: Look for shortcuts inside "%ProgramData%\Microsoft\Windows\Start Menu\Programs"

  SetLocal EnableExtensions EnableDelayedExpansion
  Set source_list="D:\Desktop" "C:\Users\Public\Desktop"
  Set target=C:\Shortcuts
  MkDir %target% >nul 2>&1

  :: Microsof Office Group
  Call :Move "Access"             ms-acc ms-access msa acc
  Call :Move "Excel"              ms-ex ms-sheets mse ex e
  Call :Move "OneDrive"           odrive odrv o-d o-drv one msone ms-one onedrv one-drv oned one-d
  Call :Move "Outlook"            ms-out outlook olook ol msol mso
  Call :Move "PowerPoint"         ms-pp pwrpnt ppnt powerpnt mspp msp 
  Call :Move "Publisher"          ms-pub pub mspub mspu
  Call :Move "Word"               ms-word ms-w msw wrd wd w
  Call :Move "OneNote"            ms-onenote ms-note ms-on mson msonote msonenote onote msnote

  :: Android Apps on Windows via WSA
  Call :Move "Amazon Appstore"    amazon-store amazon-app-store aas aastore appstore app-store amazonstore amstor store-amazon
  Call :Move "Play Store"         play-store google-play gplay g-play play-store gplay-store playstore gstor store-google
  Call :Move "Nubank"             nu
  Call :Move "BB"                 bb
  Call :Move "YouTube"            yt
  Call :Move "Prime Video"        pv apv prime pvideo primevideo amazon-pv amazonpv
  Call :Move "Magisk"             mgisk mgsk
  Call :Move "C6 Bank"            c6

  :: Other Programs Group
  Call :Move "7-Zip File Manager" 7zui 7zipui 7-zipui 7-zui 7z-ui 7zip-ui 7-zip-ui 7-z-ui 7zgui 7zipgui 7-zipgui 7-zgui 7z-gui 7zip-gui 7-zip-gui 7-z-gui
  Call :Move "Adobe Acrobat DC"   acrobat reader adobe-reader
  Call :Move "AnyDesk"            any anyd adesk any-desk any-d a-desk ad a-d
  Call :Move "BleachBit"          bleach clean
  Call :Move "CCleaner"           cc cclean ccl
  Call :Move "CrystalDiskInfo"    cdi cdinfo cdiskinfo cdiski
  Call :Move "CrystalDiskMark 8 Shizuku Edition (64bit)"  cdm-se cdm8-se cdiskmark-se cdisk-se cdm cdm8 cdiskmark cdisk
  Call :Move "CrystalDiskMark 8"  cdm cdm8 cdiskmark cdisk
  Call :Move "diagrams.net"       dia diagrams dg.net dia.net dgnet dg dianet
  Call :Move "Discord"            dsc disc dis dscrd dscord
  Call :Move "Docker Desktop"     docker-desktop dockdesk dkdk dkrdkt ddt
  Call :Move "Dont Sleep"         dont dsleep dontsleep dont-sleep no-sleep nosleep donsleep
  Call :Move "Everything"         fnd find search
  Call :Move "Firefox"            ff ffox firef finternet foxinternet internet-fox internet-moz moz-internet
  Call :Move "FreeTube"           ft youtube
  Call :Move "GeForce Experience" gfex
  Call :Move "Git Extensions"     gitex gitext gitextension gitextensions git-ex git-ext git-extension git-extensions
  Call :Move "Google Chrome"      chrome google-chrome
  Call :Move "Google Drive"       drv drive gdrive g-drive g-drv gdrv
  Call :Move "grepWin"            grep grep-win wgrep -a a-grep grep-a agrep grepa
  Call :Move "GPU-Z"              gpu gpuz gpus
  Call :Move "HandBrake"          hb hbrake hand-brake h-brake hbreak
  Call :Move "HxD"                hex -a aHxD ahex
  Call :Move "HWiNFO64"           hwi hwinfo hw hw64
  Call :Move "ImageGlass"         ig iglass igls iglas imageg
  Call :Move "Inkscape"           is iscape ink inks
  Call :Move "KDiff3"             diff kdiff kdif dif kd3
  Call :Move "LibreOffice 7.2"    LibreOffice loffice libre libreo
  Call :Move "Microsoft Edge"     edge ms-edge msedge microsoft-edge msed msie msinternet ms-internet internet internet-edge internet-ms
  Call :Move "Microsoft Teams (work or school)" teams msteams ms-teams msteam mst team
  Call :Move "MSI Afterburner"    msi-ab ab afterburner after-burner msi-after-burner msiab
  Call :Move "MultiPar"           mp par par2 recovery-record -a aMultiPar amp apar apar2 arecovery-record
  Call :Move "Notepad++"          npp n++ -a anpp nppa an++ n++a npp-a a-npp n++-a a-n++
  Call :Move "OBS Studio"         obs obss
  Call :Move "Oracle VM VirtualBox" vbox vb virtualbox virtbox vmbox
  Call :Move "paint.net"          pdn pnet p-net pdnet pd-net paintnet paint-net paintdotnet paint-dot-net
  Call :Move "pgAdmin 4"          pgadm pga pa
  Call :Move "Photoshop"          ps
  Call :Move "Windows PowerShell" posh -a posha a-posh posh-a aposh
  Call :Move "Premiere"           pr
  Call :Move "qBittorrent"        qbt torrent qb
  Call :Move "Resilio Sync"       res resilio resil rsl res-sync rsls resync reslsync rslsync rlsync
  Call :Move "Revo Uninstaller"   revo uninstaller uninst uninstall revo-uninst revo-uninstaller
  Call :Move "Speccy"             spec specs
  Call :Move "SSHFS-Win Manager"  sshfs-win-manager sshfs-wm sshfs-manager sshfs-man manage-sshfs sfman sf-man ssh-fs sshfs
  Call :Move "Surfshark"          ss shark sshark surfs
  Call :Move "Synology Drive Client" sdrive s-drive syndrv syn-drv syndrive syn-drive
  Call :Move "SyncTrayzor"        sync-t synct sync synctray st stray strazor trazor
  Call :Move "Tad"                csv csv-viewer
  Call :Move "Telegram"           tel tg tgram tele teleg tlegram telgram tlgram
  Call :Move "Visual Studio Code" code vscode vs-code -a coda vscoda vs-coda acode avscode a-code code-a a-vscode vscode-a
  Call :Move "VLC media player"   vlc vlcp vlcmp vmp player
  Call :Move "WhatsApp"           whats whaz whazap whapp wzap zap zapzap zz wa
  Call :Move "WizTree"            wiz wizt wiztr wzt wtree wztree wt
  Call :Move "WinMerge"           wm wmerge merge winmer wmer winmrg mrg wmerg wmrg

GoTo :eof
:Main_End

::
:: Move
::
GoTo :Move_End
:Move
%Debug%:Move

  Set ext_list=".LNK" "" 
  %Debug%  For %%E In ^(%ext_list%^)
  For %%E In (%ext_list%) Do (
    %Debug%  Do E=%%E
    %Debug%    Set ext=%%~E
    Set ext=%%~E

    :: Moving shortcuts from the Desktop folders
    If "%Desktop%" == "1" (
    %Debug%    For %%S In ^(%source_list%^)
    For %%S In (%source_list%) Do (
      %Debug%    Do S=%%S
      %Debug%      PushD "%%~S"
      PushD "%%~S" >nul 2>&1
      %Debug%      If Exist "%~1%%~E"
      If Exist "%~1%%~E" (
        %Debug%        Call :MoveItem %1
        Call :MoveItem %1
      ) Else (
        %Debug%        [FALSE]
      )
      %Debug%      PopD
      PopD >nul 2>&1
    )
    )

    :: Copying shortcuts from the Start Menu folders
    REM TODO: ignore "startup" folder, or append string "-startup" on file shortcut when copying
    If "%StartMenu%" == "1" (
    %Debug%    PushD "%ProgramData%\Microsoft\Windows\Start Menu\Programs"
    PushD "%ProgramData%\Microsoft\Windows\Start Menu\Programs" >nul 2>&1
    %Debug%    For /R %%F In ^(*^)
    For /R %%F In (*) Do (
      %Debug%    Do F=%%F
      %Debug%      CD "%%~dpF"
      CD "%%~dpF"
      %Debug%      If /I "%%~xF" == "%%~E"
      %Debug%      If /I "%%~nxF" == "%~1%%~E"
      %Debug%      If Exist "%~1%%~E"
      If /I "%%~xF" == "%%~E" If /I "%%~nxF" == "%~1%%~E" If Exist "%~1%%~E" (
          %Debug%          Call :CopyItem %1
          %Debug%            %%~E %%F
          Call :CopyItem %1
      ) Else (%Debug%        [FALSE]
      ) Else (%Debug%        [FALSE]
      ) Else (%Debug%        [FALSE]
      )
    )
    %Debug%    PopD
    PopD >nul 2>&1
    )

    If "%StartMenu%" == "1" (
    %Debug%    PushD "%APPDATA%\Microsoft\Windows\Start Menu\Programs"
    PushD "%APPDATA%\Microsoft\Windows\Start Menu\Programs" >nul 2>&1
    %Debug%    For /R %%F In ^(*^)
    For /R %%F In (*) Do (
      %Debug%    Do F=%%F
      %Debug%      CD "%%~dpF"
      CD "%%~dpF"
      %Debug%      If /I "%%~xF" == "%%~E"
      %Debug%      If /I "%%~nxF" == "%~1%%~E"
      %Debug%      If Exist "%~1%%~E"
      If /I "%%~xF" == "%%~E" If /I "%%~nxF" == "%~1%%~E" If Exist "%~1%%~E" (
          %Debug%          Call :CopyItem %1
          %Debug%            %%~E %%F
          Call :CopyItem %1
      ) Else (%Debug%        [FALSE]
      ) Else (%Debug%        [FALSE]
      ) Else (%Debug%        [FALSE]
      )
    )
    %Debug%    PopD
    PopD >nul 2>&1
    )
  )

  :: Cloning shortcuts with multiple different names
  If "%Clone%" == "1" (
  %Debug%  For %%E In ^(%ext_list%^)
  For %%E In (%ext_list%) Do (
    %Debug%  Do E=%%E
    %Debug%    Set ext=%%~E
    Set ext=%%~E
    %Debug%    Call :CloneItem %*
    Call :CloneItem %*
  )
  )

GoTo :eof
:Move_End

::
:: MoveItem
::
GoTo :MoveItem_End
:MoveItem
%Debug%:MoveItem
SetLocal EnableExtensions EnableDelayedExpansion
  If Exist "%~1%ext%" (
    Echo Moving "%~1%ext%"
    Move /y "%~1%ext%" %target% >nul 2>&1 && (
      Echo.    %target%
    ) || (
      Echo.    %target% [failed]
    )
  )
GoTo :eof
:MoveItem_End

::
:: CopyItem
::
GoTo :CopyItem_End
:CopyItem
%Debug%:CopyItem
SetLocal EnableExtensions EnableDelayedExpansion
  If Exist "%~1%ext%" (
    Echo Copying "%~1%ext%"
    Copy /y "%~1%ext%" %target% >nul 2>&1 && (
      Echo.    %target%
    ) || (
      Echo.    %target% [failed]
    )
  )
GoTo :eof
:CopyItem_End

::
:: CloneItem
::
GoTo :CloneItem_End
:CloneItem
%Debug%:CloneItem
SetLocal EnableExtensions EnableDelayedExpansion
  Set link="%target:"=%\%~1%ext%"
  Shift
  If Not Exist %link% GoTo :eof
  Echo Copying %link%
  :CloneItem_NextArg
    If "%1"=="-a" (
      Set LNKADMIN=1
      Shift
      GoTo :CloneItem_NextArg
    )
    If "%1"=="" GoTo :eof
    Set link_dest="%target:"=%\%~1%ext%"
    copy /y %link% %link_dest% >nul 2>&1 && (
      Echo.    %link_dest%
    ) || (
      Echo.    %link_dest% [failed]
    )
    If "%LNKADMIN%"=="1" If "%ext%"==".LNK" (
      Echo.      ^(set admin^)
      Call :SetLnkAdmin %link_dest%
    )
    Shift
  GoTo :CloneItem_NextArg
EndLocal
GoTo :eof
:CloneItem_End

::::::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights V2
::::::::::::::::::::::::::::::::::::::::::::
CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
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
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
Set "Debug=REM "
Set "Desktop=1"
Set "StartMenu=1"
Set "Clone=1"
:Next_Arg
If "%1" == "--no-clone" Set "Clone=0"
If "%1" == "--debug"    Set "Debug=Echo."
If "%1" == "-d"         Set "Debug=Echo."
If "%1" == "--desktop" (
  Set "Desktop=1"
  Set "StartMenu=0"
)
If "%1" == "--start-menu" (
  Set "Desktop=0"
  Set "StartMenu=1"
)
Shift
If Not "%1" == "" GoTo :Next_Arg
%Debug%Debug="%Debug%"
%Debug%Desktop="%Desktop%"
%Debug%StartMenu="%StartMenu%"
%Debug%Clone="%Clone%"

Call :Main %*
GoTo :eof
:SetLnkAdmin
cscript.exe //E:JScript //nologo "%~f0" "SetLnkAdmin" %1
GoTo :eof
:JScript
:: --------- JScript code -----------*/
var discriminator = WScript.arguments(0);
if (discriminator == "SetLnkAdmin") {
  var filename = WScript.arguments(1);
  var adTypeBinary = 1;
  var adTypeText = 2;
  var adSaveCreateOverWrite = 2;
  var s = new ActiveXObject("ADODB.Stream");
  s.Type = adTypeText;
  s.CharSet = '437';
  s.Open();
  s.LoadFromFile(filename);
  s.Position = 21;
  s.WriteText(" ");
  s.SaveToFile(filename, adSaveCreateOverWrite);
  s.Close();
}