@Echo off
For /f "tokens=1,2 delims=[]" %%a In (
  'ping -6 -n 1 "%~2"'
) Do (
 If "%%b" NEq "" Set "%~1=%%b"
)
