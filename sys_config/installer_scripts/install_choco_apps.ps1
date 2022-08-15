# Description: Installing https://chocolatey.org/ the app manager and
#              using it to install all my favourite windows apps
# Date Created: 2022-05-23
# Author: Muhab Tomoum

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
    Write-Host "Installing Chocolatey for Windows..." -ForegroundColor Green
    Write-Host "------------------------------------" -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Reload User and System Environment Paths
sync-envpath

Write-Host "choco AllowGlobalConfirmation so i dont have to confirm when installing apps" -ForegroundColor Yellow
choco feature enable -n=allowGlobalConfirmation

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Install & Upgrade All Apps" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green

$terminal_apps = @(
    "chocolatey"
    "microsoft-windows-terminal"
    "powershell-core"
    "cascadia-code-nerd-font"
    "oh-my-posh"
    "bat"
    "fzf"
)

$dev_essentials = @(
    "git"
    "gh"
    "vscode"
    "notepadplusplus"
    "7zip"
    "greenshot"
    "powertoys"
    "devtoys"
    "ditto"
    "docker-desktop"
    "docker-cli"
    "teraterm"
)

$work_apps = @(
    "wireshark"
)

$personal_apps = @(
    "obsidian" # my notetaking app
    "grammarly-for-windows"
    "adobereader"
    "whatsapp"
)

$home_pc = @(
    "virtualbox"
    "rpi-imager"
    "logitechgaming" # Mouse
    "easytune6" # GPU
    "zoom"
    "zoom-outlook"
)

$misc_apps = @(
    "drawio"
)

# #####################################################################################
# UPDATE THIS LIST AS PER YOUR PREFERENCES
# #####################################################################################
$app_list = @(
    $terminal_apps
    $dev_essentials
    $work_apps
    $personal_apps
    # $home_pc
    # $misc_apps
)

foreach ($list in $app_list) {
    foreach ($app in $list) {
        Write-Host "Installing app [$app]" -ForegroundColor Green
        choco upgrade $app -y
    }
}


function install_python() {
    choco install pyenv-win -y
    [System.Environment]::SetEnvironmentVariable('PYENV', $env:USERPROFILE + "\.pyenv\pyenv-win\", "User")

    [System.Environment]::SetEnvironmentVariable('PYENV_ROOT', $env:USERPROFILE + "\.pyenv\pyenv-win\", "User")

    [System.Environment]::SetEnvironmentVariable('PYENV_HOME', $env:USERPROFILE + "\.pyenv\pyenv-win\", "User")

    add-envpath -path "$env:USERPROFILE\.pyenv\pyenv-win\bin" -container "User"
    add-envpath -path "$env:USERPROFILE\.pyenv\pyenv-win\shims" -container "User"
    sync-envpath
}

# install_python

Write-Host "-------------------------------" -ForegroundColor Green
Write-Host "Installation Complete" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green