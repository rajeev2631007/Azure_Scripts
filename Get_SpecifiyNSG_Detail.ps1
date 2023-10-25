# Retrieve information about a network security group
$nsgName = "YourNSGName"
$nsgInfo = Get-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $resourceGroupName
$nsgInfo | Format-Table -AutoSize
$nsgInfo | Export-Csv -Path "NSGInfo.csv" -NoTypeInformation
