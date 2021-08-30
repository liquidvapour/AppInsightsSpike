var workspaceName = 'appInsightsSpikeWorkspace'

resource workspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: workspaceName
  location: resourceGroup().location
  properties: {
    sku: {
      name: 'Free'
    }
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'insightsSpike'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspace.id
  }
}

output instrumentationKey string = appInsights.properties.InstrumentationKey
