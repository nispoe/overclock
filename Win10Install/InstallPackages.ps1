# Install Chocolatey
if (!(Test-Path "C:\ProgramData\chocolatey\choco.exe")) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Nvidia Display Driver
choco feature enable -n=useRememberedArgumentsForUpgrades
cinst geforce-game-ready-driver --package-parameters="'/dch'" --force -y