targetScope = 'resourceGroup'

@description('Name of the Key Vault that grants secret read access.')
param keyVaultName string

@description('Principal ID to assign the Key Vault Secrets User role to.')
param principalId string

@description('Deterministic GUID string used as the role assignment resource name.')
param roleAssignmentGuid string

var keyVaultSecretsUserRoleDefinitionId = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')

resource platformKeyVault 'Microsoft.KeyVault/vaults@2024-11-01' existing = {
  name: keyVaultName
}

resource keyVaultSecretsUserAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: roleAssignmentGuid
  scope: platformKeyVault
  properties: {
    roleDefinitionId: keyVaultSecretsUserRoleDefinitionId
    principalId: principalId
    principalType: 'ServicePrincipal'
  }
}
