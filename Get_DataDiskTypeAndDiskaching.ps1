# Define your variables
$resourceGroupName = "YourResourceGroupName"
$diskName = "YourDiskName"

# Get information about the disk
$disk = Get-AzDisk -ResourceGroupName $resourceGroupName -Name $diskName

# Retrieve data type and disk caching
$dataType = $disk.Sku.Tier
$diskCaching = $disk.DiskSizeGB.Caching

# Display the results
Write-Host "Disk Data Type: $dataType"
Write-Host "Disk Caching Type: $diskCaching"
