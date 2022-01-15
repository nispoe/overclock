$packages = @(
    "Microsoft.549981C3F5F10"                       # Cortana
    "Microsoft.BingWeather"                         # Microsoft Bing Weather
    "Microsoft.BingFinance"                         # Microsoft Bing Finance
    "Microsoft.BingNews"                            # Microsoft Bing News
    "Microsoft.BingSports"                          # Microsoft Bing Sports
    "Microsoft.GetHelp"                             # Microsoft Help
    "Microsoft.Getstarted"                          # Microsoft Get Started
    "Microsoft.WindowsFeedbackHub"                  # Microsoft Windows Feedback Hub
    "microsoft.windowscommunicationsapps"           # Microsoft Mail and Calendar
    "Microsoft.MicrosoftOfficeHub"                  # Microsoft Office
    "Microsoft.MicrosoftEDViewer"                   # Microsoft ED Viewer (Word Viewer)
    "Microsoft.MicrosoftStickyNotes"                # Microsoft Sticky Notes
    "Microsoft.Office.OneNote"                      # Microsoft OneNote
    "Microsoft.SkypeApp"                            # Microsoft Skype
    "Microsoft.People"                              # Microsoft People
    "Microsoft.WindowsAlarms"                       # Microsoft Windows Alarms
    "Microsoft.WindowsCalculator"                   # Microsoft Windows Calculator
    "Microsoft.WindowsMaps"                         # Microsoft Windows Maps
    "Microsoft.MSPaint"                             # Microsoft MSPaint
    "Microsoft.Windows.Photos"                      # Microsoft Windows Photos
    "Microsoft.WindowsCamera"                       # Microsoft Windows Camera
    "Microsoft.WindowsSoundRecorder"                # Microsoft Windows Sound Recorder
    "Microsoft.YourPhone"                           # Microsoft Your Phone
    "Microsoft.Microsoft3DViewer"                   # Microsoft 3D Viewer (VR)
    "Microsoft.MixedReality.Portal"                 # Microsoft Mixed Reality Portal (VR)
    "Microsoft.WindowsStore"                        # Microsoft Windows Store
    "Microsoft.StorePurchaseApp"                    # Microsoft Store Purchase App
    "Microsoft.Wallet"                              # Microsoft Wallet
    "Microsoft.WebMediaExtensions"                  # Open source formats on the web
    "Microsoft.VP9VideoExtensions"                  # VP9 video codec for internet streaming
    "Microsoft.WebpImageExtension"                  # WebP image viewing
    "Microsoft.HEIFImageExtension"                  # High Efficiency Image File (HEIF) format
    "Microsoft.XboxApp"                             # Microsoft Xbox
    "Microsoft.XboxGameOverlay"                     # Microsoft Xbox
    "Microsoft.XboxGamingOverlay"                   # Microsoft Xbox
    "Microsoft.XboxIdentityProvider"                # Microsoft Xbox
    "Microsoft.XboxSpeechToTextOverlay"             # Microsoft Xbox
    "Microsoft.Xbox.TCUI"                           # Microsoft Xbox
    "Microsoft.MicrosoftSolitaireCollection"        # Microsoft Solitare
    "Microsoft.ZuneMusic"                           # Microsoft Zune Music
    "Microsoft.ZuneVideo"                           # Microsoft Zune Video
    "SpotifyAB.SpotifyMusic"                        # Spotify
    "Disney.37853FC22B2CE"                          # Disney+
    "Microsoft.DesktopAppInstaller"                 # Testing removal Microsoft Desktop App Installer (Double Click Installer)
    "Microsoft.Screensketch"                        # Testing removal Microsoft Screen Sketch (Snipping Tool)
)

foreach ($package in $packages) {
    Get-AppxPackage -Name $package -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $package | Remove-AppxProvisionedPackage -Online
}

if (Test-Path "$env:windir\SysWOW64\OneDriveSetup.exe") {
    Get-Process onedrive | Stop-Process -Force
    Start-Process "$env:windir\SysWOW64\OneDriveSetup.exe" "/uninstall"
}