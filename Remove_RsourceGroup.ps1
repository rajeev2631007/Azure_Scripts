# Define your variable
$resourceGroupName = 'myrg'

# Remove (delete) the Azure Resource Group
Remove-AzResourceGroup -Name $resourceGroupName -Force
