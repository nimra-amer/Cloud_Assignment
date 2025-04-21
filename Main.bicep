module vnet 'modules/vnet.bicep' = {
  name: 'vnetModule'
  params: {}
}

module storage1 'modules/storage.bicep' = {
  name: 'storage1'
  params: {
    storageAccountName: 'storagevnet1uni'  // Must be globally unique
    location: resourceGroup().location
  }
}

module storage2 'modules/storage.bicep' = {
  name: 'storage2'
  params: {
    storageAccountName: 'storagevnet2uni'  // Must be globally unique
    location: resourceGroup().location
  }
}

module vm1 'modules/vm.bicep' = {
  name: 'vm1'
  params: {
    vmName: 'vm-in-vnet1'
    subnetId: vnet.outputs.vnet1InfraSubnetId
  }
}

module vm2 'modules/vm.bicep' = {
  name: 'vm2'
  params: {
    vmName: 'vm-in-vnet2'
    subnetId: vnet.outputs.vnet2InfraSubnetId
  }
}

module monitor 'modules/monitor.bicep' = {
  name: 'monitor'
}
