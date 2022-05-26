# Description: My apps install with choco
# Author: Muhab Tomoum
# Date Created: 2022-05-23

Import-Module -Name MT_Util -DisableNameChecking
Import-Module -Name MT_EnvPaths -DisableNameChecking

# Self Elevate to Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

function Test-CommandExists {
    Param ($command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = "stop"
    try { if (Get-Command $command) { RETURN $true } }
    Catch { Write-Host "$command does not exist"; RETURN $false }
    Finally { $ErrorActionPreference = $oldPreference }
}

# Install chocolatey
if (Test-CommandExists ('choco')) {
    Write-Host "Choco is already installed, skip installation."
}
else {
    Write-Host "------------------------------------" -ForegroundColor Green
    Write-Host "Installing Chocolate for Windows..." -ForegroundColor Green
    Write-Host "------------------------------------" -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Reload User and System Environment Paths
sync-envpath

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Install & Upgrade All Apps" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green

$apps =
# Terminal Apps/Setup
"chocolatey",
"cascadia-code-nerd-font",
"oh-my-posh",
"git",
"gh",
"7zip",
"adobereader",
"powershell-core",
"pyenv-win",
"vscode",
"bat",
"fzf"

foreach ($app in $apps) {
    "Installing/Upgrading: [$app]"
    choco upgrade $app -y
}

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Installation Complete" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
