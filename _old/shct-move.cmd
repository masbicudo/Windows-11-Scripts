@if (@X)==(@Y) @end /* ---------------- Batch code ----------------

@Echo Off


::
:: CreateCopyMoveAllLinks
::
:: Remarks: Look for shortcuts inside
::    "%ProgramData%\Microsoft\Windows\Start Menu\Programs"
::    "D:\Desktop"
::    "C:\Users\Public\Desktop"
::
GoTo :CreateCopyMoveAllLinks_End
:CreateCopyMoveAllLinks
%Debug%:CreateCopyMoveAllLinks

  SetLocal EnableExtensions EnableDelayedExpansion
  Set link_source_move_locations="D:\Desktop" "C:\Users\Public\Desktop" "%TEMP%\shct"
  Set link_source_copy_locations="%ProgramData%\Microsoft\Windows\Start Menu\Programs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs"
  Set link_target_location=C:\Shortcuts

  :: Init
  MkDir %link_target_location% 1>Nul 2>Nul
  MkDir "%TEMP%\shct" 1>Nul 2>Nul

  :: Programs
  Call :Create "cmd.exe"          cmd -a cmda

  Call :Move "Microsoft Edge Dev" edge-dev edgedev edev e-dev edged edge-d
  Call :Move "Dashboard — CartPanda" cartpanda cpanda cpand
  Call :Move "Microsoft 365" ms365 365 office ms-office msoffice
  Call :Move "Sizer"              sz szr resizer rsz rszr

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
  Call :Move "Prime Video"        pv apv prime pvideo primevideo amazon-pv amazonpv
  Call :Move "Magisk"             mgisk mgsk
  Call :Move "C6 Bank"            c6

  :: Installed Web Apps
  Call :Move "YouTube"            yt
  Call :Move "Twitch"             tw tch ttch twtch twi twch twich
  Call :Move "Gmail"              gm gml eml mail email e-mail gmail g-mail
  Call :Move "Google Photos"      photos gphotos g-photos gfotos g-fotos
  Call :Move "Google Calendar"    cal calend calendar calendario gcal gcalend gcalendar gcalendario g-cal g-calend g-calendar g-calendario
  Call :Move "Google Sala de Aula" cls classroom clrm clsrm clsroom class classes g-class g-classes gclass gclasses
  Call :Move "Sheets"             gs gsheets g-sheets
  Call :Move "Slides"             gsl gslides g-slides
  Call :Move "Docs"               gd gdocs g-docs
  Call :Move "Google Translate"   gt gtr translate
  Call :Move "Google Sites"       gs sites gsites g-sites
  Call :Move "Google Forms"       gf forms gforms g-forms
  Call :Move "Blogger"            blog blg
  Call :Move "Google Drive WebApp" webdrv webdrive wgdrive wg-drive wg-drv wgdrv drvw driveweb gdriveweb g-drive-web g-drv-w gdrvw
  Call :Move "Google Finance"     fin gfin g-fin finance gfinance g-finance finances
  Call :Move "Google Meet"        gm gmt meet meets gmeet gmeets g-meet g-meets
  Call :Move "Google Maps"        maps gmaps g-maps g-map map gmap gmp
  Call :Move "Colaboratory"       colab clb
  Call :Move "Odysee"             od odysey odisey odyse odsee odse
  Call :Move "Star+"              sp star starplus star-plus "s+" splus stpl
  Call :Move "GETTR"              gtr gttr getr
  Call :Move "Rumble"             rmb rumb rmbl rmble rumbl rble
  Call :Move "Google Images"      images gimages g-images imgs 
  Call :Move "SIGA"               siga
  Call :Move "OLX"                br-olx olx-br olx.br br.olx brolx olxbr
  Call :Move "Mercado Livre"      ml mlivre merclivr

  :: Games
  Call :Move "Battle.net"         bnet b.net b-net
  Call :Move "StarCraft II"       sc2 sc-2 scii sc-ii
  Call :Move "StarCraft"          sc sc1 sc-1
  Call :Move "Steam"              stm st stem
  Call :Move "Wallpaper Engine"   we wpp w-engine weng wengine wall-eng wallpp-engine wpeng wp-eng
  Call :Move "Battlefield Bad Company™ 2" bf bfbc bf-bc bc bfbc2 bfbc-2 bf-bc2 bf-bc-2 bc2 bc-2
  Call :Move "Grand Theft Auto V" gta gta5 gta-5 gtav gta-v
  Call :Move "Rockstar Games Launcher" rsgl rs-gl rockstar rgl r-gl
  Call :Move "Roblox Player"      rx roblox rbx rblox robox blox
  Call :Move "Roblox Studio"      rxs rx-studio rxstudio robloxstudio rbxs rbloxs roboxs bloxs
  Call :Move "ScourgeBringer"     sb
  Call :Move "Recompile"          rcp recomp rcmp rcomp recmp recp
  Call :Move "Amazon Games"       ag amzgames amzgms agames amazon-games a-games
  Call :Move "Epic Games Launcher" epic epicgames epiclaucher
  Call :Move "Rumbleverse"        rv
  Call :Move "Pinball FX"         pinball pball pbfx pb-fx
  Call :Move "Command Conquer Generals - Zero Hour" cczh cnczh cnc-zh zh zero-hour
    Call :Move "Тoррент  Игpуxа" Torrent-Game
  Call :Move "Command & Conquer™ Remastered Collection" cnc

  Call :Move "Exodus"             exd exd-wallet ex-wallet exw xw
  Call :Move "Nimiq Wallet"       nimiq nim nimiq-wallet nim-wallet nimwallet nimwal
  Call :Move "NIMIQ.WATCH Pool"   nimiq-watch nimwatch nimiq-watch-pool nim-watch-pool nimwatch-pool nim-watch nimpool nimwpool nimpl nimwpl nimp nimwp

  :: Other Programs Group
  Call :Move "7-Zip File Manager" 7zui 7zipui 7-zipui 7-zui 7z-ui 7zip-ui 7-zip-ui 7-z-ui 7zgui 7zipgui 7-zipgui 7-zgui 7z-gui 7zip-gui 7-zip-gui 7-z-gui
  Call :Move "Adobe Acrobat DC"   acrobat reader adobe-reader
  Call :Move "AdwCleaner"         adw adwc adw-c adw-clean adw-cleaner
  Call :Move "AnyDesk"            any anyd adesk any-desk any-d a-desk ad a-d
  Call :Move "BleachBit"          bleach clean
  Call :Move "balenaEtcher"       be etcher betcher etch balena balena-etcher
  Call :Move "CCleaner"           cc cclean ccl
  Call :Move "Chrome Remote Desktop" crdesk rdesk remdesk crd remote desktop chrome-remote-desktop chrome-desktop chrome-remote chrome-rd
  Call :Move "CPUID CPU-Z"        cpu cpuz cpus cpu-z cpuid
  Call :Move "CrystalDiskInfo"    cdi cdinfo cdiskinfo cdiski
  Call :Move "CrystalDiskMark 8 Shizuku Edition (64bit)"  cdm-se cdm8-se cdiskmark-se cdisk-se cdm cdm8 cdiskmark cdisk
  Call :Move "CrystalDiskMark 8"  cdm cdm8 cdiskmark cdisk
  Call :Move "diagrams.net"       dia diagrams dg.net dia.net dgnet dg dianet
  Call :Move "Dashboard   UptimeRobot" UptimeRobot uptime ur urobot uptr
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
  Call :Move "ImDisk Virtual Disk Driver"   imdisk-driver imdisk-drv im-drive im-drv imdrive imdrv idrv
    Call :Move "Montar arquivo de imagem"   imdisk-mount im-mount immount im-mnt immnt imnt
    Call :Move "Configuração RamDisk"       ramdisk ram-disk ram-dsk ramdsk ram-d ramd imram imramd iram iramd
  Call :Move "Inkscape"           is iscape ink inks
  Call :Move "Julia 1.7.2"        jul jl
  Call :Move "Julia 1.8.0"        jul jl
  Call :Move "Julia 1.8.3"        jul jl
  Call :Move "KDiff3"             diff kdiff kdif dif kd3
  Call :Move "LibreOffice 7.2"    LibreOffice loffice libre libreo
  Call :Move "LibreOffice 7.3"    LibreOffice loffice libre libreo
  Call :Move "Microsoft Edge"     edge ms-edge msedge microsoft-edge msed msie msinternet ms-internet internet internet-edge internet-ms
  Call :Move "Microsoft Teams (work or school)" teams msteams ms-teams msteam mst team
  Call :Move "MPC-BE x64"         mpc mpc-be mpcbe
  Call :Move "MPC-HC x64"         mpc-hc mpchc
  Call :Move "MPC-QT"             mpcqt
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
  Call :Move "R 4.2.0"            r r-lang rlang r-lng rlng -a ar-lang arlang ar-lng arlng
  Call :Move "R 4.2.0 Patched"    r r-lang rlang r-lng rlng -a ar-lang arlang ar-lng arlng
  Call :Move "Resilio Sync"       res resilio resil rsl res-sync rsls resync reslsync rslsync rlsync
  Call :Move "Revo Uninstaller"   revo uninstaller uninst uninstall revo-uninst revo-uninstaller
  Call :Move "Send To Kindle"     stk send2kindle s2k send-kindle s-k sendkindle sendk sk kindle
  Call :Move "Speccy"             spec specs
  Call :Move "SSHFS-Win Manager"  sshfs-win-manager sshfs-wm sshfs-manager sshfs-man manage-sshfs sfman sf-man ssh-fs sshfs
  Call :Move "SumatraPDF"         spdf sumatra ebook-reader epub-reader epub
  Call :Move "Surfshark"          ss shark sshark surfs
  Call :Move "Synology Drive Client" sdrive s-drive syndrv syn-drv syndrive syn-drive
  Call :Move "SyncTrayzor"        sync-t synct sync synctray st stray strazor trazor
  Call :Move "Tad"                csv csv-viewer
  Call :Move "Telegram"           tel tg tgram tele teleg tlegram telgram tlgram
  Call :Move "VirusTotal Uploader 2.2" vt vtu vtup vt-up virus-total virus-total-uploader
  Call :Move "Visual Studio Code" code vscode vs-code -a coda vscoda vs-coda acode avscode a-code code-a a-vscode vscode-a
  Call :Move "VLC media player"   vlc vlcp vlcmp vmp player vlc-mp
  Call :Move "WhatsApp"           whats whaz whazap whapp wzap zap zapzap zz wa
  Call :Move "WizTree"            wiz wizt wiztr wzt wtree wztree wt
  Call :Move "WinMerge"           wm wmerge merge winmer wmer winmrg mrg wmerg wmrg

  :: Cleanup
  RmDir /s /q "%TEMP%\shct" 1>Nul 2>Nul

Exit /B
:CreateCopyMoveAllLinks_End


::
:: Create
::
GoTo :Create_End
:Create
%Debug%:Create

  %Echo%Creating shortcuts for existing reachable programs via Where command
  :: Creating shortcuts for existing reachable programs via Where command
  If "%ExistingPrograms%" == "1" (
  %Debug%  For /F "tokens=* UseBackQ" %%A In ^(`Where %1`^) Do Set "link_target=%%~A"
  For /F "tokens=* UseBackQ" %%A In (`Where %1 2^>Nul`) Do (
    Set "link_target=%%~A"
    GoTo :_Next_85237598et8yo
  )
  :_Next_85237598et8yo
  %Debug%  If "!link_target!" NEq ""
  If "!link_target!" NEq "" (
    %Debug%    Call :CreateShortcut "%TEMP%\shct\%~1.lnk" "!link_target!"
    Call :CreateShortcut "%TEMP%\shct\%~1.lnk" "!link_target!"
  )
  )

  Call :Move %*

Exit /B
:Create_End


::
:: Move
::
GoTo :Move_End
:Move
%Debug%:Move

  SetLocal EnableExtensions EnableDelayedExpansion

  %Debug%  Set "CurrentName=%~1"
  Set "CurrentName=%~1"
  Set "__ok=1"
  %Debug%  If "%%HasNameFilter%%" =^> "%HasNameFilter%" == "1"
  If "%HasNameFilter%" == "1" (
    Set "__ok=0"
    %Debug%    For %%N In ^(%FilterName%^) Do
    For %%N In (%FilterName%) Do (
      %Debug%      If /I "^!CurrentName:%%N=^!" =^> "!CurrentName:%%N=!" NEq "^!CurrentName^!" =^> "!CurrentName!"
      If /I "!CurrentName:%%N=!" NEq "!CurrentName!" (
        Set "__ok=1"
      )
    )
  )

  %Debug%  __ok=%__ok%

  %Debug%  If "%%__ok%%" =^> "%__ok%" == "0" Exit /B
  If "%__ok%" == "0" Exit /B

  Set ext_list=".URL" ".LNK" "" 
  %Debug%  For %%E In ^(%ext_list%^)
  For %%E In (%ext_list%) Do (
    %Debug%  Do E=%%E
    %Debug%    Set ext=%%~E
    Set ext=%%~E

    :: Moving shortcuts from the source folders
    If "%Desktop%" == "1" (
    %Debug%    For %%S In ^(%link_source_move_locations%^)
    For %%S In (%link_source_move_locations%) Do (
      %Debug%    Do S=%%S
      %Debug%      PushD "%%~S"
      PushD "%%~S" 1>Nul 2>Nul
      %Debug%      If Exist "%~1%%~E"
      If Exist "%~1%%~E" (
        %Debug%        Call :MoveItem %1
        SetLocal
        Set "Debug=%Debug%        "
        Call :MoveItem %1
        EndLocal
      ) Else (
        %Debug%        [FALSE]
      )
      %Debug%      PopD
      PopD 1>Nul 2>Nul
    )
    )

    :: Copying shortcuts from the Start Menu folders
    REM TODO: ignore "startup" folder, or append string "-startup" on file shortcut when copying
    If "%StartMenu%" == "1" (
    %Debug%    For %%S In ^(%%link_source_copy_locations%%^)
    For %%S In (%link_source_copy_locations%) Do (
    %Debug%    PushD "%%S"
    PushD "%%S" 1>Nul 2>Nul
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
    PopD 1>Nul 2>Nul
    )
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

Exit /B
:Move_End


::
:: MoveItem
::
GoTo :MoveItem_End
:MoveItem
%Debug%:MoveItem
SetLocal EnableExtensions EnableDelayedExpansion

  If Not Exist "%~1%ext%" Exit /B
  For /F "tokens=* UseBackQ" %%F In (`Echo.%~1%ext%`) Do (
    Set ATTR=%%~aF
    Set DIRATTR=!ATTR:~0,1!
  )
  If /I "!DIRATTR!" == "d" Exit /B
  %Echo%Moving "%~1%ext%" to %link_target_location%
  Move /Y "%~1%ext%" %link_target_location% 1>Nul 2>Nul && (
    %Echo%    %link_target_location%
  ) || (
    %Echo%    %link_target_location% [failed]
  )

Exit /B
:MoveItem_End


::
:: CopyItem
::
GoTo :CopyItem_End
:CopyItem
%Debug%:CopyItem
SetLocal EnableExtensions EnableDelayedExpansion

  If Not Exist "%~1%ext%" Exit /B
  %Echo%Copying "%~1%ext%"
  Copy /Y "%~1%ext%" %link_target_location% 1>Nul 2>Nul && (
    %Echo%    %link_target_location%
  ) || (
    %Echo%    %link_target_location% [failed]
  )

Exit /B
:CopyItem_End


::
:: CloneItem
::
GoTo :CloneItem_End
:CloneItem
%Debug%:CloneItem
SetLocal EnableExtensions EnableDelayedExpansion
  %Debug%  Set link="%link_target_location:"=%\%~1%ext%"
  Set link="%link_target_location:"=%\%~1%ext%"
  If Not Exist %link% Exit /B
  Shift

  :: Making the clones
  %Echo%Copying %link%
  :CloneItem_NextArg
    If "%1"=="-a" (
      Set LNKADMIN=1
      Shift
      GoTo :CloneItem_NextArg
    )
    If "%1" == "" Exit /B
    Set link_dest="%link_target_location:"=%\%~1%ext%"

    For /F "tokens=* UseBackQ" %%F In (`Echo.%link_dest%`) Do (
      Set link_dest="%%~dpnxF"
    )
    For /F "tokens=* UseBackQ" %%F In (`Echo.%link%`) Do (
      Set link_src="%%~dpnxF"
    )
    %Debug%    If /I %link_dest% == %link_src% Exit /B
    If /I %link_dest% == %link_src% Exit /B

    Copy /Y %link% %link_dest% 1>Nul 2>Nul && (
      %Echo%    %link_dest%
    ) || (
      %Echo%    %link_dest% [failed]
    )
    If "%LNKADMIN%"=="1" If "%ext%"==".LNK" (
      %Echo%      ^(Set admin^)
      Call :SetLnkAdmin %link_dest%
    )
    Shift
  GoTo :CloneItem_NextArg
EndLocal
Exit /B
:CloneItem_End


::
:: Main
::
GoTo :Main_End
:Main
%Debug%:Main

  CHCP 65001

  SET R=[91m
  SET G=[92m
  SET Y=[93m
  SET B=[94m
  SET M=[95m
  SET C=[96m
  SET W=[97m
  SET N=[0m
  
  SET K=[90m

  SET LK=[90m
  SET LR=[91m
  SET LG=[92m
  SET LY=[93m
  SET LB=[94m
  SET LM=[95m
  SET LC=[96m
  SET LW=[97m

  SET DK=[30m
  SET DR=[31m
  SET DG=[32m
  SET DY=[33m
  SET DB=[34m
  SET DM=[35m
  SET DC=[36m
  SET DW=[37m

  Set "EchoElev=Echo.%G%"

  Call :Elevate %* || (
    Echo.%N%
    Exit /B
  )
  Echo.%N%

  For /F "tokens=* UseBackQ" %%A In (`PowerShell "Get-MpPreference | Select-Object -ExpandProperty EnableControlledFolderAccess" 2^>Nul`) Do (
    If "%%A" == "1" (
      Echo.%DR%Controlled folders is %R%enabled%DR%. It will be temporarily disabled.%N%
      Pause
      Set __EnableContolledFolders=1
      PowerShell "Set-MpPreference -EnableControlledFolderAccess Disabled"
    )
  )

  Set "Echo=Echo.%N%"
  Set "Debug=REM "
  Set "Desktop=1"
  Set "StartMenu=1"
  Set "Clone=1"
  Set "ExistingPrograms=1"
  Set "HasNameFilter=0"
  :Next_Arg
  If "%1" == "" GoTo :NoMoreArgs
  If "%1" == "--no-clone" (
    Set "Clone=0"
  ) Else If "%1" == "--debug" (
    Set "Debug=Echo.%DG%"
  ) Else If "%1" == "-d" (
    Set "Debug=Echo.%DG%"
  ) Else If "%1" == "--desktop" (
    Set "Desktop=1"
    Set "StartMenu=0"
    Set "ExistingPrograms=0"
  ) Else If "%1" == "--start-menu" (
    Set "Desktop=0"
    Set "StartMenu=1"
    Set "ExistingPrograms=0"
  ) Else If "%1" == "--programs" (
    Set "Desktop=0"
    Set "StartMenu=0"
    Set "ExistingPrograms=1"
  ) Else (
    Set "HasNameFilter=1"
    Set "FilterName" 1>Nul 2>Nul && (
      Set FilterName=%FilterName% %1
    ) || (
      Set FilterName=%1
    )
  )
  Shift
  GoTo :Next_Arg
  :NoMoreArgs
  %Debug%Debug="%Debug%"
  %Debug%Desktop="%Desktop%"
  %Debug%StartMenu="%StartMenu%"
  %Debug%Clone="%Clone%"

  Call :CreateCopyMoveAllLinks

  If "%__EnableContolledFolders%" == "1" (
    PowerShell "Set-MpPreference -EnableControlledFolderAccess Enabled"
  )

Exit /B
:Main_End


::
:: SetLnkAdmin
::
GoTo :SetLnkAdmin_End
:SetLnkAdmin
    Call :JScript "SetLnkAdmin" %*
Exit /B
REM ---------------- JScript Code ----------------*/
function SetLnkAdmin() {
    var filename = WScript.arguments(1);
    var adTypeBinary = 1;
    var adTypeText = 2;
    var adSaveCreateOverWrite = 2;
    var stream = new ActiveXObject("ADODB.Stream");
    stream.Type = adTypeText;
    stream.CharSet = '437';
    stream.Open();
    stream.LoadFromFile(filename);
    stream.Position = 21;
    stream.WriteText(" ");
    stream.SaveToFile(filename, adSaveCreateOverWrite);
    stream.Close();
}
@if (@X)==(@Y) @end /* ---------------- Batch code ----------------
:SetLnkAdmin_End


::
:: CreateShortcut
::
GoTo :CreateShortcut_End
:CreateShortcut
  Call :JScript "CreateShortcut" %*
Exit /B
REM ---------------- JScript Code ----------------*/
function CreateShortcut() {
    var link_path = WScript.arguments(1)
    var link_target = WScript.arguments(2)
    var oWS = new ActiveXObject("WScript.Shell")
    var oLink = oWS.CreateShortcut(link_path)
    oLink.TargetPath = link_target
    // oLink.WorkingDirectory = link_target
    // oLink.Description = "My Application"
    // oLink.IconLocation = "C:\MyApp\MyApp48.bmp"
    oLink.Save()
}
@if (@X)==(@Y) @end /* ---------------- Batch code ----------------
:CreateShortcut_End


::
:: JScript
::
GoTo :JScript_End
:JScript
    cscript.exe //E:JScript //nologo "%~dpnx0" %*
Exit /B
REM ---------------- JScript Code ----------------*/
    var discriminator = WScript.arguments(0)
    eval(discriminator+"()")
@if (@X)==(@Y) @end /* ---------------- Batch code ----------------
:JScript_End


::
:: Elevate
::
GoTo :Elevate_End
:Elevate
%Debug%:Elevate

    ::::::::::::::::::::::::::::::::::::::::::::
    :: Automatically check & get admin rights V2
    ::::::::::::::::::::::::::::::::::::::::::::
    %EchoElev%=============================
    %EchoElev%Running Admin shell
    %EchoElev%%~dpnx0 %*
    %EchoElev%=============================

    :init
    SetLocal DisableDelayedExpansion
    Set "batchPath=%~dpnx0"
    For %%K In (%batchPath%) Do Set batchName=%%~nK
    Set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
    Set "cmdGetPrivileges=%temp%\OEgetPriv_%batchName%.cmd"
    SetLocal EnableDelayedExpansion
    
    %EchoElev%vbsGetPrivileges=%vbsGetPrivileges%
    %EchoElev%cmdGetPrivileges=%cmdGetPrivileges%
    %EchoElev%batchPath=%batchPath%
    %EchoElev%ELEV_%batchName%=!ELEV_%batchName%!
    %EchoElev%=============================

    :checkPrivileges
    NET FILE 1>Nul 2>Nul
    If '%errorlevel%' == '0' (
      GoTo gotPrivileges
    ) Else (
      GoTo getPrivileges
    )

    :getPrivileges
    %EchoElev%:getPrivileges
    If "!ELEV_%batchName%!" == "1" (
        GoTo gotPrivileges
    )
    %EchoElev%
    %EchoElev%**************************************
    %EchoElev%Invoking UAC for Privilege Escalation
    %EchoElev%**************************************

    (
        Echo Set UAC = CreateObject^("Shell.Application"^)
        Echo UAC.ShellExecute "!cmdGetPrivileges!", "", "", "runas", 1
    ) > "%vbsGetPrivileges%"
    
    (
        Echo @Echo Off
        Echo Set "ELEV_%batchName%=1"
        Echo Call "%batchPath%" %*
    ) > "%cmdGetPrivileges%"

    "%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
    Exit /B 1

    :gotPrivileges
    %EchoElev%:gotPrivileges
    SetLocal & PushD .
    CD /d %~dp0
    If "!ELEV_%batchName%!" == "1" (
        Del "%vbsGetPrivileges%" 1>Nul 2>Nul
        Del "%cmdGetPrivileges%" 1>Nul 2>Nul
    )
    Exit /B 0

Exit /B
:Elevate_End


:: Call main function
Call :Main %*

REM ---------------- JScript Code ----------------*/
