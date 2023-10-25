# Define your variables
subscriptionName="YourSubscriptionName"
resourceGroupName="YourResourceGroupName"
region="YourRegion"
vmName="YourVMName"
osImage="YourOSImage"
vmSize="YourVMSize"
vnetName="YourVirtualNetworkName"
subnetName="YourSubnetName"
nsgName="YourNSGName"
availabilitySetName="YourAvailabilitySetName"

# Sign in to your Azure account (if not already logged in)
az login

# Set the current Azure subscription
az account set --subscription "$subscriptionName"

# Create a virtual machine
az vm create \
  --resource-group "$resourceGroupName" \
  --name "$vmName" \
  --image "$osImage" \
  --size "$vmSize" \
  --vnet-name "$vnetName" \
  --subnet "$subnetName" \
  --location "$region" \
  --nsg "$nsgName" \
  --availability-set "$availabilitySetName"
