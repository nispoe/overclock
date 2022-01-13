$ServiceNames = @(
    "Spooler"                           # Print Spooler
)

foreach ($Service in $ServiceNames) {
    Set-Service -Name $Service -Status stopped -StartupType disabled
}
