# Define your variables
$resourceGroupName = "YourResourceGroupName"
$nsgName = "YourNSGName"

# Define the rules for ports 80, 443, 3389, and 22
$inboundRules = @(
    @{
        Name = "HTTP"
        Priority = 100
        Access = "Allow"
        Direction = "Inbound"
        Protocol = "Tcp"
        SourceAddressPrefix = "*"
        SourcePortRange = "*"
        DestinationAddressPrefix = "*"
        DestinationPortRange = "80"
    },
    @{
        Name = "HTTPS"
        Priority = 101
        Access = "Allow"
        Direction = "Inbound"
        Protocol = "Tcp"
        SourceAddressPrefix = "*"
        SourcePortRange = "*"
        DestinationAddressPrefix = "*"
        DestinationPortRange = "443"
    },
    @{
        Name = "RDP"
        Priority = 102
        Access = "Allow"
        Direction = "Inbound"
        Protocol = "Tcp"
        SourceAddressPrefix = "*"
        SourcePortRange = "*"
        DestinationAddressPrefix = "*"
        DestinationPortRange = "3389"
    },
    @{
        Name = "SSH"
        Priority = 103
        Access = "Allow"
        Direction = "Inbound"
        Protocol = "Tcp"
        SourceAddressPrefix = "*"
        SourcePortRange = "*"
        DestinationAddressPrefix = "*"
        DestinationPortRange = "22"
    }
)

# Update the NSG with the new rules
$updatedNSG = Get-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $resourceGroupName

foreach ($rule in $inboundRules) {
    $updatedNSG | Add-AzNetworkSecurityRuleConfig -Name $rule.Name -Priority $rule.Priority -Access $rule.Access -Direction $rule.Direction -Protocol $rule.Protocol -SourceAddressPrefix $rule.SourceAddressPrefix -SourcePortRange $rule.SourcePortRange -DestinationAddressPrefix $rule.DestinationAddressPrefix -DestinationPortRange $rule.DestinationPortRange
}

# Apply the changes to the NSG
Set-AzNetworkSecurityGroup -NetworkSecurityGroup $updatedNSG
