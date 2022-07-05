# Description: Installs clink to power up your command prompt exeperience with features
#              like command autocompletion and color highlighting
#              https://chrisant996.github.io/clink/
# Author: Muhab Tomoum
# Date Created: 2022-05-23

Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" -Name "AutoRun" -Value "%USERPROFILE%\.cmd_profile.bat" -Type String;

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Download & Install CLINk for CMD.exe" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Invoke-WebRequest -Uri "https://github.com/chrisant996/clink/releases/download/v1.3.17/clink.1.3.17.0a95d0_setup.exe" -OutFile "$pwd/clink.1.3.17.0a95d0_setup.exe"
.\clink.1.3.17.0a95d0_setup.exe
