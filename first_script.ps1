Write-Host "Applications installed with the operating system"
Get-AppxPackage | Select-Object Name
Write-Host "Applications installed as part of the user profile first time setup"
Get-AppxProvisionedPackage -Online | Select-object DisplayName