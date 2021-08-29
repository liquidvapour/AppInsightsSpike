#!/bin/bash
cd ../src

echo "package app"
dotnet publish -o ./deploy

cd deploy
zip -r app.zip .
