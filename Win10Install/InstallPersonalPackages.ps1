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
if (!(Test-Path "C:\Program Files (x86)\FinalWire\AIDA64 Extreme\aida64.exe")) {
    choco install aida64-extreme --force --ignore-checksums -y
}

# Install Intel XTU
if (!(Test-Path "C:\Program Files\Intel\Intel(R) Extreme Tuning Utility\Client\XtuUiLauncher.exe")) {
    choco install intel-xtu --force -y
}

# Install EVGA Precision X1
if (!(Test-Path "C:\Program Files\EVGA\Precision X1\PrecisionX_x64.exe")) {
    choco install evga-precision-x1 --force -y
}

# Install EVGA ELEET
if (!(Test-Path "C:\Program Files\EVGA\ELeetTune.exe")) {
    choco install evga-eleet --force -y
}

# Install 3DMark
if (!(Test-Path "C:\Program Files\UL\3DMark\3DMark.exe")) {
    choco install 3dmark --force -y
}

# BenchMate has to be downloaded and installed manually since there is no direct URL
# The thing I can do is create a reminder by opening a browser to BenchMate
# Make sure to install under the default location
if (!(Test-Path "C:\Program Files (x86)\Benchmate\BenchMate.exe")) {
    Start-Process "https://benchmate.org/"
}

# Linpack Xtreme has to be downloaded and installed manually since there is no direct URL
# open to the download page for installation reminder
# Make sure to unzip the file and copy to C:\Program Files\LinpackXtreme without the version at the end of the folder name
if(!(Test-Path "C:\Program Files\LinpackXtreme\LinpackXtreme_x64.exe")) {
    Start-process "https://www.techpowerup.com/download/linpack-xtreme/"
}

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
    Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/LinpackXtreme_x64.lnk" -OutFile "$HOME\Desktop\LinpackXtreme_x64.lnk"
    Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/AIDA64 Extreme.lnk" -OutFile "$HOME\Desktop\AIDA64 Extreme.lnk"
    Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/EVGA Precision X1.lnk" -OutFile "$HOME\Desktop\EVGA Precision X1.lnk"
}

# Change background image
Invoke-WebRequest -Uri "$githubURIPath/images/eopsinDesktop.png" -OutFile "$HOME\Pictures\eopsinDesktop.png"
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "$HOME\Pictures\eopsinDesktop.png"

# Turn on Dark Mode systemwide
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force

# Turn off UAC
#Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

# Copy toolbox items
$nispeToolboxPath = "C:\nispoe\toolbox"
New-Item $nispeToolboxPath -ItemType Directory
Invoke-WebRequest -Uri "$githubURIPath/toolbox/Windows/EnableStartupApps.ps1" -OutFile "$nispeToolboxPath\EnableStartupApps.ps1"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/EnableStartupApps.lnk" -OutFile "$HOME\Desktop\EnableStartupApps.lnk"
Invoke-WebRequest -Uri "$githubURIPath/toolbox/Windows/OpenMemoryApps.ps1" -OutFile "$nispeToolboxPath\OpenMemoryApps.ps1"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/OpenMemoryApps.lnk" -OutFile "$HOME\Desktop\OpenMemoryApps.lnk"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/HWiNFO64.lnk" -OutFile "$nispeToolboxPath\HWiNFO64.lnk"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/CPUID CPU-Z.lnk" -OutFile "$nispeToolboxPath\CPUID CPU-Z.lnk"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/LinpackXtreme_x64.lnk" -OutFile "$nispeToolboxPath\LinpackXtreme_x64.lnk"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/BenchMate.lnk" -OutFile "$nispeToolboxPath\BenchMate.lnk"
Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/AIDA64 Extreme.lnk" -OutFile "$nispeToolboxPath\AIDA64 Extreme.lnk"