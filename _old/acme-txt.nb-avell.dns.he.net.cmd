FOR /F "eol=# tokens=*" %%i IN (%~dp0.env) DO SET %%i
curl -4 "https://%~3:%DNS_HE_PASSWORD%@dyn.dns.he.net/nic/update?hostname=%~2^&txt=%~4"
