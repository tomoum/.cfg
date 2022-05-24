# Description: My apps install with choco
# Author: Muhab Tomoum
# Date Created: 2022-05-23

# Self Elevate to Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$apps =
"gh",
"7zip",
"oh-my-posh",
"adobereader",
"cascadia-code-nerd-font",
"git"

foreach ($app in $apps) {
    "Installing: [$app]"
    choco install $app -y
}

Write-Output "Now Please replace the windows terminal json file with the one in this directory"
