param location string = resourceGroup().location

module vnet 'modules/vnet.bicep' = {
  name: 'vnetDeployment'
  params: {
    location: location
  }
}

module peers 'modules/peers.bicep' = {
  name: 'vnetPeeringDeployment'
  dependsOn: [vnet]
  params: {
    vnet1Id: vnet.outputs.vnet1Id
    vnet2Id: vnet.outputs.vnet2Id
  }
}

// Add VM, Storage, and Monitor modules below
module vm1 'modules/vm.bicep' = {
  name: 'vm1Deployment'
  params: {
    vnetName: 'vnet1'
    subnetName: 'infra'
    vmName: 'vm1'
  }
}

module vm2 'modules/vm.bicep' = {
  name: 'vm2Deployment'
  params: {
    vnetName: 'vnet2'
    subnetName: 'infra'
    vmName: 'vm2'
  }
}

module storage1 'modules/storage.bicep' = {
  name: 'storage1Deployment'
  params: {
    location: location
    storageAccountName: 'storagevnet1'
  }
}

module storage2 'modules/storage.bicep' = {
  name: 'storage2Deployment'
  params: {
    location: location
    storageAccountName: 'storagevnet2'
  }
}

module monitor 'modules/monitor.bicep' = {
  name: 'monitorDeployment'
  params: {
    location: location
  }
}
