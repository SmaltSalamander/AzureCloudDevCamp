@description('Name of the location')
param  location    string = resourceGroup().location
@description('Unique name of the storage')
param   prefix      string  = 'rabbits'
param  storagename string = '${prefix}${uniqueString(resourceGroup().name)}'
param   globalRedundancy bool


resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storagename
  location: location
  kind: 'StorageV2'
  sku: {
    name: globalRedundancy ? 'Standard_GRS' : 'Standard_LRS'
  }
}

output storage_id string = storageaccount.id
