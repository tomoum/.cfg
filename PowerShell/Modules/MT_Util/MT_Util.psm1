# Description: Utility Functions
# Author: Muhab Tomoum
# Date Created: 2022-05-23


Function which ($command) {
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = "stop"
    try {
        Get-Command -Name $command |
        Select-Object -ExpandProperty Path
    }
    Catch {
        Write-Host "[$command] does not exist";
    }
    Finally { $ErrorActionPreference = $oldPreference }
}



