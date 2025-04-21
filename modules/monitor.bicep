resource workspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: 'monitorWorkspace'
  location: resourceGroup().location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
