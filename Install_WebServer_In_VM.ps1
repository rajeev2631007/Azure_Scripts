# Define your variables
$resourceGroupName = 'myrg'
$vmName = 'xyz'
$commandId = 'RunPowerShellScript'

# Define the PowerShell script you want to run
$script = 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'

# Use the variables in the Invoke-AzVMRunCommand cmdlet
Invoke-AzVMRunCommand -ResourceGroupName $resourceGroupName -VMName $vmName -CommandId $commandId -ScriptString $script
