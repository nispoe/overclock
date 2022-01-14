$scripts = @(
    "https://raw.githubusercontent.com/nispoe/overclock/main/UpdateWindows.ps1"
    "https://raw.githubusercontent.com/nispoe/overclock/main/UninstallPackages.ps1"
    "https://raw.githubusercontent.com/nispoe/overclock/main/DisableServices.ps1"
    "https://raw.githubusercontent.com/nispoe/overclock/main/InstallPackages.ps1"
    "https://raw.githubusercontent.com/nispoe/overclock/main/ListOSInstalledPackages.ps1"
    "https://raw.githubusercontent.com/nispoe/overclock/main/ListUserInstalledPackages.ps1"
    "https://raw.githubusercontent.com/nispoe/overclock/main/ListRunningServices.ps1"
}

foreach ($script in $scripts) {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($script))
}