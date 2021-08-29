#!/bin/bash
planname="plan-appInsightsSpike"
webappname="app-appBInsightsSpike"

rgname="rg-appInsightsSpike"

cd ../src

echo "package app"
dotnet publish -o ./deploy

cd deploy
zip -r app.zip .

echo "Deploying webapp"
az webapp deployment source config-zip \
    --resource-group $rgname \
    --name $webappname \
    --src app.zip