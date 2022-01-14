# Install Chocolatey
if (!(Test-Path "C:\ProgramData\chocolatey\choco.exe")) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Rufus Client
if (!(Test-Path "C:\Program Files (x86)\Steam\steam.exe")) {
    choco install rufus --force -y
}