# Shortcut Created
# powershell.exe -ExecutionPolicy Bypass -File "C:\nispoe\toolbox\OpenMemoryApps.ps1"

for ($i=1; $i -le 5; $i++) {
    Invoke-Expression "& 'C:\nispoe\toolbox\CPUID CPU-Z.lnk'"
}

Invoke-Expression "& 'C:\nispoe\toolbox\HWiNFO64.lnk'"
Invoke-Expression "& 'C:\nispoe\toolbox\LinpackXtreme_x64.lnk'"
Invoke-Expression "& 'C:\nispoe\toolbox\BenchMate.lnk'"
Invoke-Expression "& 'C:\nispoe\toolbox\AIDA64 Extreme.lnk'"