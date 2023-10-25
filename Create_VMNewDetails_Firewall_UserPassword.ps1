# Define your variables
$subscriptionName = "YourSubscriptionName"
$resourceGroupName = "YourResourceGroupName"
$region = "YourRegion"
$vmName = "YourVMName"
$osImage = "YourOSImage"
$vmSize = "YourVMSize"
$vnetName = "YourVirtualNetworkName"
$subnetName = "YourSubnetName"
$nsgName = "YourNSGName"
$availabilitySetName = "YourAvailabilitySetName"

# Administrator credentials
$adminUsername = "YourAdminUsername"
$adminPassword = "YourAdminPassword"  # Replace with your actual password
$securityType = "NonDomainJoin"  # or "DomainJoin" if using a domain

# Sign in to your Azure account
Connect-AzAccount

# Set the current Azure subscription
Set-AzContext -Subscription $subscriptionName

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location $region

# Create a virtual network and subnet
$subnetConfig = New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.0.0/24"
$virtualNetwork = New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -Location $region -AddressPrefix "10.0.0.0/16" -Subnet $subnetConfig

# Create a network security group
$networkSecurityGroup = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Location $region -Name $nsgName

# Define inbound security rules
$inboundRules = @(
    New-AzNetworkSecurityRuleConfig -Name "Allow_HTTP" -Description "Allow HTTP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 80,
    New-AzNetworkSecurityRuleConfig -Name "Allow_HTTPS" -Description "Allow HTTPS" -Access Allow -Protocol Tcp -Direction Inbound -Priority 101 -SourceAddressPrefix Internet -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 443,
    New-AzNetworkSecurityRuleConfig -Name "Allow_RDP" -Description "Allow RDP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 102 -SourceAddressPrefix Internet -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 3389,
    New-AzNetworkSecurityRuleConfig -Name "Allow_SSH" -Description "Allow SSH" -Access Allow -Protocol Tcp -Direction Inbound -Priority 103 -SourceAddressPrefix Internet -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 22
)

# Add the inbound rules to the network security group
$networkSecurityGroup | Add-AzNetworkSecurityRuleConfig -NetworkSecurityRule $inboundRules | Set-AzNetworkSecurityGroup

# Create an availability set
$availabilitySet = New-AzAvailabilitySet -ResourceGroupName $resourceGroupName -Location $region -Name $availabilitySetName -Sku Aligned

# Create a virtual machine
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize
$vmConfig = Set-AzVMOperatingSystem -VM $vmConfig -Windows -ComputerName $vmName -Credential (Get-Credential -UserName $adminUsername -Password $adminPassword) -ProvisionVMAgent -EnableAutoUpdate
$vmConfig = Set-AzVMSourceImage -VM $vmConfig -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest"
$vmConfig = Add-AzVMNetworkInterface -VM $vmConfig -Id $virtualNetwork.NetworkInterfaces[0].Id
$vmConfig = Set-AzVMOSDisk -VM $vmConfig -Name $vmName -CreateOption fromImage -Caching ReadWrite -VhdUri $null -Windows

New-AzVM -ResourceGroupName $resourceGroupName -Location $region -VM $vmConfig -NetworkSecurityGroup $networkSecurityGroup -AvailabilitySet $availabilitySet
