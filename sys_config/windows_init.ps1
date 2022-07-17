# Description: This is my top level file for setting up a new windows machine
# Author: Muhab Tomoum
# Date Created: 2022-05-23

#   INSTRUCTIONS:
#   Please read the descriptions of each of the top level files
#   in the "INSTALLATION & CONFIGURATION" section below then
#   comment out the scripts you dont need. Then run this script.
#
#   For more information:
#   on what each script does open the individual files and read the
#   description at the top of the file.

# Self Elevate to Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
# Change the execution policy so you can run Poweshell Scripts from the command line
Set-ExecutionPolicy AllSigned -Scope CurrentUser

# #####################################
# INSTALLATION & CONFIGURATION
# #####################################
# I use choco for app managment and this is where most applications
# are installed and managed i.e updated regularly
.\choco_installs.ps1

# I use powershell-core as my defacto shell on windows and this scripts sets
# it up and installs application that are not available or buggy when installed
# using choco
.\ps_installs.ps1

# Depending if you use WSL you might want to comment this one out.
.\install_wsl.ps1

# This will powerup my command prompt for the ocassional time i need to use
# it to run legacy stuff
.\init_cmd.ps1

# This install security software you probably want to comment this out if you
# are running on a company machine in which case the system admins will take
# care of security
# .\install_security.ps1

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Download & Install Free version of Seer.exe" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
Invoke-WebRequest -Uri "https://sourceforge.net/settings/mirror_choices?projectname=ccseer&filename=Seer-0.8.1.exe&selected=cfhcable" -OutFile "$pwd/Seer-0.8.1.exe"
Invoke-Item "$PSScriptRoot\Seer-0.8.1.exe"

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Download & Install ticktick - task managment app" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
Invoke-WebRequest -Uri "https://ticktick.com/static/getApp/download?type=win64" -OutFile "$pwd/tick_win_setup_release_x64.exe"
Invoke-Item "$PSScriptRoot\tick_win_setup_release_x64.exe"

# #####################################
# MISC
# #####################################
Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Start SSH Agent Service" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
Get-Service -Name ssh-agent | Set-Service -StartupType Manual

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Hey dont forget to update your Poweshell-Core Help Manuals" -ForegroundColor Red
Write-Host "run: Update-Help" -ForegroundColor Red
Write-Host "-------------------------------" -ForegroundColor Green

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Setup Complete." -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
