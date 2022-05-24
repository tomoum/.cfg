# Description: My apps install with choco
# Author: Muhab Tomoum
# Date Created: 2022-05-23

# Self Elevate to Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$apps =
"cascadia-code-nerd-font",
"oh-my-posh",
"git"
"gh",
"7zip",
"adobereader",
"powershell-core"

foreach ($app in $apps) {
    "Installing: [$app]"
    choco upgrade $app -y
}

Write-Output -------------------------------
Write-Output "Installation Complete"
Write-Output -------------------------------
