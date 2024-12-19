param sqlServerName string
param databaseName string
param location string = resourceGroup().location

resource database 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  name: '${sqlServerName}/${databaseName}'
  location: location
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

resource database_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2023-08-01-preview' = {
  parent: database
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource database_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: database
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource database_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: database
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource database_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: database
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource database_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: database
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource database_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: database
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_databases_auditingPolicies_database_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: database
  name: 'Default'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_databases_auditingSettings_database_Default 'Microsoft.Sql/servers/databases/auditingSettings@2023-08-01-preview' = {
  parent: database
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_database_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2023-08-01-preview' = {
  parent: database
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_database_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2023-08-01-preview' = {
  parent: database
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_database_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2023-08-01-preview' = {
  parent: database
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_database_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2023-08-01-preview' = {
  parent: database
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource database_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2023-08-01-preview' = {
  parent: database
  name: 'Current'
  properties: {}
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_database_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2023-08-01-preview' = {
  parent: database
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

resource Microsoft_Sql_servers_databases_transparentDataEncryption_database_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2023-08-01-preview' = {
  parent: database
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_database_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2023-08-01-preview' = {
  parent: database
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
}
