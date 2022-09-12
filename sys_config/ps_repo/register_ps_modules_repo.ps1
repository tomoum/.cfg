<#
.SYNOPSIS
add local powershell repository to registered trusted PSRepository and
upgrade Nuget.exe
#>

. $PSScriptRoot\common.ps1


Write-Host Updating NuGet Package -ForegroundColor Green
Invoke-WebRequest -Uri https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile "$env:LOCALAPPDATA\Microsoft\Windows\PowerShell\PowerShellGet\NuGet.exe"

Write-Host Adding Repo Path: "$LocalRepoPath" to trusted repositories -ForegroundColor Green
Register-PSRepository -Name "$LocalRepoName" `
    -SourceLocation "$LocalRepoPath" `
    -PublishLocation "$LocalRepoPath" `
    -InstallationPolicy 'Trusted'

Get-PSRepository