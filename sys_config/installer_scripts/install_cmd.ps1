# Description: Installs clink to power up your command prompt exeperience with features
#              like command autocompletion and color highlighting
#              https://chrisant996.github.io/clink/
# Author: Muhab Tomoum
# Date Created: 2022-05-23

Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" -Name "AutoRun" -Value "%USERPROFILE%\.cmd_profile.bat" -Type String;

Write-Host "---------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "Download & Install CLINK for CMD.exe" -ForegroundColor Green
Write-Host "---------------------------------------------------------------------------" -ForegroundColor Green
Invoke-WebRequest -Uri "https://github.com/chrisant996/clink/releases/download/v1.3.17/clink.1.3.17.0a95d0_setup.exe" -OutFile "$PSScriptRoot/clink.1.3.17.0a95d0_setup.exe"
Invoke-Item "$PSScriptRoot\clink.1.3.17.0a95d0_setup.exe"

Write-Host "---------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "Download & Install CLINK for CMD.exe" -ForegroundColor Green
Write-Host "---------------------------------------------------------------------------" -ForegroundColor Green
Invoke-Item "$PSScriptRoot\init_clink.cmd"
