# JSON template file
$templateFile="azuredeploy.json"

# Getting date
$today=Get-Date -Format "MM-dd-yyyy"

# Creating deployment name
$deploymentName="addnameparameter-"+"$today"

# Calling resource creation using parameters
New-AzResourceGroupDeployment `
    -Name $deploymentName `
    -TemplateFile $templateFile `
    -storageName "learnfr02032025" `
    -storageAccountType "Standard_LRS"