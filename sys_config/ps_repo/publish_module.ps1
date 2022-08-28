
<#
.SYNOPSIS
Package and publish modules to the v: drive repository
.DESCRIPTION
Package and publish modules to the v: drive repository
.PARAMETER optionalPackages
install optional software packages such as `adobereader`
.PARAMETER initGit
create the ssh keys for bitbucket access (requires user interaction)
.EXAMPLE
publish_module.ps1 ./SEL_EnvPaths
#>
[CmdletBinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string] $ModulePath
)

. $PSScriptRoot\common.ps1

Write-Host Publishing Module: $ModulePath -ForegroundColor Green
Write-Host To Repository: "$LocalRepoName" -ForegroundColor Green
Publish-Module -Path "$ModulePath" -Repository "$LocalRepoName"