# Define your variables
$subscriptionName = "YourSubscriptionName"
$resourceGroupName = "YourResourceGroupName"
$region = "YourRegion"
$vmName = "YourVMName"
$osImage = "YourOSImage"
$vmSize = "YourVMSize"
$vnetName = "YourVirtualNetworkName"
$subnetName = "YourSubnetName"
$nsgName = "YourNSGName"
$availabilitySetName = "YourAvailabilitySetName"

# VM Configuration
$adminUsername = "YourAdminUsername"
$adminPassword = "YourAdminPassword"
$securityType = "NonDomainJoin"  # or "DomainJoin" if using a domain
$osDiskName = $vmName + "_OSDisk"
$publicIpAddressName = $vmName + "-PublicIP"
$dnsLabel = $vmName.ToLower()

# Sign in to your Azure account
Connect-AzAccount

# Set the current Azure subscription
Set-AzContext -Subscription $subscriptionName

# Create a virtual machine
New-AzVM `
    -ResourceGroupName $resourceGroupName `
    -Name $vmName `
    -Image $osImage `
    -Size $vmSize `
    -VirtualNetworkName $vnetName `
    -SubnetName $subnetName `
    -Location $region `
    -NetworkSecurityGroupName $nsgName `
    -AvailabilitySet $availabilitySetName `
    -Credential (New-Object System.Management.Automation.PSCredential ($adminUsername, (ConvertTo-SecureString $adminPassword -AsPlainText -Force))) `
    -OpenPorts 22,80,3389,443
