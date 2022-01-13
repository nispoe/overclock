$ServiceNames = @(
    "AudioendpointBuilder"                          # Windows Audio EndpointBuilder
    "Audiosrv"                                      # Windows Audio
    "WinDefend"                                     # Microsoft Windows Defender Antivirus Service
    "WdNisSvc"                                      # Microsoft Defender Antivirus Network Inspection Service
    "wscsvc"                                        # Security Center
    "Spooler"                                       # Print Spooler
    "TabletInputService"                            # Touch Keyboard and Handwriting Panel pen and ink functionality
    "DiagTrack"                                     # Connected User Experiences and Telemetry
    "DusmSvc"                                       # Data Usage
    "DoSvc"                                         # Delivery Optimization
    "iphlpsvc"                                      # IP Hlper
    "PcaSvc"                                        # Program Compatibility Assistant Service
    "SecurityHealthService"                         # Windows Security Service
    "Wcmsvc"                                        # Windows Connection Manager
)

foreach ($Service in $ServiceNames) {
    Stop-Service -Name $Service -Force
    Set-Service -Name $Service -Status stopped -StartupType disabled
}
