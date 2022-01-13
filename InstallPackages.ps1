Invoke-WebRequest -Uri 'https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe' -OutFile 'C:\SteamSetup.exe'
Start-Process -FilePath "C:\SteamSetup.exe" -ArgumentList "/S"
Remove-Item -Path "C:\SteamSetup.exe"