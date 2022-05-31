
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" -Name "AutoRun" -Value "%USERPROFILE%\.cmd_profile.bat" -Type String;
