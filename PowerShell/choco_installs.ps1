# Description: My apps install with choco
# Author: Muhab Tomoum
# Date Created: 2022-05-23

# Self Elevate to Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Github CLI
# choco install gh

$apps = [string]("gh", "7zip")
ForEach ($app in $apps) {
    Write-Output "Installing $app"
}