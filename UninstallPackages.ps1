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
    
)

foreach ($ProvisionedAppName in $ProvisionedAppPackageNames) {
    Get-AppxPackage -Name $ProvisionedAppName -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $ProvisionedAppName | Remove-AppxProvisionedPackage -Online
}