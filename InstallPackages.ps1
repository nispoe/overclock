# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install CPUz
choco install steam-client --force -y
choco install cpu-z.install --force -y
choco install hwinfo --force -y

# Create place shortcuts for system startup
$startupPath = "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$shortcutURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main/shortcuts"
Invoke-WebRequest -Uri "$shortcutURIPath/3DMark.url" -OutFile "$startupPath\3DMark.url"