# Shortcut Created
# powershell.exe -ExecutionPolicy Bypass -File "C:\nispoe\toolbox\Windows\OpenMemoryApps.ps1"

for ($i=1; $i -le 5; $i++) {
    Invoke-Expression "C:\Progra~1\CPUID\CPU-Z\cpuz.exe"
}

Invoke-Expression "C:\Users\nispoe\AppData\Local\Programs\BenchMate\BenchMate.exe"
Invoke-Expression "& 'C:\Program Files (x86)\FinalWire\AIDA64 Extreme\aida64.exe'"