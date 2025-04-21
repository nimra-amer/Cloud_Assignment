param vnet1Id string
param vnet2Id string

// Extract names from IDs
var vnet1Name = last(split(vnet1Id, '/'))
var vnet2Name = last(split(vnet2Id, '/'))

// Reference existing VNETs
resource vnet1 'Microsoft.Network/virtualNetworks@2022-07-01' existing = {
  name: vnet1Name
}

resource vnet2 'Microsoft.Network/virtualNetworks@2022-07-01' existing = {
  name: vnet2Name
}

// Peering from vnet1 to vnet2
resource peer1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: 'vnet1-to-vnet2'
  parent: vnet1
  properties: {
    remoteVirtualNetwork: {
      id: vnet2Id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
  }
}

// Peering from vnet2 to vnet1
resource peer2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: 'vnet2-to-vnet1'
  parent: vnet2
  properties: {
    remoteVirtualNetwork: {
      id: vnet1Id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
  }
}
