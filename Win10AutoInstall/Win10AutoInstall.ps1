# Collect information for script
$driveLetter = Read-Host "Enter drive letter"
$computerName = Read-Host "Enter Computer Name"
$loginName = Read-Host "Enter Login Name"

if (Test-Path "$driveLetter`:\sources") {
    # Generate the install.wim file under sources directory
    dism /Export-Image /SourceImageFile:"$driveLetter`:\sources\install.esd" /SourceIndex:6 /DestinationImageFile:"$driveLetter`:\sources\install.wim" /Compress:Max /CheckIntegrity
} else {
    Write-Output "Drive does not contain 'sources' directory try again"
}

# Create nispoe working directory
$nispoePath = "C:\nispoe"
if (!(Test-Path $nispoePath)) {
    New-Item -ItemType "directory" -Path $nispoePath
}

# Copy autounattend.xml file to nispoe working directory to modify
$shortcutURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main/Win10AutoInstall"
Invoke-WebRequest -Uri "$shortcutURIPath/autounattend.xml" -OutFile "$nispoePath\autounattend.xml"

# Replace Computer Name and Login Name
$autounattendFile = "$nispoePath\autounattend.xml"
(Get-Content -path $autounattendFile -Raw) -replace "eopsin","$computerName" | Set-Content -Path $autounattendFile
(Get-Content -path $autounattendFile -Raw) -replace "nispoe","$loginName" | Set-Content -Path $autounattendFile

# Copy autoattend.xml and install_Windows 10 Pro.clg files to USB drive
Copy-Item $autounattendFile -Destination "$driveLetter`:\"
Invoke-WebRequest -Uri "$shortcutURIPath/install_Windows 10 Pro.clg" -OutFile "$driveLetter`:\sources\install_Windows 10 Pro.clg"

# Cleanup nispoe working directory
Remove-Item -LiteralPath $nispoePath -Force -Recurse

