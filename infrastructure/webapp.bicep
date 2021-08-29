@minLength(3)
@maxLength(24)
param appName  string
param serverFarmId string

@minLength(1)
param instrumentationKey string


resource appServiceA 'Microsoft.Web/sites@2020-06-01' = {
  name: appName
  location: resourceGroup().location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: serverFarmId
    
    siteConfig: {
      appSettings:[
        {
          name: 'ApplicationInsights__InstrumentationKey'
          value: instrumentationKey
        }
      ]
    }
  }
}
