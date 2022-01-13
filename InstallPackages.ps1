$nispoepath = "C:\nispoe"
New-Item -ItemType "directory" -Path $nispoepath
Invoke-WebRequest -Uri "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -OutFile $nispoepath"\SteamSetup.exe"
Start-Process -FilePath $nispoepath"\SteamSetup.exe" -ArgumentList "/S"