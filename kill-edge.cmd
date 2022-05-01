@if (@X)==(@Y) @end /* Harmless hybrid line that begins a JScript comment
:: -------- Batch code --------------
@Echo off

::
:: Main
::
GoTo :Main_End
:Main
  SetLocal EnableExtensions EnableDelayedExpansion
  
  TaskKill /im msedge.exe /f
  
  EndLocal
GoTo :eof
:Main_End

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