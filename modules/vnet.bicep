resource vnet1 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: 'vnet1'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'infra'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'storage'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}

resource vnet2 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: 'vnet2'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.1.0.0/16']
    }
    subnets: [
      {
        name: 'infra'
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
      {
        name: 'storage'
        properties: {
          addressPrefix: '10.1.2.0/24'
        }
      }
    ]
  }
}

resource peer1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: 'vnet1-to-vnet2'
  parent: vnet1
  properties: {
    remoteVirtualNetwork: {
      id: vnet2.id
    }
    allowVirtualNetworkAccess: true
  }
}

resource peer2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: 'vnet2-to-vnet1'
  parent: vnet2
  properties: {
    remoteVirtualNetwork: {
      id: vnet1.id
    }
    allowVirtualNetworkAccess: true
  }
}

output vnet1InfraSubnetId string = vnet1.properties.subnets[0].id
output vnet2InfraSubnetId string = vnet2.properties.subnets[0].id
