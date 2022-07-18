

# Choco autoupdater
$Trigger = New-ScheduledTaskTrigger -At 8:00am -Daily # Specify the trigger settings
$User = "NT AUTHORITY\SYSTEM" # Specify the account to run the script
$Action = New-ScheduledTaskAction -Execute "pwsh" -Argument "$Home\sys_config\scheduled_scripts\choco_update.ps1
" # Specify what program to run and with its parameters
Register-ScheduledTask -TaskName "my_choco_upgrade" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest -Force -Description "upgrade all my choco apps to the latest version"
