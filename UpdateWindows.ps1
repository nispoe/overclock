Install-PackageProvider NuGet -Force
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module PSWindowsUpdate -Repository PSGallery
Get-WindowsUpdate -AcceptAll -Install -AutoReboot