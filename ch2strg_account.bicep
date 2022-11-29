param  location    string = resourceGroup().location
param   prefix      string  = 'rabbits'
param  storagename string = '${prefix}${uniqueString(resourceGroup().name)}'
@description('true for grs, false for lrs')
param   globalRedundancy bool


resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storagename
  location: location
  kind: 'StorageV2'
  sku: {
    name: globalRedundancy ? 'Standard_GRS' : 'Standard_LRS'
  }
}

resource symbolicname 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  name: 'string'
  parent: storageaccount
  properties: {
    defaultEncryptionScope: 'string'
    denyEncryptionScopeOverride: bool
    enableNfsV3AllSquash: bool
    enableNfsV3RootSquash: bool
    immutableStorageWithVersioning: {
      enabled: bool
    }
    metadata: {}
    publicAccess: 'string'
  }
}


output storage_id string = storageaccount.id
output storage_name string = storageaccount.id
// output blob_endpoint string = storageaccount.
