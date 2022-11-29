@description('Name of the location')
param  location    string
@description('Unique name of the storage')
param  storagename string

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storagename
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

output storageaccount string = storagename
