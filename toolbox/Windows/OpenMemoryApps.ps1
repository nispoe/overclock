# Shortcut Created
# powershell.exe -ExecutionPolicy Bypass -File "C:\nispoe\toolbox\OpenMemoryApps.ps1"

for ($i=1; $i -le 5; $i++) {
    Invoke-Expression "& 'C:\nispoe\toolbox\Windows\CPUID CPU-Z.lnk'"
}

Invoke-Expression "& 'C:\nispoe\toolbox\Windows\HWiNFO64.lnk'"
Invoke-Expression "& 'C:\nispoe\toolbox\Windows\LinpackXtreme_x64'"
Invoke-Expression "& 'C:\nispoe\toolbox\Windows\BenchMate.lnk'"
Invoke-Expression "& 'C:\nispoe\toolbox\Windows\AIDA64 Extreme.lnk'"