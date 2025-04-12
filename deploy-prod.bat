#!/bin/bash
echo "Deploying to PRODUCTION environment..."
cp -r ./build/* ./production/
echo "Production deploy complete."
