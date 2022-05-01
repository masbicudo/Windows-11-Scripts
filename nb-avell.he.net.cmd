rem https://dns.he.net/docs.html
@Set "password=BrX5SVkfI1wHd93T"
@Set "entry=nb-avell.home.masbicudo.com"
curl -6 "https://%entry%:%password%@dyn.dns.he.net/nic/update?hostname=%entry%"
curl -4 "https://%entry%:%password%@dyn.dns.he.net/nic/update?hostname=%entry%"
@Pause
