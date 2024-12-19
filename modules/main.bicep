param sqlServerName string
param databaseName string
param vaultName string
param privateEndpointName string
param vNetName string
param subNetWebName string
param subNetDataName string
param servicePlanName string
param webAppName string

module vNet 'vnet.bicep' = {
  name: 'vNet'
  params: {
    name: vNetName
  }
}

module serviceplan 'serviceplan.bicep' = {
  name: 'servicePlan'
  params: {
    name: servicePlanName
    location: resourceGroup().location
  }
}

module webapp 'webapp.bicep' = {
  name: 'webApp'
  params: {
    name: webAppName
    serverFarmResourceId: serviceplan.outputs.resourceId
    vNetName: vNetName
    vNetResourceId: vNet.outputs.resourceId
    subnetName: subNetWebName
  }
}

module sqlserver 'sqlserver.bicep' = {
  name: 'sqlServer'
  params:{
    name: sqlServerName
    databaseName: databaseName
    managedIdentityObjectId: webapp.outputs.managedIdentityObjectId
    webAppName: webAppName
  }
}

module privateendpoint 'privateendpoint.bicep' = {
  name: 'privateEndpoint'
  params:{
    name: privateEndpointName
    sqlServerName: sqlServerName
    sqlServerResourceId: sqlserver.outputs.resourceId
  }
}
