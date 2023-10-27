# Define your variables
$resourceGroupName = 'myrg'
$vmName = 'myvm'

# Start the Azure virtual machine
Restart-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
