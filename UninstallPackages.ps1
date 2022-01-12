$ProvisionedAppPackageNames = @(
    "Microsoft.549981C3F5F10"
    "Microsoft.BingWeather"
    "Microsoft.GetHelp"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.Getstarted"
    "microsoft.windowscommunicationsapps" # Mail,Calendar
    "Microsoft.Office.OneNote"
    "Microsoft.People"
    "Microsoft.SkypeApp"
    "Microsoft.XboxApp"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.MicrosoftEDViewer"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.YourPhone"
    "SpotifyAB.SpotifyMusic"
    "Microsoft.MixedReality.Portal"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.WindowsCamera"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsCalculator"
    "Microsoft.WindowsMaps"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.Screensketch"
    "Microsoft.Wallet"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.MSPaint"
    "Microsoft.HEIFImageExtension"
    "Microsoft.StorePurchaseApp"
    "Microsoft.VP9VideoExtensions"
    "Microsoft.WebMediaExtensions"
    "Microsoft.WebpImageExtension"
    "Microsoft.Windows.Photos"
    "Microsoft.WindowsStore"
    "Microsoft.Xbox.TCUI"
)

foreach ($ProvisionedAppName in $ProvisionedAppPackageNames) {
    Get-AppxPackage -Name $ProvisionedAppName -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $ProvisionedAppName | Remove-AppxProvisionedPackage -Online
}

ps onedrive | Stop-Process -Force
start-process "$env:windir\SysWOW64\OneDriveSetup.exe" "/uninstall"