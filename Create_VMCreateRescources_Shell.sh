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

# Create a new resource group
az group create --name "$resourceGroupName" --location "$region"

# Create a virtual network and subnet
az network vnet create --name "$vnetName" --resource-group "$resourceGroupName" --location "$region" --address-prefix "10.0.0.0/16" --subnet-name "$subnetName" --subnet-prefix "10.0.0.0/24"

# Create a network security group
az network nsg create --resource-group "$resourceGroupName" --name "$nsgName"

# Create an availability set
az vm availability-set create --name "$availabilitySetName" --resource-group "$resourceGroupName" --location "$region" --platform-fault-domain-count 2 --platform-update-domain-count 5

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
