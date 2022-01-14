$driveLetter = Read-Host "Enter drive letter"
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

# Copy autounattend.xml file to modify
$shortcutURIPath = "https://raw.githubusercontent.com/nispoe/overclock/main/Win10AutoInstall"
Invoke-WebRequest -Uri "$shortcutURIPath/autounattend.xml" -OutFile "$nispoePath\autounattend.xml"

$computerName = Read-Host "Enter Computer Name"
$loginName = Read-Host "Enter Login Name"


(Get-Content -path C:\ReplaceDemo.txt -Raw) -replace 'brown','white'
The quick white fox jumped over the lazy dog