# Description: Setup a new windows machine with all apps and configurations
# Author: Muhab Tomoum
# Date Created: 2022-05-23

###################
# PROFILE LOCATION
###################
$mt_ps_dir = $env:USERPROFILE
Write-Host Setting Powershell Profile Folder to $mt_ps_dir
New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' Personal -Value $mt_ps_dir -Type ExpandString -Force
$profile | Select-Object *


# Start the ssh agent service
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
