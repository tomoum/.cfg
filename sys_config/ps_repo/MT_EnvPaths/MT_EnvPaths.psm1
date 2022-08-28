# Credits:
# https://gist.github.com/mkropat/c1226e0cc2ca941b23a9#file-envpaths-psm1

function sync-envpath {
    Write-Host "Reloading User and Machine Paths for this session" -ForegroundColor Green
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function add-envpath {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Path,

        [ValidateSet('Machine', 'User', 'Session')]
        [string] $Container = 'Session',

        [Parameter(Mandatory = $false)]
        [switch] $Prepend
    )

    Write-Host "Adding path: $Path to container: $Container" -ForegroundColor Yellow

    if ($Container -ne 'Session') {
        $containerMapping = @{
            Machine = [EnvironmentVariableTarget]::Machine
            User    = [EnvironmentVariableTarget]::User
        }
        $containerType = $containerMapping[$Container]

        $persistedPaths = [Environment]::GetEnvironmentVariable('Path', $containerType)
        if ($persistedPaths -split ';' -notcontains $Path) {
            if ($Prepend -eq $true) {
                $persistedPaths = $Path + ';' + $persistedPaths | Where-Object { $_ }
            }
            else {
                $persistedPaths = $persistedPaths + ';' + $Path | Where-Object { $_ }
            }
            [Environment]::SetEnvironmentVariable('Path', $persistedPaths, $containerType)
        }
    }

    sync-envpath
}

function remove-envpath {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Path,

        [ValidateSet('Machine', 'User', 'Session')]
        [string] $Container = 'Session'
    )

    Write-Host "Removing $Path from $Container Path" -ForegroundColor Yellow

    if ($Container -ne 'Session') {
        $containerMapping = @{
            Machine = [EnvironmentVariableTarget]::Machine
            User    = [EnvironmentVariableTarget]::User
        }
        $containerType = $containerMapping[$Container]

        $persistedPaths = [Environment]::GetEnvironmentVariable('Path', $containerType) -split ';'
        if ($persistedPaths -contains $Path) {
            $persistedPaths = $persistedPaths | Where-Object { $_ -and $_ -ne $Path }
            [Environment]::SetEnvironmentVariable('Path', $persistedPaths -join ';', $containerType)
        }
    }

    sync-envpath
}

function envpath {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Machine', 'User')]
        [string] $Container
    )

    $containerMapping = @{
        Machine = [EnvironmentVariableTarget]::Machine
        User    = [EnvironmentVariableTarget]::User
    }
    $containerType = $containerMapping[$Container]

    [Environment]::GetEnvironmentVariable('Path', $containerType) -split ';' |
    Where-Object { $_ }
}

Export-ModuleMember -Function *