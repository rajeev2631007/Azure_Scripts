# Define your variables
$resourceGroupName = 'myrg'
$vmName = 'myvm'

# Start the Azure virtual machine
Start-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
