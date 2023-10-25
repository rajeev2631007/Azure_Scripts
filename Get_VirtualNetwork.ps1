# Retrieve information about virtual networks and subnets in a resource group
$resourceGroupName = "YourResourceGroupName"
$vnetInfo = Get-AzVirtualNetwork -ResourceGroupName $resourceGroupName
$subnetInfo = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnetInfo.Name
$vnetInfo, $subnetInfo | Format-Table -AutoSize
$vnetInfo, $subnetInfo | Export-Csv -Path "VirtualNetworkAndSubnetInfo.csv" -NoTypeInformation
