#!/bin/bash

gitrepo=https://github.com/liquidvapour/AppInsightsSpike.git
source ~/secrets/pub.token
webappname="app-appInsightsSpike"

rgname="rg-appInsightsSpike"

echo "Create a resource group."
az group create --location westeurope --name $rgname

echo "Create an App Service plan in 'FREE' tier."
az appservice plan create --name $webappname --resource-group $rgname --sku FREE

echo "Create a web app."
az webapp create --name $webappname --resource-group $rgname --plan $webappname

echo "Configure continuous deployment from GitHub."
# --git-token parameter is required only once per Azure account (Azure remembers token).
az webapp deployment source config --name $webappname --resource-group $rgname \
--repo-url $gitrepo --branch master --git-token $token

# Copy the result of the following command into a browser to see the web app.
echo http://$webappname.azurewebsites.net