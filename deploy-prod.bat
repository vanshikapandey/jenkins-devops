@echo off
echo Deploying to PRODUCTION environment...
xcopy /E /Y .\build\* .\production\
echo Production deploy complete.
