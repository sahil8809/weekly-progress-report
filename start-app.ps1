$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$backendScript = Join-Path $projectRoot "start-backend.ps1"
$frontendScript = Join-Path $projectRoot "start-frontend.ps1"

if (-not (Test-Path $backendScript)) {
    Write-Error "Missing backend launcher: $backendScript"
    exit 1
}

if (-not (Test-Path $frontendScript)) {
    Write-Error "Missing frontend launcher: $frontendScript"
    exit 1
}

Start-Process powershell -ArgumentList "-NoExit", "-ExecutionPolicy", "Bypass", "-File", "`"$backendScript`""
Start-Process powershell -ArgumentList "-NoExit", "-ExecutionPolicy", "Bypass", "-File", "`"$frontendScript`""

Write-Host "Backend and frontend launchers started."
