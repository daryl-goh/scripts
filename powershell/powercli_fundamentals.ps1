# Connect vCenter Server or ESXi host
Connect-VIServer -Server 'vcsau2.cpbu.com'

#Exploring PowerCLI cmdlets
Get-Command -Type 'cmdlet' -Module 'VMware*'

#Counting PowerCLI cmdlets
(Get-Command -Type 'cmdlet' -Module 'VMware*').Count

#Explore cmdlets related to a specific object
Get-Command -Name'*VM'
Get-Command -Noun VM

Get-Command -Name '*VMHost'
Get-Command -Noun VMHost

#Get Help
Get-Help 'Get-VM'
Get-Help 'Get-VM' -Full
Get-Help 'Get-VM' -ShowWindow
Get-Help 'Get-VM' -Examples
Get-Help 'Get-VM' -Online

# Sorting and Grouping Objects
Get-VM | Sort-Object -Property PowerState, NumCpu, MemoryGB -Descending | Select-Object -First 5
Get-VM | Sort-Object -Property PowerState, NumCpu, MemoryGB -Descending | Group-Object -Property PowerState | Select-Object -Property PowerState


# Creating a New Cluster
New-Datacenter -Name 'MyDatacenter' -Location 'MyLocation'
New-Cluster -Name 'MyCluster' -Location 'MyLocation' -Datacenter 'MyDatacenter'

# Adding a Host to a Cluster
Get-Cluster -Name 'MyCluster' | New-VMHost -Name 'esxi01.cpbu.com' -Location 'MyCluster'

Get-Cluster -Name 'MyCluster' | Set-Cluster -HAEnabled $true -DrsEnabled $true



# Connect to vCenter Server or ESXi Host
Connect-VIServer -Server <Server> -User <Username> -Password <Password>
# Connect to vCenter Server or ESXi Host with specified credentials.

# Get Virtual Machines
Get-VM
# Retrieve a list of all virtual machines in the connected environment.

# Get Hosts
Get-VMHost
# List all ESXi hosts in the vCenter environment.

# Get Datastores
Get-Datastore
# Display a list of datastores available in the vCenter environment.

# Get Snapshots
Get-Snapshot -VM <VMName>
# Retrieve information about snapshots on a specific virtual machine.

# Create a New Virtual Machine
New-VM -Name "NewVM" -VMHost <Host> -Datastore <Datastore> -MemoryGB 4 -NumCPU 2 -DiskGB 40
# Create a new virtual machine with specified settings.

# Start a Virtual Machine
Start-VM -VM <VMName>
# Power on a virtual machine.

# Stop a Virtual Machine
Stop-VM -VM <VMName>
# Power off a virtual machine.

# Suspend a Virtual Machine
Suspend-VM -VM <VMName>
# Suspend (pause) a virtual machine.

# Clone a Virtual Machine
Clone-VM -VM <VMName> -Name "CloneVM" -Datastore <Datastore>
# Create a clone of an existing virtual machine.

# Remove a Virtual Machine
Remove-VM -VM <VMName> -Confirm:$false
# Remove (delete) a virtual machine.

# Get Virtual Machine Guest OS Information
Get-VM -Name <VMName> | Get-VMGuest
# Retrieve guest OS information for a specific virtual machine.

# Resize Virtual Machine Hard Disk
Get-HardDisk -VM <VMName> | Set-HardDisk -CapacityGB 60
# Resize the hard disk of a virtual machine to 60 GB.

# Create a Snapshot
New-Snapshot -VM <VMName> -Name "SnapshotName" -Description "Snapshot Description"
# Create a snapshot of a virtual machine.

# Remove a Snapshot
Get-Snapshot -VM <VMName> | Remove-Snapshot -Confirm:$false
# Remove a snapshot from a virtual machine.

# Get vCenter Events
Get-VIEvent -MaxSamples 5
# Retrieve the latest 5 vCenter events.

# Move a Virtual Machine to a Different Host
Move-VM -VM <VMName> -Destination <DestinationHost>
# Move a virtual machine to a different ESXi host.

# Set VM CPU and Memory Allocation
Set-VM -VM <VMName> -NumCPU 4 -MemoryGB 8
# Adjust the CPU and memory allocation for a virtual machine.

# Enable SSH on ESXi Host
Get-VMHostService -VMHost <Host> | Where-Object {$_.Key -eq "TSM-SSH"} | Start-VMHostService
# Enable SSH on an ESXi host.

# Disable SSH on ESXi Host
Get-VMHostService -VMHost <Host> | Where-Object {$_.Key -eq "TSM-SSH"} | Stop-VMHostService -Confirm:$false
# Disable SSH on an ESXi host.

# Retrieve ESXi Host Hardware Information
Get-VMHostHardware -VMHost <Host>
# Display hardware information for an ESXi host.

# Set ESXi Host DNS Configuration
Get-VMHost -Name <Host> | Get-VMHostNetwork | Set-VMHostNetwork -DomainName "example.com" -DnsAddress "192.168.1.1","192.168.1.2"
# Configure DNS settings for an ESXi host.

# Get VM Folder Information
Get-Folder -Name "MyFolder" | Get-VM
# Retrieve a list of virtual machines within a specific folder.

# Disconnect from vCenter Server or ESXi Host
Disconnect-VIServer -Server <Server> -Confirm:$false
# Disconnect from the specified vCenter Server or ESXi host.
