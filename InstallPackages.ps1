# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install CPUz
choco install steam-client --force -y
choco install cpu-z.install --force -y
choco install hwinfo --force -y

# Add shortcuts to system startup
$startupPath = "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$shortcutURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main/shortcuts"
Invoke-WebRequest -Uri "$shortcutURIPath/3DMark.url" -OutFile "$startupPath\3DMark.url"
Invoke-WebRequest -Uri "$shortcutURIPath/CPUID CPU-Z.lnk" -OutFile "$startupPath\CPUID CPU-Z.lnk"

# Add shorcuts to system desktop
Invoke-WebRequest -Uri "$shortcutURIPath/HWiNFO64.lnk" -OutFile "$HOME\Desktop\HWiNFO64.lnk"