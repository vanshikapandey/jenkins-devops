#!/bin/bash
echo "Deploying to STAGING environment..."
cp -r ./build/* ./staging/
echo "Staging deploy complete."