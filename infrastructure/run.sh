#!/bin/bash
rgname="rg-appInsightsSpike01"
az group create --name $rgname --location "uksouth" &
az deployment group create --mode complete --resource-group $rgname --template-file ./main.bicep 