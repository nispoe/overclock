# Create nispoe directory
$nispoePath = "C:\nispoe"
if (!(Test-Path $nispoePath)) {
    New-Item -ItemType "directory" -Path $nispoePath
}

# Install Steam (This is where I have my 3DMark and EVGA Precision X1 software)
if (!(Test-Path "$nispoePath\SteamSetup.exe")) {
    Invoke-WebRequest -Uri "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -OutFile "$nispoePath\SteamSetup.exe"
    Start-Process -FilePath "$nispoePath\SteamSetup.exe" -ArgumentList "/S"
}

# Create place shortcuts for system startup
$startupPath = "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$shortcutURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main/shortcuts"
Invoke-WebRequest -Uri "$shortcutURIPath/3DMark.url" -OutFile "$startupPath\3DMark.url"

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install CPUz
choco install cpu-z.install

