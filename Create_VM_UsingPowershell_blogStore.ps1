Connect-AzAccount


# Variables
$resourceGroupName = "YourResourceGroup"
$location = "East US" # Replace with your desired Azure region
$vmName = "YourVMName"
$adminUsername = "YourAdminUser"
$adminPassword = "YourAdminPassword" # Replace with a secure password
$templateFileURL = "https://yourstorageaccount.blob.core.windows.net/templates/YourTemplate.json" # Replace with the URL to your ARM template
$templateParametersURL = "https://yourstorageaccount.blob.core.windows.net/templates/YourParameters.json" # Replace with the URL to your parameter file

# Connect to Azure (Sign in to Azure AD)
Connect-AzAccount

# Deploy the virtual machine using the ARM template and parameters
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri $templateFileURL -TemplateParameterUri $templateParametersURL -vmName $vmName -adminUsername $adminUsername -adminPassword $adminPassword
