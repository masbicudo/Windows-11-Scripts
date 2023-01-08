function Add-Path-First($Path) {
    $regKey = [Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Environment', 'ReadWriteSubTree')
    # $regKey = (Get-Item -path "HKCU:\Environment")
    $PathVar = $regKey.GetValue('Path', $null, "DoNotExpandEnvironmentNames")

    [System.Collections.ArrayList]$PathItems = $PathVar -split [IO.Path]::PathSeparator
    $PathItems.Remove("$Path")
    $PathVar = ($PathItems -join [IO.Path]::PathSeparator)
    $Item1 = $Path
    $Item2 = $PathVar
    $Path = $Item1 + [IO.Path]::PathSeparator + $Item2

    # [Environment]::SetEnvironmentVariable( "Path", $Path, "User" )
    $regKey.SetValue("Path", $Path, "ExpandString")

    $NewPath = [Environment]::GetEnvironmentVariable("PATH", "User") +
        [IO.Path]::PathSeparator + [Environment]::GetEnvironmentVariable("PATH", "Machine")
    $Env:path = $NewPath
    Write-Information "$Env:path"
}
