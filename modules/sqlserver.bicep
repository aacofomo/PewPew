@secure()
param name string
param webAppName string
param managedIdentityObjectId string
param databaseName string

resource sqlServer 'Microsoft.Sql/servers@2023-08-01-preview' = {
  name: name
  location: 'canadacentral'
  kind: 'v12.0'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    administratorLogin: 'CloudSA526c9358'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Disabled'
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'Application'
      login: '${webAppName}'
      sid: '${managedIdentityObjectId}'
      tenantId: subscription().tenantId
      azureADOnlyAuthentication: true
    }
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource sqlServer_ActiveDirectory 'Microsoft.Sql/servers/administrators@2023-08-01-preview' = {
  parent: sqlServer
  name: 'ActiveDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: '${webAppName}'
    sid: '${managedIdentityObjectId}'
    tenantId: subscription().tenantId
  }
}

resource sqlServer_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2023-08-01-preview' = {
  parent: sqlServer
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
}

resource sqlServer_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: sqlServer
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: sqlServer
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: sqlServer
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: sqlServer
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: sqlServer
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_sqlServer_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: sqlServer
  name: 'Default'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_sqlServer_Default 'Microsoft.Sql/servers/auditingSettings@2023-08-01-preview' = {
  parent: sqlServer
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_azureADOnlyAuthentications_sqlServer_Default 'Microsoft.Sql/servers/azureADOnlyAuthentications@2023-08-01-preview' = {
  parent: sqlServer
  name: 'Default'
  properties: {
    azureADOnlyAuthentication: true
  }
}

resource Microsoft_Sql_servers_connectionPolicies_sqlServer_default 'Microsoft.Sql/servers/connectionPolicies@2023-08-01-preview' = {
  parent: sqlServer
  name: 'default'
  properties: {
    connectionType: 'Default'
  }
}

resource sqlServer_database 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  parent: sqlServer
  name: databaseName
  location: 'canadacentral'
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Local'
    maintenanceConfigurationId: '/subscriptions/ebb51053-7f64-4ee9-a1c1-71e441d83ecc/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    availabilityZone: 'NoPreference'
  }
}

resource sqlServer_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2023-08-01-preview' = {
  name: '${name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_sqlServer_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${name}/master/Default'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_sqlServer_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2023-08-01-preview' = {
  name: '${name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_sqlServer_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2023-08-01-preview' = {
  name: '${name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_sqlServer_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2023-08-01-preview' = {
  name: '${name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    sqlServer
  ]
}

resource sqlServer_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2023-08-01-preview' = {
  name: '${name}/master/Current'
  properties: {}
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_sqlServer_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2023-08-01-preview' = {
  name: '${name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_sqlServer_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2023-08-01-preview' = {
  name: '${name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_sqlServer_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2023-08-01-preview' = {
  name: '${name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    sqlServer
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_sqlServer_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2023-08-01-preview' = {
  parent: sqlServer
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource sqlServer_current 'Microsoft.Sql/servers/encryptionProtector@2023-08-01-preview' = {
  parent: sqlServer
  name: 'current'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_sqlServer_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2023-08-01-preview' = {
  parent: sqlServer
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource sqlServer_ServiceManaged 'Microsoft.Sql/servers/keys@2023-08-01-preview' = {
  parent: sqlServer
  name: 'ServiceManaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_sqlServer_Default 'Microsoft.Sql/servers/securityAlertPolicies@2023-08-01-preview' = {
  parent: sqlServer
  name: 'Default'
  properties: {
    state: 'Enabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_sqlServer_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2023-08-01-preview' = {
  parent: sqlServer
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_sqlServer_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2023-08-01-preview' = {
  parent: sqlServer
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: ''
  }
}

resource sqlServer_database_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource sqlServer_database_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: sqlServer_database
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_database_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: sqlServer_database
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_database_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: sqlServer_database
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_database_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: sqlServer_database
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource sqlServer_database_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: sqlServer_database
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_databases_auditingPolicies_sqlServer_database_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: sqlServer_database
  name: 'Default'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_databases_auditingSettings_sqlServer_database_Default 'Microsoft.Sql/servers/databases/auditingSettings@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_sqlServer_database_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_sqlServer_database_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_sqlServer_database_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_sqlServer_database_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource sqlServer_database_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'Current'
  properties: {}
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_sqlServer_database_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_sqlServer_database_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_sqlServer_database_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2023-08-01-preview' = {
  parent: sqlServer_database
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
}

output resourceId string = sqlServer.id
