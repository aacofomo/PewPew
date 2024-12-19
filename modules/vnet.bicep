param name string

resource routeTable 'Microsoft.Network/routeTables@2024-01-01' = {
  name: name
  location: 'canadacentral'
  properties: {
    disableBgpRoutePropagation: false
    routes: [
      {
        name: 'SqlManagement_0'
        properties: {
          addressPrefix: '65.55.188.0/24'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_1'
        properties: {
          addressPrefix: '207.68.190.32/27'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_2'
        properties: {
          addressPrefix: '13.106.78.32/27'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_3'
        properties: {
          addressPrefix: '13.106.174.32/27'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_4'
        properties: {
          addressPrefix: '13.106.4.96/27'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_5'
        properties: {
          addressPrefix: '104.214.108.80/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_6'
        properties: {
          addressPrefix: '52.179.184.76/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_7'
        properties: {
          addressPrefix: '52.187.116.202/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_8'
        properties: {
          addressPrefix: '52.177.202.6/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_9'
        properties: {
          addressPrefix: '40.85.224.249/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_10'
        properties: {
          addressPrefix: '52.228.35.221/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_11'
        properties: {
          addressPrefix: '13.71.170.160/27'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_12'
        properties: {
          addressPrefix: '20.38.146.192/27'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_13'
        properties: {
          addressPrefix: '52.242.36.170/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_14'
        properties: {
          addressPrefix: '52.233.30.2/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_15'
        properties: {
          addressPrefix: '40.85.225.6/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'SqlManagement_16'
        properties: {
          addressPrefix: '40.79.47.96/32'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'Microsoft.Sql-managedInstances_UseOnly_subnet-10-0-1-0-24-to-vnetlocal'
        properties: {
          addressPrefix: '10.0.1.0/24'
          nextHopType: 'VnetLocal'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'Microsoft.Sql-managedInstances_UseOnly_mi-AzureActiveDirectory'
        properties: {
          addressPrefix: 'AzureActiveDirectory'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'Microsoft.Sql-managedInstances_UseOnly_mi-OneDsCollector'
        properties: {
          addressPrefix: 'OneDsCollector'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'Microsoft.Sql-managedInstances_UseOnly_mi-Storage.canadacentral'
        properties: {
          addressPrefix: 'Storage.canadacentral'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'Microsoft.Sql-managedInstances_UseOnly_mi-Storage.canadaeast'
        properties: {
          addressPrefix: 'Storage.canadaeast'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'Microsoft.Sql-managedInstances_UseOnly_optional-AzureCloud.canadacentral'
        properties: {
          addressPrefix: 'AzureCloud.canadacentral'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
      {
        name: 'Microsoft.Sql-managedInstances_UseOnly_optional-AzureCloud.canadaeast'
        properties: {
          addressPrefix: 'AzureCloud.canadaeast'
          nextHopType: 'Internet'
        }
        type: 'Microsoft.Network/routeTables/routes'
      }
    ]
  }
}

resource routeTablesAzureActiveDirectory 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/Microsoft.Sql-managedInstances_UseOnly_mi-AzureActiveDirectory'
  properties: {
    addressPrefix: 'AzureActiveDirectory'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_Microsoft_Sql_managedInstances_UseOnly_mi_OneDsCollector 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/Microsoft.Sql-managedInstances_UseOnly_mi-OneDsCollector'
  properties: {
    addressPrefix: 'OneDsCollector'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_Microsoft_Sql_managedInstances_UseOnly_mi_Storage_canadacentral 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/Microsoft.Sql-managedInstances_UseOnly_mi-Storage.canadacentral'
  properties: {
    addressPrefix: 'Storage.canadacentral'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_Microsoft_Sql_managedInstances_UseOnly_mi_Storage_canadaeast 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/Microsoft.Sql-managedInstances_UseOnly_mi-Storage.canadaeast'
  properties: {
    addressPrefix: 'Storage.canadaeast'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_Microsoft_Sql_managedInstances_UseOnly_optional_AzureCloud_canadacentral 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/Microsoft.Sql-managedInstances_UseOnly_optional-AzureCloud.canadacentral'
  properties: {
    addressPrefix: 'AzureCloud.canadacentral'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_Microsoft_Sql_managedInstances_UseOnly_optional_AzureCloud_canadaeast 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/Microsoft.Sql-managedInstances_UseOnly_optional-AzureCloud.canadaeast'
  properties: {
    addressPrefix: 'AzureCloud.canadaeast'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_Microsoft_Sql_managedInstances_UseOnly_subnet_10_0_1_0_24_to_vnetlocal 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/Microsoft.Sql-managedInstances_UseOnly_subnet-10-0-1-0-24-to-vnetlocal'
  properties: {
    addressPrefix: '10.0.1.0/24'
    nextHopType: 'VnetLocal'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_0 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_0'
  properties: {
    addressPrefix: '65.55.188.0/24'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_1 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_1'
  properties: {
    addressPrefix: '207.68.190.32/27'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_10 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_10'
  properties: {
    addressPrefix: '52.228.35.221/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_11 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_11'
  properties: {
    addressPrefix: '13.71.170.160/27'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_12 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_12'
  properties: {
    addressPrefix: '20.38.146.192/27'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_13 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_13'
  properties: {
    addressPrefix: '52.242.36.170/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_14 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_14'
  properties: {
    addressPrefix: '52.233.30.2/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_15 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_15'
  properties: {
    addressPrefix: '40.85.225.6/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_16 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_16'
  properties: {
    addressPrefix: '40.79.47.96/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_2 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_2'
  properties: {
    addressPrefix: '13.106.78.32/27'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_3 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_3'
  properties: {
    addressPrefix: '13.106.174.32/27'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_4 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_4'
  properties: {
    addressPrefix: '13.106.4.96/27'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_5 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_5'
  properties: {
    addressPrefix: '104.214.108.80/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_6 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_6'
  properties: {
    addressPrefix: '52.179.184.76/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_7 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_7'
  properties: {
    addressPrefix: '52.187.116.202/32'
    nextHopType: 'Internet'
    hasBgpOverride: false
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_8 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_8'
  properties: {
    addressPrefix: '52.177.202.6/32'
    nextHopType: 'Internet'
  }
  dependsOn: [
    routeTable
  ]
}

resource routeTable_name_SqlManagement_9 'Microsoft.Network/routeTables/routes@2024-01-01' = {
  name: '${name}/SqlManagement_9'
  properties: {
    addressPrefix: '40.85.224.249/32'
    nextHopType: 'Internet'
  }
  dependsOn: [
    routeTable
  ]
}

output resourceId string = routeTable.id
