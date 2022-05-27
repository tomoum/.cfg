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
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Reload User and System Environment Paths
sync-envpath

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Install & Upgrade All Apps" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green

$apps =
# Terminal Apps/Setup
"chocolatey",
"powershell-core",
"cascadia-code-nerd-font",
"oh-my-posh",
"bat",
"fzf"
"chocolateygui"
# Essentials
"git",
"gh",
"vscode",
"notepadplusplus",
"7zip",
"grammarly-for-windows",
"adobereader",
"greenshot",
"powertoys",
"ditto",
"docker-desktop",
"docker-cli",
"pyenv-win",
"teraterm",
# "drawio",
# Personal PC
"spotify",
"whatsapp",
"rpi-imager",
"logitechgaming", # Mouse
"nrfjprog",
"easytune6", # GPU
"zoom",
"zoom-outlook"

foreach ($app in $apps) {
    "Installing/Upgrading: [$app]"
    choco upgrade $app -y
}

sync-envpath

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Installation Complete" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green
