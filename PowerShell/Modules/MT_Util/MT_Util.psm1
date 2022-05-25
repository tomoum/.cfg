# Description: Utility Functions
# Author: Muhab Tomoum
# Date Created: 2022-05-23


function which ($command) {
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

function xargs {
    param (
        [Parameter( Position = 0, Mandatory = $true, HelpMessage = 'commmand to be executed')]
        $command,

        [Parameter(ValueFromPipeline)]
        $val_from_pipeline
    )
    Write-Host "[$command] -> Args: [$val_from_pipeline] "
    , @($Extra) | ForEach-Object { &"$command" $_ }
}

Export-ModuleMember -Function *
