
Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Setting Up PowerShell" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green

# Move Powershell profile location to user directory
$mt_ps_dir = $env:USERPROFILE
Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Setting Powershell Profile Folder to $mt_ps_dir" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value $mt_ps_dir -Type ExpandString -Force
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

# fuzzy finder
Write-Host "Install Fuzzy Finder" -ForegroundColor Green
Install-Module -Name PSFzf

# git auto completion
# Write-Host "Install posh-git" -ForegroundColor Green
# Install-Module -Name posh-git -Repository PSGallery -Force

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "PowerShell Setup Complete" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
