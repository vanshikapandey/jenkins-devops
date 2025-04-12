@echo off
echo Deploying to STAGING environment...
xcopy /E /Y .\build\* .\staging\
echo Staging deploy complete.
