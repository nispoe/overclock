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

# Install AIDA64 Extreme 
if (!(Test-Path "C:\Users\nispoe\AppData\Local\Programs\BenchMate\BenchMate.exe")) {
    choco install aida64-extreme
}

# BenchMate has to be downloaded and installed manually since there is no direct URL
# The thing I can do is create a reminder by opening a browser to BenchMate
Start-Process "https://benchmate.org/"

# Startup and shorcut paths
$startupPath = "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$githubURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main"

# Add 3DMark to the startup folder to trigger start when windows starts
if (!(Test-Path "$startupPath\3DMark.url")) {
    Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/3DMark.url" -OutFile "$startupPath\3DMark.url"
}

# Add shorcuts to system desktop
if (!(Test-Path "$HOME\Desktop\HWiNFO64.lnk")) {
    Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/HWiNFO64.lnk" -OutFile "$HOME\Desktop\HWiNFO64.lnk"
}

# Change background image
Invoke-WebRequest -Uri "$githubURIPath/images/eopsinDesktop.png" -OutFile "$HOME\Pictures\eopsinDesktop.png"
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "$HOME\Pictures\eopsinDesktop.png"

# Turn on Dark Mode systemwide
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0

# Turn off UAC
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

# Copy toolbox items
$nispeToolboxPath = "C:\nispoe\toolbox\Windows"
New-Item $nispeToolboxPath -ItemType Directory
Invoke-WebRequest -Uri "$githubURIPath/toolbox/Windows/EnableStartupApps.ps1" -OutFile "$nispeToolboxPath\EnableStartupApps.ps1"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/EnableStartupApps - Shortcut.lnk" -OutFile "$HOME\Desktop\EnableStartupApps - Shortcut.lnk"
Invoke-WebRequest -Uri "$githubURIPath/toolbox/Windows/OpenMemoryApps.ps1" -OutFile "$nispeToolboxPath\OpenMemoryApps.ps1"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/OpenMemoryApps - Shortcut.lnk" -OutFile "$HOME\Desktop\OpenMemoryApps - Shortcut.lnk"