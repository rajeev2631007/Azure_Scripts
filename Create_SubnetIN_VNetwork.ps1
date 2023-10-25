# Define your variables
$resourceGroupName = "YourResourceGroupName"
$vnetName = "YourVirtualNetworkName"
$subnetName = "NewSubnet"
$subnetAddressPrefix = "10.0.2.0/24"  # Adjust to your desired subnet address prefix
$location = "YourRegion"

# Retrieve the existing virtual network
$vnet = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName

# Create a new subnet configuration
$newSubnet = Add-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $subnetAddressPrefix

# Add the new subnet configuration to the virtual network
$vnet | Add-AzVirtualNetworkSubnetConfig -Name $newSubnet

# Update the virtual network to include the new subnet
$vnet | Set-AzVirtualNetwork

# Output the updated virtual network
$vnet
