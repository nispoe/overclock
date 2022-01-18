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
    # Copy autounattend.xml file to nispoe working directory to modify (reusing the Windows 10 autounattend.xml file)
    $shortcutURIPathWin10 = "https://raw.githubusercontent.com/nispoe/overclock/main/Win10Install"
    Invoke-WebRequest -Uri "$shortcutURIPathWin10/autounattend.xml" -OutFile "$nispoePath\autounattend.xml"

    # Replace Computer Name and Login Name
    $autounattendFile = "$nispoePath\autounattend.xml"
    (Get-Content -path $autounattendFile -Raw) -replace "eopsin","$computerName" | Set-Content -Path $autounattendFile
    (Get-Content -path $autounattendFile -Raw) -replace "nispoe","$loginName" | Set-Content -Path $autounattendFile

    # Copy autoattend.xml and install_Windows 10 Pro.clg files to USB drive (seems Windows 11 generates file that is different, but named the same as Windows 10)
    Copy-Item "$autounattendFile" -Destination "$driveLetter`:\"
    $shortcutURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main/Win11Install"
    Invoke-WebRequest -Uri "$shortcutURIPath/install_Windows 10 Pro.clg" -OutFile "$driveLetter`:\sources\install_Windows 10 Pro.clg"

    # Cleanup nispoe working directory
    Remove-Item -LiteralPath $nispoePath -Force -Recurse
} else {
    Write-Output "Drive letter does not look right, try running again."
}