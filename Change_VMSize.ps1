# Define your variables
$resourceGroupName = "YourResourceGroupName"
$vmName = "YourVMName"
$newVMSize = "Standard_DS2_v2"  # Replace with the desired VM size

# Get the current VM
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# Check if the new size is valid for the VM
if ($vm.HardwareProfile.VmSize -ne $newVMSize) {
    Write-Host "Resizing VM to $newVMSize..."
    
    # Stop the VM before resizing (you can remove this if you want to perform a live resize)
    Stop-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Force

    # Resize the VM to the new size
    $vm.HardwareProfile.VmSize = $newVMSize
    Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm -Force

    Write-Host "VM resized to $newVMSize."
} else {
    Write-Host "VM is already of the desired size: $newVMSize."
}
