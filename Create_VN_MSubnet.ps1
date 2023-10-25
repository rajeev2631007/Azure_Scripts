# Define your variables
$resourceGroupName = "YourResourceGroupName"
$vnetName = "YourVirtualNetworkName"
$location = "YourRegion"

# Create a new resource group (if it doesn't exist)
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a virtual network
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroupName -Name $vnetName -Location $location -AddressPrefix "10.0.0.0/16"

# Define subnet configurations
$subnet1Name = "Subnet1"
$subnet1AddressPrefix = "10.0.0.0/24"
$subnet2Name = "Subnet2"
$subnet2AddressPrefix = "10.0.1.0/24"

# Create the first subnet
$subnet1 = Add-AzVirtualNetworkSubnetConfig -Name $subnet1Name -AddressPrefix $subnet1AddressPrefix

# Create the second subnet
$subnet2 = Add-AzVirtualNetworkSubnetConfig -Name $subnet2Name -AddressPrefix $subnet2AddressPrefix

# Associate subnets with the virtual network
$vnet | Set-AzVirtualNetwork

# Output the created virtual network
$vnet
