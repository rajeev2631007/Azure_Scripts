# Retrieve a list of resource groups in your subscription
$resourceGroups = Get-AzResourceGroup
$resourceGroups | Format-Table -AutoSize
$resourceGroups | Export-Csv -Path "ResourceGroups.csv" -NoTypeInformation
