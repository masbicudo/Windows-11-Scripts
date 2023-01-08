if ($foo) {
    $true
} else {
    $false
}


if (Get-Variable 'foo' -Scope 'Local' -ErrorAction 'Ignore') {
    $true
} else {
    $false
}
