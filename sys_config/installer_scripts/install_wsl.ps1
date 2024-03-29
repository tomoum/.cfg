# Description: This is windows subsystem for linux installation and configuration.
#              https://docs.microsoft.com/en-us/windows/wsl/install
# Author: Muhab Tomoum
# Date Created: 2022-05-23


Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "WSL Installs" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --install Ubuntu-20.04
wsl --update