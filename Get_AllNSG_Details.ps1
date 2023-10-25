# Install Azure PowerShell module if not already installed
Install-Module -Name Az -Force -AllowClobber

# Connect to Azure account
Connect-AzAccount

# List all Network Security Groups
$allNSGs = Get-AzNetworkSecurityGroup

# Display the NSG details
$allNSGs | Format-Table -AutoSize

# Save the NSG list to a file (optional)
$allNSGs | Export-Csv -Path "NSGList.csv" -NoTypeInformation

# Disconnect from Azure account (optional)
Disconnect-AzAccount
