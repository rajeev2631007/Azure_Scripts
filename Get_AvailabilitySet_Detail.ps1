# Retrieve information about an availability set
$availabilitySetName = "YourAvailabilitySetName"
$availabilitySetInfo = Get-AzAvailabilitySet -Name $availabilitySetName -ResourceGroupName $resourceGroupName
$availabilitySetInfo | Format-Table -AutoSize
$availabilitySetInfo | Export-Csv -Path "AvailabilitySetInfo.csv" -NoTypeInformation
