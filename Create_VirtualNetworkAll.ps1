# Define your variables
$resourceGroupName = "YourResourceGroupName"
$location = "YourRegion"
$vnetName = "YourVNetName"
$subnetName = "YourSubnetName"
$publicIpName = "YourPublicIpName"
$nicName = "YourNICName"
$nsgName = "YourNSGName"

# Create a new resource group (if it doesn't exist)
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a Virtual Network
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroupName -Name $vnetName -AddressPrefix "10.0.0.0/16" -Location $location

# Create a Subnet
$subnet = Add-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.0.0/24"
$vnet | Set-AzVirtualNetwork

# Create a Public IP
$publicIp = New-AzPublicIpAddress -ResourceGroupName $resourceGroupName -Name $publicIpName -AllocationMethod Dynamic -Location $location

# Create a Network Security Group (NSG)
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Name $nsgName -Location $location

# Allow inbound ports 80, 443, 3389, and 22
$nsg | Set-AzNetworkSecurityRuleConfig -Name "Allow-HTTP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80
$nsg | Set-AzNetworkSecurityRuleConfig -Name "Allow-HTTPS" -Access Allow -Protocol Tcp -Direction Inbound -Priority 101 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 443
$nsg | Set-AzNetworkSecurityRuleConfig -Name "Allow-RDP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 102 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389
$nsg | Set-AzNetworkSecurityRuleConfig -Name "Allow-SSH" -Access Allow -Protocol Tcp -Direction Inbound -Priority 103 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 22

$nsg | Set-AzNetworkSecurityGroup

# Create a Network Interface
$nic = New-AzNetworkInterface -ResourceGroupName $resourceGroupName -Name $nicName -Location $location -SubnetId $subnet.Id -PublicIpAddressId $publicIp.Id -NetworkSecurityGroupId $nsg.Id

# Output the created resources
$nic
