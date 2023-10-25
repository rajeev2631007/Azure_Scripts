# Variables (Replace with your own values)
$subscriptionName = "YourSubscriptionName"
$resourceGroupName = "YourResourceGroupName"
$region = "YourRegion"
$csvFilePath = "AzureInfo.csv"

# Sign in to your Azure account
Connect-AzAccount

# Set the current Azure subscription
Set-AzContext -Subscription $subscriptionName

# Get Subscription, Resource Group, and Region Information
$subscription = Get-AzSubscription -SubscriptionName $subscriptionName
$resourceGroups = Get-AzResourceGroup -Name $resourceGroupName
$regions = Get-AzLocation

# Get OS Images and VM Sizes
$osImages = Get-AzVMImageOffer -Location $region | Select-Object -First 1
$vmSizes = Get-AzVMSize -Location $region

# Get Virtual Network and Subnet Information
$vnetInfo = Get-AzVirtualNetwork -ResourceGroupName $resourceGroupName
$subnets = $vnetInfo | Get-AzVirtualNetworkSubnetConfig

# Get Network Security Groups and Availability Sets
$nsgs = Get-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName
$availabilitySets = Get-AzAvailabilitySet -ResourceGroupName $resourceGroupName

# Display the results
$subscription, $resourceGroups, $regions, $osImages, $vmSizes, $vnetInfo, $subnets, $nsgs, $availabilitySets

# Export the output to a CSV file
$subscription, $resourceGroups, $regions, $osImages, $vmSizes, $vnetInfo, $subnets, $nsgs, $availabilitySets | Export-Csv -Path $csvFilePath -NoTypeInformation

# Disconnect from Azure account (optional)
Disconnect-AzAccount
