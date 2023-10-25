# Export the list of resource groups to a CSV file
az group list --output table --query "[].{Name:name,Location:location}" > ResourceGroups.csv

