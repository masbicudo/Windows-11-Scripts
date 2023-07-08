@echo on

FOR /F "tokens=1,2 delims=: USEBACKQ" %%F IN (` powershell -command "ls '%~nx1' -r | measure -sum Length" `) DO (
  CALL :TRIM %%F %%G
)
ECHO Sum=%Sum%
ECHO Count=%Count%
set /a size=(((%Sum:~0,-6%)+(%Count:~0,-4%)+1000)*15/10/1000*1000)*1024/1000
ECHO size=%size%

vboxmanage createvdi --filename "%~n1.vdi" --size %size% --variant Standard
pause

goto :eof
:TRIM
SET %1=%2
GOTO :EOF
