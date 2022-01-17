$Services = @(
# Windows 10
    "AudioendpointBuilder"                          # Windows Audio EndpointBuilder
    "Audiosrv"                                      # Windows Audio
    "Spooler"                                       # Print Spooler
    "DiagTrack"                                     # Connected User Experiences and Telemetry
    "DusmSvc"                                       # Data Usage
    "iphlpsvc"                                      # IP Hlper
    "PcaSvc"                                        # Program Compatibility Assistant Service
    "Wcmsvc"                                        # Windows Connection Manager
    "CDPSvc"                                        # Connected Devices Platform Service
    "NcbService"                                    # Network Connection Broker (Store Apps to receive notification from the internet)
    "DPS"                                           # Diagnostic Policy Service
    "LanmanServer"                                  # Server (file and print sharing support over network)
    "ShellHWDetection"                              # Shell Hardware Detection (AutoPlay hardware notifications)
    "SysMain"                                       # Maintains and improves system performance over time
    "UsoSvc"                                        # Update Orchestrator Service (Manages Windows Updates)
    "WbioSrvc"                                      # Windows Biometric Service
    "FontCache"                                     # Windows Font Cache Service
    "WSearch"                                       # Windows Search
# Windows 11
    "lfsvc"                                         # Geolocation Service
    "InstallService"                                # Microsoft Store Install Service
)

foreach ($Service in $Services) {
    Stop-Service -Name $Service -Force
    Set-Service -Name $Service -Status stopped -StartupType disabled
}
