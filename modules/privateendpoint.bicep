param name string
param sqlServerName string
param sqlServerResourceId string
param vNetResourceId string
param subNetName string

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2024-01-01' = {
  name: name
  location: 'canadacentral'
  properties: {
    privateLinkServiceConnections: [
      {
        name: name
        properties: {
          privateLinkServiceId: sqlServerResourceId
          groupIds: [
            'SqlServer'
          ]
          privateLinkServiceConnectionState: {
            status: 'Approved'
            description: 'Auto-approved'
            actionsRequired: 'None'
          }
        }
      }
    ]
    manualPrivateLinkServiceConnections: []
    subnet: {
      id: '${vNetResourceId}/subnets/${subNetName}'
    }
    ipConfigurations: []
    customDnsConfigs: [
      {
        fqdn: '${sqlServerName}.database.windows.net'
        ipAddresses: [
          '10.0.2.4'
        ]
      }
    ]
  }
}
