# Description: Setup a new windows machine with all apps and configurations
# Author: Muhab Tomoum
# Date Created: 2022-05-23

# Self Elevate to Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Move Powershell profile location to user directory
$mt_ps_dir = $env:USERPROFILE
Write-Host "Setting Powershell Profile Folder to $mt_ps_dir"
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value $mt_ps_dir -Type ExpandString -Force
$profile | Select-Object *

# Start the ssh agent service
Get-Service -Name ssh-agent | Set-Service -StartupType Manual

# Install chocolatey
Write-Host "Install Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Referesh Environment Variables
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
choco upgrade chocolatey
# Install CaskaydiaCove Font
choco upgrade powershell-core

# Install Pretty icons
Install-Module -Name Terminal-Icons -Repository PSGallery

# Install pre release for list view of predictions
Install-Module PSReadLine -AllowPrerelease -Force

# Set CaskaydiaCove NF for default powershell window
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Console" -Name "FaceName" -Value "CaskaydiaCove NF" -Type String;

Update-Help



# Archive
# Install Fonts
# $FontFolder = ".\FontsFolder"
# $FontItem = Get-Item -Path $FontFolder
# $FontList = Get-ChildItem -Path "$FontItem\*" -Include ('*.fon', '*.otf', '*.ttc', '*.ttf')

# foreach ($Font in $FontList) {
#     Write-Host 'Installing font -' $Font.BaseName
#     Copy-Item $Font "C:\Windows\Fonts"
#     New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name
# }
