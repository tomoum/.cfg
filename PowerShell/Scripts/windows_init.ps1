# Description: Setup a new windows machine with all apps and configurations
# Author: Muhab Tomoum
# Date Created: 2022-05-23


# Self Elevate to Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# #####################################
# INSTALLATIONS
# #####################################
.\ps_installs.ps1
.\choco_installs.ps1

# #####################################
# MISC
# #####################################

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Start SSH Agent Service" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Get-Service -Name ssh-agent | Set-Service -StartupType Manual

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "WSL Installs" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --install Ubuntu-20.04
wsl --update

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Changing Registry" -ForegroundColor Green
Write-Output "Set Powershell font to CaskaydiaCove NF" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Console" -Name "FaceName" -Value "CaskaydiaCove NF" -Type String;

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Update Help" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Update-Help

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Download CLINk for CMD.exe" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Invoke-WebRequest -Uri "https://github.com/chrisant996/clink/releases/download/v1.3.17/clink.1.3.17.0a95d0_setup.exe" -OutFile "$pwd/clink.1.3.17.0a95d0_setup.exe"

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Setup Complete." -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
