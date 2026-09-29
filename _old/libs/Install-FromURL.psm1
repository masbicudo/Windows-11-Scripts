function Install-FromUrl {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Url,

        [Parameter(Mandatory=$true)]
        [string]$ExpectedHash,

        [ValidateSet("SHA256","SHA1","MD5")]
        [string]$HashAlgorithm = "SHA256",

        [string]$InstallerArgs = "",

        [string]$ProcessName = $null
    )

    # Kill process if requested
    if ($ProcessName) {
        Get-Process -Name $ProcessName -ErrorAction SilentlyContinue | Stop-Process -Force
        Start-Sleep -Seconds 1
    }

    # ✅ Real Downloads folder (respects relocation)
    $downloads = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path

    $fileName = Split-Path $Url -Leaf
    $filePath = Join-Path $downloads $fileName

    $needsDownload = $true

    if (Test-Path $filePath) {
        Write-Host "File already exists. Checking hash..."

        $actual = (Get-FileHash $filePath -Algorithm $HashAlgorithm).Hash

        if ($actual -ieq $ExpectedHash) {
            Write-Host "Hash OK. Reusing existing file."
            $needsDownload = $false
        } else {
            Write-Warning "Hash mismatch. Re-downloading..."
        }
    }

    if ($needsDownload) {
        Write-Host "Downloading..."
        Invoke-WebRequest $Url -OutFile $filePath

        $actual = (Get-FileHash $filePath -Algorithm $HashAlgorithm).Hash

        if ($actual -ine $ExpectedHash) {
            throw "Hash mismatch after download."
        }
    }

    Write-Host "Installing from: $filePath"

    if ($filePath -like "*.msi") {
        Start-Process "msiexec" -ArgumentList "/i `"$filePath`" $InstallerArgs" -Wait
    } else {
        Start-Process $filePath -ArgumentList $InstallerArgs -Wait
    }
}

Export-ModuleMember -Function Install-FromUrl
