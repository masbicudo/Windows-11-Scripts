@rem https://dns.he.net/docs.html
@Echo Off
SetLocal EnableDelayedExpansion

Set "password=BrX5SVkfI1wHd93T"
Set "entry=nb-avell.home.masbicudo.com"

Set "ipv6_ns="
Set "ipv6_my="
Set "ipv4_ns="
Set "ipv4_my="

For /f "tokens=1,2 delims=[]" %%a In (
  'ping -6 -n 1 %entry%'
) Do (
 If "%%b" NEq "" Set "ipv6_ns=%%b"
)

For /f "tokens=1,2 delims=[]" %%a In (
  'ping -4 -n 1 %entry%'
) Do (
 If "%%b" NEq "" Set "ipv4_ns=%%b"
)

For /f "tokens=1* delims=: " %%a In (
  'nslookup myip.opendns.com. resolver1.opendns.com 2^>NUL^|find "Address:"'
) Do (
 If "%%b" NEq "" Set "ipv6_my=%%b"
)

For /f "tokens=1* delims=: " %%a In (
  'powershell Invoke-RestMethod api.ipify.org'
) Do (
 If "%%a" NEq "" Set "ipv4_my=%%a"
)

REM Echo If "%ipv4_ns%" NEq "" If "%ipv4_ns%" NEq "%ipv4_my%"
If "%ipv4_ns%" NEq "" If "%ipv4_ns%" NEq "%ipv4_my%" (
  curl -4 "https://%entry%:%password%@dyn.dns.he.net/nic/update?hostname=%entry%"
  Echo.
)

REM Echo If "%ipv6_ns%" NEq "" If "%ipv6_ns%" NEq "%ipv6_my%"
If "%ipv6_ns%" NEq "" If "%ipv6_ns%" NEq "%ipv6_my%" (
  curl -6 "https://%entry%:%password%@dyn.dns.he.net/nic/update?hostname=%entry%"
  Echo.
)

If /I Not "%CMDCMDLINE:"=%" == "%COMSPEC%" Pause
