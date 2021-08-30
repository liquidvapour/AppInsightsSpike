webappname="app-appInsightsSpike01A"

rgname="rg-appInsightsSpike01"

echo "Deploying webapp"
az webapp deployment source config-zip \
    --resource-group $rgname \
    --name $webappname \
    --src ../deploy/appA.zip