# Define your variables
resourceGroup="YourResourceGroupName"
vmName="YourVMName"
newDiskName="NewDataDisk"
diskSizeGB=100  # Adjust to your desired disk size in GB
diskType="Standard_LRS"  # Change to "Premium_LRS" for SSD
hostCaching="None"  # Change to "ReadOnly" or "ReadWrite" as desired

# Create a new data disk
az disk create --resource-group $resourceGroup --name $newDiskName --size-gb $diskSizeGB --sku $diskType --caching $hostCaching

# Get the VM resource ID
vmResourceId=$(az vm show -g $resourceGroup -n $vmName --query "id" --output tsv)

# Get the ID of the newly created data disk
newDiskId=$(az disk show -g $resourceGroup -n $newDiskName --query "id" --output tsv)

# Attach the data disk to the VM
az vm disk attach --vm $vmResourceId --name $newDiskName --caching $hostCaching --disk $newDiskId

# (Optional) Delete the VM (This is an irreversible action)
# az vm delete -g $resourceGroup -n $vmName --yes --no-wait

# (Optional) Delete the data disk
# az disk delete -g $resourceGroup -n $newDiskName --yes
