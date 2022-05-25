
Write-Output "-------------------------------" -ForegroundColor Green
Write-Host "Setting Up PowerShell" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green

# Move Powershell profile location to user directory
$mt_ps_dir = $env:USERPROFILE
Write-Output "-------------------------------" -ForegroundColor Green
Write-Host "Setting Powershell Profile Folder to $mt_ps_dir" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value $mt_ps_dir -Type ExpandString -Force
$profile | Select-Object *

Write-Output "Install Terminal-Icons" -ForegroundColor Green
Install-Module -Name Terminal-Icons -Repository PSGallery

# Install pre release for list view of predictions
Write-Output "Install PSReadLine" -ForegroundColor Green
Install-Module PSReadLine -AllowPrerelease -Force

# Directory quick shifting
Write-Output "Install PSReadLine" -ForegroundColor Green
Install-Module -Name z -Force

Write-Output "-------------------------------" -ForegroundColor Green
Write-Host "PowerShell Setup Complete" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
