planname="plan-appInsightsSpike"
webappname="app-appInsightsSpike"

rgname="rg-appInsightsSpike"

cd ../appA/src

echo "package app"
dotnet publish -o ../deploy

cd ../deploy
zip -r appA.zip .

echo "Deploying webapp"
az webapp deployment source config-zip \
    --resource-group $rgname \
    --name $webappname \
    --src appA.zip