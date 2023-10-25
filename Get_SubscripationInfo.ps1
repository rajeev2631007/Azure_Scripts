# Retrieve information about the current Azure subscription
$subscriptionInfo = Get-AzContext
$subscriptionInfo | Format-Table -AutoSize
$subscriptionInfo | Export-Csv -Path "SubscriptionInfo.csv" -NoTypeInformation
