
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

resource appServiceA 'Microsoft.Web/sites@2020-06-01' = {
  name: '${webSiteName}A'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
    
    siteConfig: {
    }
  }
}

resource appServiceB 'Microsoft.Web/sites@2020-06-01' = {
  name: '${webSiteName}B'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
    
    siteConfig: {
    }
  }
}
