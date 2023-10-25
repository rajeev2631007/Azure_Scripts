# Variables (Replace with your own values)
subscriptionName="YourSubscriptionName"
resourceGroupName="YourResourceGroupName"
region="YourRegion"
csvFilePath="AzureInfo.csv"

# Sign in to your Azure account (if not already logged in)
az login

# Set the current Azure subscription
az account set --subscription "$subscriptionName"

# Get Subscription, Resource Group, and Region Information
subscriptionInfo=$(az account show)
resourceGroupInfo=$(az group show --name "$resourceGroupName")
regionsInfo=$(az account list-locations --query '[].{DisplayName:displayName, Name:name}' --output table)

# Get OS Images and VM Sizes
osImagesInfo=$(az vm image list-offers --location "$region" --publisher Canonical --sku UbuntuServer --all --output table)
vmSizesInfo=$(az vm list-sizes --location "$region" --output table)

# Get Virtual Network and Subnet Information
vnetInfo=$(az network vnet show --name "$resourceGroupName" --resource-group "$resourceGroupName" --query '{Name:name, AddressSpace:addressSpace, Subnets:subnets}' --output json)
subnetInfo=$(echo "$vnetInfo" | jq '.Subnets[]')

# Get Network Security Groups and Availability Sets
nsgInfo=$(az network nsg list --resource-group "$resourceGroupName" --query '[].{Name:name, Location:location}' --output table)
availabilitySetInfo=$(az vm availability-set list --resource-group "$resourceGroupName" --query '[].{Name:name, Location:location}' --output table)

# Display the results
echo "Subscription Info: $subscriptionInfo"
echo "Resource Group Info: $resourceGroupInfo"
echo "Regions Info: $regionsInfo"
echo "OS Images Info: $osImagesInfo"
echo "VM Sizes Info: $vmSizesInfo"
echo "Virtual Network Info: $vnetInfo"
echo "Subnet Info: $subnetInfo"
echo "NSG Info: $nsgInfo"
echo "Availability Set Info: $availabilitySetInfo"

# Export the output to a CSV file
echo "Subscription Info: $subscriptionInfo" > $csvFilePath
echo "Resource Group Info: $resourceGroupInfo" >> $csvFilePath
echo "Regions Info: $regionsInfo" >> $csvFilePath
echo "OS Images Info: $osImagesInfo" >> $csvFilePath
echo "VM Sizes Info: $vmSizesInfo" >> $csvFilePath
echo "Virtual Network Info: $vnetInfo" >> $csvFilePath
echo "Subnet Info: $subnetInfo" >> $csvFilePath
echo "NSG Info: $nsgInfo" >> $csvFilePath
echo "Availability Set Info: $availabilitySetInfo" >> $csvFilePath
