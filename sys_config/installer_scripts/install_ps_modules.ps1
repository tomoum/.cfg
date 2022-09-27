
Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Setting Up PowerShell" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green

# if not running an admin powershell 7 shell then open one
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") -or (!($PSVersionTable.PSEdition -eq "Core"))) {
    Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
    exit
}

Write-Host "Registry Changes:" -ForegroundColor Green
# Move Powershell profile location to user directory
$my_powershell_profile_dir = $env:USERPROFILE
Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Setting Powershell Profile Folder to $my_powershell_profile_dir" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value $my_powershell_profile_dir -Type ExpandString -Force
# Check changes
$profile | Select-Object *

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Set Powershell font to CaskaydiaCove NF" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Console" -Name "FaceName" -Value "CaskaydiaCove NF" -Type String;

Set-PSRepository PSGallery -InstallationPolicy Trusted

# Pretty terminal file/folder icons
Write-Host "Install Terminal-Icons" -ForegroundColor Green
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

# Install pre release for list view of predictions
Write-Host "Install PSReadLine" -ForegroundColor Green
Install-Module -Name PSReadLine -AllowPrerelease -Repository PSGallery -Force

# Directory quick shifting
Write-Host "Install zoxide" -ForegroundColor Green
Install-Module -Name z -Repository PSGallery -Force

# Fuzzy finder
Write-Host "Install Fuzzy Finder" -ForegroundColor Green
Install-Module -Name PSFzf -Repository PSGallery -Force
# Note: you also have to install with choco for the binary for some reason

Write-Host "Install Docker Autocomplete" -ForegroundColor Green
Install-Module -Name DockerCompletion -Repository PSGallery -Force

Update-Help -ErrorAction SilentlyContinue

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "PowerShell Setup Complete" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
