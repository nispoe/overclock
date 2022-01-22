# Shortcut Created
# powershell.exe -ExecutionPolicy Bypass -File "C:\nispoe\toolbox\Windows\EnableStartupApps.ps1"

#Add 3DMark to the startup folder to trigger start when windows starts
if (!(Test-Path "$startupPath\3DMark.url")) {
    Invoke-WebRequest -Uri "$githubURIPath/Win10Install/shortcuts/3DMark.url" -OutFile "$startupPath\3DMark.url"
}