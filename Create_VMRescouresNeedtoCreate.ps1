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

# Sign in to your Azure account
Connect-AzAccount

# Set the current Azure subscription
Set-AzContext -Subscription $subscriptionName

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location $region

# Create a virtual network and subnet
$subnetConfig = New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.0.0/24"
New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -Location $region -AddressPrefix "10.0.0.0/16" -Subnet $subnetConfig

# Create a network security group
$networkSecurityGroup = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Location $region -Name $nsgName

# Create an availability set
$availabilitySet = New-AzAvailabilitySet -ResourceGroupName $resourceGroupName -Location $region -Name $availabilitySetName -Sku Aligned

# Create a virtual machine
New-AzVM `
    -ResourceGroupName $resourceGroupName `
    -Name $vmName `
    -Image $osImage `
    -Size $vmSize `
    -VirtualNetworkName $vnetName `
    -SubnetName $subnetName `
    -Location $region `
    -NetworkSecurityGroupName $nsgName `
    -AvailabilitySet $availabilitySetName
