# Retrieve a list of available VM sizes for a region
$vmSizes = Get-AzVMSize -Location "YourRegion"
$vmSizes | Format-Table -AutoSize
$vmSizes | Export-Csv -Path "VMSizes.csv" -NoTypeInformation
