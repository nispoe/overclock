Write-Host "Applications installed as part of the user profile first time setup"
Get-AppxProvisionedPackage -Online | Select-object DisplayName