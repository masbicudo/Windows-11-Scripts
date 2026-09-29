$name = "dt-rtx3060ti.cf-ddns.sh"
$location = "D:\Projects\Windows-11-Scripts\"
$program = "C:\Program Files\Git\usr\bin\bash.exe"
$params = "-c ./dt-rtx3060ti.cf-ddns.sh"

Unregister-ScheduledTask -TaskName $name  -Confirm:$false -ErrorAction:SilentlyContinue  

$action = New-ScheduledTaskAction `
    -Execute "$program" `
    -Argument "$params" `
    -WorkingDirectory "$location"
$trigger = New-ScheduledTaskTrigger `
    -Once `
    -At (Get-Date) `
    -RepetitionInterval (New-TimeSpan -Minutes 5)
Register-ScheduledTask -TaskName $name  -Action $action -Trigger $trigger | Out-Null
