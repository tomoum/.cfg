
# Choco upgrade all apps
$time_stamp = get-date -format yyyy_MM_dd_HH_mm_ss_ff
$LogFolder = "$PSScriptRoot\.chocolog"
$logFileName = "$time_stamp choco_upgrade.txt"
if (-not (Test-Path $LogFolder)) {
    New-Item $LogFolder -ItemType Directory
}

choco upgrade all > "$LogFolder\$logFileName"