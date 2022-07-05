# Description: These are the security related software i used on my machine.
# Author: Muhab
# Date Created: 2022-07-05


# NOTE THE ORDER HERE MATTERS
# sometimes bitdefender will run into problems with installation if you have
# comodo firewall installed already.

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Download & Install Free version of Bitdefender" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Invoke-WebRequest -Uri "https://download.bitdefender.com/windows/installer/en-us/bitdefender_avfree.exe" -OutFile "$pwd/bitdefender_avfree.exe"
.\bitdefender_avfree.exe

Write-Output "-------------------------------" -ForegroundColor Green
Write-Output "Download & Install Free version of Comodo Firewall" -ForegroundColor Green
Write-Output "-------------------------------" -ForegroundColor Green
Invoke-WebRequest -Uri "https://download.comodo.com/cis/download/installs/1000/partners/cmd_fw_installer_138430009_eb.exe?af=7639" -OutFile "$pwd/bitdefender_avfree.exe"
.\bitdefender_avfree.exe