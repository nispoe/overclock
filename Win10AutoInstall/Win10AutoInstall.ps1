Import-Module BitsTransfer

# Collect information for script 
$driveLetter = Read-Host "Enter USB drive letter"
$computerName = Read-Host "Enter Computer Name"
$loginName = Read-Host "Enter Login Name"

# Create nispoe working directory
$nispoePath = "C:\nispoe"
if (!(Test-Path $nispoePath)) {
    New-Item -ItemType "directory" -Path $nispoePath
}

if (Test-Path "$driveLetter`:\sources") {
    # Found the generation of the wim process faster on disk so copy to USB after file is generated.
    # Copy install.esd to workind directory
    Copy-Item "$driveLetter`:\sources\install.esd" -Destination "$nispoePath"
    # Generate the install.wim file under sources directory
    dism /Export-Image /SourceImageFile:"$nispoePath\install.esd" /SourceIndex:6 /DestinationImageFile:"$nispoePath\install.wim" /CheckIntegrity
    # Copy install.wim to USB drive
    Start-BitsTransfer -Source "$nispoePath\install.wim" -Destination "$driveLetter`:\sources\" -Description "$nispoePath\install.wim to $driveLetter`:\sources\install.wim" -DisplayName "Copying wim file"

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
} else {
    Write-Output "Drive letter does not look right, try running again."
}