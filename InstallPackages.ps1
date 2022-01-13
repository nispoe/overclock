$nispoepath = "C:\nispoe"
New-Item -ItemType "directory" -Path $nispoepath
Invoke-WebRequest -Uri "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -OutFile $nispoepath"\SteamSetup.exe"
Start-Process -FilePath $nispoepath"\SteamSetup.exe" -ArgumentList "/S"

Invoke-WebRequest -Uri "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" -OutFile $nispoepath"\steamcmd.zip"
Expand-Archive $nispoepath"\steamcmd.zip" -DestinationPath $nispoepath"\steamcmd"