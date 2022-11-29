# deploys a resource at a set resource group (needs to be created beforehand) with provided template file
# the what-if enables the debugging mode, without actual deployment to the cloud
az deployment group create --resource-group test --template-file main.bicep --what-if