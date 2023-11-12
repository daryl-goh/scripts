# Get System Information
$systemInfo = Get-CimInstance -ClassName Win32_ComputerSystem
Write-Host "System Information:"
Write-Host "-------------------"
Write-Host "Computer Name: $($systemInfo.Name)"
Write-Host "Operating System: $($systemInfo.Caption) $($systemInfo.Version)"
Write-Host "Processor: $($systemInfo.Manufacturer) $($systemInfo.Model)"
Write-Host "Total Physical Memory: $($systemInfo.TotalPhysicalMemory / 1GB) GB"
Write-Host ""

# Check Disk Space
$diskSpace = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
Write-Host "Disk Space Information:"
Write-Host "-----------------------"
foreach ($disk in $diskSpace) {
    Write-Host "$($disk.DeviceID):"
    Write-Host "   Total Space: $($disk.Size / 1GB) GB"
    Write-Host "   Free Space: $($disk.FreeSpace / 1GB) GB"
}
Write-Host ""

# Check Memory Usage
$memoryInfo = Get-CimInstance -ClassName Win32_OperatingSystem
Write-Host "Memory Usage:"
Write-Host "-------------"
Write-Host "Total Memory: $($memoryInfo.TotalVisibleMemorySize / 1GB) GB"
Write-Host "Free Memory: $($memoryInfo.FreePhysicalMemory / 1GB) GB"
Write-Host ""

# Check Running Processes
$runningProcesses = Get-Process
Write-Host "Running Processes:"
Write-Host "------------------"
foreach ($process in $runningProcesses) {
    Write-Host "$($process.ProcessName) (ID: $($process.Id))"
}
