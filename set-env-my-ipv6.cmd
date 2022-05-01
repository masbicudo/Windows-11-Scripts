@Echo Off
For /f "tokens=1* delims=: " %%a In (
  'nslookup myip.opendns.com. resolver1.opendns.com 2^>NUL^|find "Address:"'
) Do (
 If "%%b" NEq "" Set "%~1=%%b"
)
