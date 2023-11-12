# Basic System Information
Get-Host                                  # Display information about the PowerShell host.
Get-Process                               # Get information about running processes.
Get-Service                               # List all services on the system.

# Get-Process Examples
Get-Process -Name 'msedge'                # Get information about the Microsoft Edge process.
Get-Process | Sort-Object CPU -Descending   # Get a list of processes and sort them by CPU usage in descending order.
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5  # Get the top 5 processes by CPU usage.
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 | Format-Table -AutoSize  # Format the output as a table.
Get-Process | Sort-Object CPU -Descending | Select-Object Name, CPU -First 10 | Export-Csv -Path C:\Users\user\src\processes.csv  # Export the output to a CSV file.
Get-Process | Get-Member                   # Get information about the properties and methods of the Get-Process cmdlet.
Get-Process | Where-Object {$_.CPU -gt 100}  # Get processes where CPU usage is greater than 100.
Get-Process | Select-Object -Property Name, CPU, @{Name="Memory (MB)"; Expression={$_.Memory / 1MB}}  # Select specific properties and create a calculated property.
Get-Process | Where-Object -FilterScript ($PSItem.name -like 'msedge')  # Get processes where the name contains "msedge".


# File and Folder Management
Get-ChildItem C:\                         # List items in the C:\ directory.
New-Item -ItemType File -Path C:\test.txt  # Create a new file named test.txt.
Copy-Item C:\test.txt D:\                  # Copy test.txt from C:\ to D:\.

# Network Information
Test-Connection google.com                 # Test network connectivity to google.com.
Get-NetIPAddress                          # Display IP configuration details.

# User and Group Management
Get-LocalUser                              # List local users on the system.
New-LocalUser -Name "NewUser" -Password "Pass123!" -FullName "New User"  # Create a new local user.

# Event Log
Get-EventLog -LogName Application          # Retrieve events from the Application log.
Clear-EventLog -LogName Security           # Clear the Security event log.

# Registry
Get-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion' -Name 'ProgramFilesDir'  # Get value from the registry.

# PowerShell Help
Get-Help Get-Process                       # Get help information for the Get-Process cmdlet.
Get-Command -Name Get-Service              # Get details about the Get-Service cmdlet.

# Environment Variables
$env:USERNAME                              # Display the current username.
$env:COMPUTERNAME                          # Display the computer name.

# Working with Variables
$myVariable = "Hello, PowerShell!"         # Create a variable with a string.
Write-Output $myVariable                   # Output the value of the variable.

# String Manipulation
$myString = "PowerShell is awesome!"
$myString.Length                           # Get the length of the string.

# Conditional Statements
$number = 42
if ($number -eq 42) {
    Write-Output "The number is 42."
} else {
    Write-Output "The number is not 42."
}

# Loops
1..5 | ForEach-Object { Write-Output "Number: $_" }  # Loop through numbers 1 to 5.

# Functions
function Multiply ($a, $b) {
    $a * $b
}
Multiply 5 3                              # Call the Multiply function.

# Working with Arrays
$fruits = @("Apple", "Banana", "Orange")
$fruits[1]                                # Access the second element in the array.

# File Compression
Compress-Archive -Path C:\Folder -DestinationPath C:\Archive.zip  # Compress a folder into a zip file.

# Scheduled Tasks
New-ScheduledTask -Action { Write-Output "Task executed!" } -Trigger (New-ScheduledTaskTrigger -Daily -At 8am) -TaskName "MyTask"  # Create a scheduled task.

# Remote PowerShell Session
Enter-PSSession -ComputerName RemoteServer  # Enter a remote PowerShell session.

# Error Handling
try {
    Get-Item NoSuchItem
} catch {
    Write-Output "An error occurred: $_"
}

# Math Operations
[math]::Pow(2, 3)                          # Calculate 2^3 using the [math] class.

# Stop and Start Services
Stop-Service -Name serviceName             # Stop a service.
Start-Service -Name serviceName            # Start a service.
