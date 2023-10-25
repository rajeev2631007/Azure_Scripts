# Retrieve a list of available OS images
$osImages = Get-AzVMImageOffer -Location "YourRegion"
$osImages | Format-Table -AutoSize
$osImages | Export-Csv -Path "OSImages.csv" -NoTypeInformation
