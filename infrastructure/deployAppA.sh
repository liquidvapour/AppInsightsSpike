cd ../appA/src

planname="plan-appInsightsSpike"
webappname="app-appInsightsSpike"

rgname="rg-appInsightsSpike"

echo "Deploying webapp"
az webapp up -n $webappname