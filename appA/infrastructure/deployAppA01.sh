planname="plan-appInsightsSpike01"
webappname="app-appInsightsSpike01B"

rgname="rg-appInsightsSpike01"

cd ../deploy

echo "Deploying webapp"
az webapp deployment source config-zip \
    --resource-group $rgname \
    --name $webappname \
    --src appA.zip