#Adding Data Disks - PowerShell - Resources
#You can use the following commands as reference for adding data disks to an Azure virtual machine

$resourcegroup = 'test-grp'
$machinename = 'Loadvm1'
$location = 'Central US'
$storageType = 'Standard_LRS'
$dataDiskName = 'newdisk01'
$dataDiskSize = 20
 
$datadiskConfig = New-AzDiskConfig -SkuName $storageType -Location $location -CreateOption Empty -DiskSizeGB $dataDiskSize
 
$dataDisk01 = New-AzDisk -DiskName $dataDiskName -Disk $datadiskConfig -ResourceGroupName $resourcegroup
 
$vm = Get-AzVM -Name $machinename -ResourceGroupName $resourcegroup
 
$vm = Add-AzVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk01.Id -Lun 1
 
Update-AzVM -VM $vm -ResourceGroupName $resourcegroup
