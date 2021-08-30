#!/bin/bash
webappname="app-appBInsightsSpike"

rgname="rg-appInsightsSpike"

cd deploy

echo "Deploying webapp"
az webapp deployment source config-zip \
    --resource-group $rgname \
    --name $webappname \
    --src app.zip