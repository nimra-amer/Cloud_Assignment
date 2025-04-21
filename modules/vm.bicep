param vnetId string
param subnetName string
param vmName string

resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: resourceGroup().location
  properties: {
    hardwareProfile: { vmSize: 'Standard_B1s' }
    osProfile: {
      computerName: vmName
      adminUsername: 'azureuser'
      adminPassword: 'P@ssw0rd1234!'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resourceId('Microsoft.Network/networkInterfaces', '${vmName}-nic')
        }
      ]
    }
  }
}
