# Install Azure PowerShell module if not already installed
Install-Module -Name Az -Force -AllowClobber

# Connect to Azure account
Connect-AzAccount

# Specify the resource group name
$resourceGroupName = "YourResourceGroupName"

# List NSGs in the specified resource group
$resourceGroupNSGs = Get-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName

# Display the NSG details
$resourceGroupNSGs | Format-Table -AutoSize

# Disconnect from Azure account (optional)
Disconnect-AzAccount
