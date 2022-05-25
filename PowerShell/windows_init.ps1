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

# Start the ssh agent service
Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Start SSH Agent Service" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Get-Service -Name ssh-agent | Set-Service -StartupType Manual


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
Write-Output "Setup Complete." -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
