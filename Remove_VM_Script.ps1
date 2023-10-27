# Define your variables
$resourceGroupName = 'myrg'
$vmName = 'myvm'

# Remove (delete) the Azure virtual machine
Remove-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Force
