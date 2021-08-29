
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
    instrumentationKey: appInsights.properties.InstrumentationKey
  }
}

module appServiceB './webapp.bicep' = {
  name: '${webSiteName}B'
  params: {
    appName: '${webSiteName}B'
    serverFarmId: appServicePlan.id
    instrumentationKey: appInsights.properties.InstrumentationKey
  }
}

var workspaceName = 'appInsightsSpikeWorkspace'

resource workspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
  properties: {
    sku: {
      name: 'Free'
    }
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'insightsSpike'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspace.id
  }
}


