# Retrieve a list of Azure regions
$regions = Get-AzLocation | Select-Object Location
$regions | Format-Table -AutoSize
$regions | Export-Csv -Path "AzureRegions.csv" -NoTypeInformation
