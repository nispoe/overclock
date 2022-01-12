Install-PackageProvider NuGet -Force
Install-Module PSWindowsUpdate
Get-WindowsUpdate -AcceptAll -Install -AutoReboot