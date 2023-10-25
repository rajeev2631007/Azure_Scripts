# Export the information about the current Azure subscription to a CSV file
az account show --output table --query "{Name:name,SubscriptionId:id,TenantId:tenantId,IsDefault:isDefault}" > SubscriptionInfo.csv

