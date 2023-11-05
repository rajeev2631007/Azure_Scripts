Connect-AzAccount

# Variables
$resourceGroupName = "YourResourceGroup"
$location = "East US" # Replace with your desired Azure region
$vmName = "YourVMName"
$adminUsername = "YourAdminUser"
$adminPassword = "YourAdminPassword" # Replace with a secure password
$templateFile = "C:\Path\To\YourTemplate.json" # Replace with the path to your ARM template file
$templateParametersFile = "C:\Path\To\YourParameters.json" # Replace with the path to your parameters file

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Deploy the virtual machine using the ARM template and parameters
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -TemplateParameterFile $templateParametersFile -vmName $vmName -adminUsername $adminUsername -adminPassword $adminPassword
