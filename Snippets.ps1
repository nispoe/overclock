# Useful information around downloading a zip file and extracting the zip file
Invoke-WebRequest -Uri "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" -OutFile $nispoepath"\steamcmd.zip"
Expand-Archive $nispoepath"\steamcmd.zip" -DestinationPath $nispoepath"\steamcmd"
Start-Process -FilePath $nispoepath"\steamcmd\steamcmd.exe"


# Stuff I was messing with trying to make work related to automating the install of steam apps
# GitHub Link for Steam PS - https://github.com/hjorslev/SteamPS
# Link for Steam Database - https://steamdb.info/
Install-Module -Name SteamPS
Install-SteamCMD -InstallPath $nispoepath"\steamcmd" -Force

# 3DMark = 223850
Update-SteamApp -AppId 1654370 -Path "C\Program Files (x86)\Steam\steamapps\common\3DMark\" -Credential ChangeMe -Force
# 3DMark CPU Profile benchmarks	= 1654370
Update-SteamApp -AppId 223850 -Path "C:\Program Files (x86)\Steam\steamapps\common\3DMark\dlc\cpu-profile-test" -Credential ChangeMe -Force
# 3DMark Port Royal upgrade = 496103
Update-SteamApp -AppId 496103 -Path "C:\Program Files (x86)\Steam\steamapps\common\3DMark\dlc\port-royal-test" -Credential ChangeMe -Force

# EVGA Precision X1 = 268850
Update-SteamApp -AppId 268850 -Path "C:\Program Files (x86)\Steam\steamapps\common\EVGA PrecisionX" -Credential ChangeMe -Force