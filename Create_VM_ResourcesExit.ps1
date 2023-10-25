# Define your variables
$subscriptionName = "YourSubscriptionName"
$resourceGroupName = "YourResourceGroupName"
$region = "YourRegion"
$vmName = "YourVMName"
$osImage = "YourOSImage"
$vmSize = "YourVMSize"
$vnetName = "YourVirtualNetworkName"
$subnetName = "YourSubnetName"p
$nsgName = "YourNSGName"
$availabilitySetName = "YourAvailabilitySetName"

# Sign in to your Azure account
Connect-AzAccount

# Set the current Azure subscription
Set-AzContext -Subscription $subscriptionName

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
