
Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Setting Up PowerShell" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green

# Move Powershell profile location to user directory
$my_powershell_profile_dir = $env:USERPROFILE
Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Setting Powershell Profile Folder to $my_powershell_profile_dir" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value $my_powershell_profile_dir -Type ExpandString -Force
$profile | Select-Object *

Set-PSRepository PSGallery

# Pretty terminal file/folder icons
Write-Host "Install Terminal-Icons" -ForegroundColor Green
Install-Module -Name Terminal-Icons -Repository PSGallery

# Install pre release for list view of predictions
Write-Host "Install PSReadLine" -ForegroundColor Green
Install-Module PSReadLine -AllowPrerelease -Force

# Directory quick shifting
Write-Host "Install zoxide" -ForegroundColor Green
Install-Module -Name z -Repository PSGallery -Force

# Fuzzy finder
Write-Host "Install Fuzzy Finder" -ForegroundColor Green
Install-Module -Name PSFzf

# Git auto completion
# Note: I commented this out because it slows down the shell load times
# significantly
# Write-Host "Install posh-git" -ForegroundColor Green
# Install-Module -Name posh-git -Repository PSGallery -Force

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Changing Registry" -ForegroundColor Green
Write-Output "Set Powershell font to CaskaydiaCove NF" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Console" -Name "FaceName" -Value "CaskaydiaCove NF" -Type String;

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "PowerShell Setup Complete" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
