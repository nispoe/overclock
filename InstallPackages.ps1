# Install Chocolatey
if (!(Test-Path "C:\ProgramData\chocolatey\choco.exe")) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Steam Client
if (!(Test-Path "C:\Program Files (x86)\Steam\steam.exe")) {
    choco install steam-client --force -y
}

# Install CPUz
if (!(Test-Path "C:\Program Files\CPUID\CPU-Z\cpuz.exe")) {
    choco install cpu-z.install --force -y
}

# Install HWInfo
if (!(Test-Path "C:\Program Files\HWiNFO64\HWiNFO64.exe")) {
    choco install hwinfo --force -y
}

# Install Nvidia Display Driver
if (!(Test-Path "C:\Program Files\NVIDIA Corporation\Control Panel Client\nvcplui.exe")) {
    choco install nvidia-display-driver --force -y
}

# Add shortcuts to system startup
$startupPath = "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$shortcutURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main/shortcuts"
Invoke-WebRequest -Uri "$shortcutURIPath/3DMark.url" -OutFile "$startupPath\3DMark.url"

# Add shorcuts to system desktop
Invoke-WebRequest -Uri "$shortcutURIPath/HWiNFO64.lnk" -OutFile "$HOME\Desktop\HWiNFO64.lnk"