module vnet 'modules/vnet.bicep' = { name: 'vnetModule'; params: {} }
module storage1 'modules/storage.bicep' = { name: 'storage1'; params: { storageAccountName: 'storagevnet1', location: resourceGroup().location } }
module storage2 'modules/storage.bicep' = { name: 'storage2'; params: { storageAccountName: 'storagevnet2', location: resourceGroup().location } }
module monitor 'modules/monitor.bicep' = { name: 'monitor'; params: {} }
