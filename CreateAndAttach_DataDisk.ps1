# Define your variables
$resourceGroupName = "YourResourceGroupName"
$vmName = "YourVMName"
$newDiskName = "NewDataDisk"
$diskSizeGB = 100  # Adjust to your desired disk size in GB
$diskType = "Standard_LRS"  # Change to "Premium_LRS" for SSD
$hostCaching = "None"  # Change to "ReadOnly" or "ReadWrite" as desired

# Create a new data disk
$diskConfig = New-AzDiskConfig -SkuName $diskType -Location (Get-AzResourceGroup -Name $resourceGroupName).Location -CreateOption Empty -DiskSizeGB $diskSizeGB -Caching $hostCaching
$newDisk = New-AzDisk -ResourceGroupName $resourceGroupName -DiskName $newDiskName -Disk $diskConfig

# Get the VM
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# Attach the new data disk to the VM
$vm = Add-AzVMDataDisk -VM $vm -Name $newDiskName -CreateOption Attach -ManagedDiskId $newDisk.Id -Lun 1

# Update the VM with the attached data disk
Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm

# To delete the VM and data disk (if needed), you can use the following:
# Remove-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Force
# Remove-AzDisk -ResourceGroupName $resourceGroupName -DiskName $newDiskName -Force
