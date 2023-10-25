# Retrieve information about the current Azure subscription
az account show --output table
az account show --output json > SubscriptionInfo.csv
