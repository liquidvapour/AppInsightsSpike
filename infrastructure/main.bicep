
param location string= resourceGroup().location
var appName = 'appInsightsSpike01'
var appServicePlanName = 'plan-${appName}'
var webSiteName = 'app-${appName}'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'B1'
    capacity: 1
  }
  properties: {
  }
  kind: 'linux'
}

module appServiceA './webapp.bicep' = {
  name: '${webSiteName}A'
  params: {
    appName: '${webSiteName}A'
    serverFarmId: appServicePlan.id
    instrumentationKey: appInsights.outputs.instrumentationKey
  }
}

module appServiceB './webapp.bicep' = {
  name: '${webSiteName}B'
  params: {
    appName: '${webSiteName}B'
    serverFarmId: appServicePlan.id
    instrumentationKey: appInsights.outputs.instrumentationKey
  }
}

module appInsights './appInsights.bicep' = {
  name: 'appInsights'
}
