$Trigger = New-ScheduledTaskTrigger -At 10:00am -Daily # Specify the trigger settings
$User = "$env:UserName\Administrator" # Specify the account to run the script
$Action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "C:\PS\StartupScript.ps1" # Specify what program to run and with its parameters
Register-ScheduledTask -TaskName "MonitorGroupMembership" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest -Force # Specify the name of the task
