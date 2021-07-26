cd ../appA/src

planname="plan-appInsightsSpike"
webappname="app-appBInsightsSpike"

rgname="rg-appInsightsSpike"

echo "Create an App Service plan in 'FREE' tier."
az appservice plan create --name $planname --resource-group $rgname --sku FREE

az webapp create \
    -n $webappname \
    -g $rgname \
    -p $planname \
    --runtime "DOTNET|5.0" \
    --deployment-local-git

az webapp config appsettings set \
    --resource-group $rgname \
    --name $webappname \
    --settings WEBSITE_RUN_FROM_PACKAGE="1"