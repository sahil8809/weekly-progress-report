$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$pythonPath = Join-Path $projectRoot ".venv\Scripts\python.exe"
$backendEntry = Join-Path $projectRoot "backend\run.py"

if (-not (Test-Path $pythonPath)) {
    Write-Error "Python virtual environment not found. Expected: $pythonPath"
    exit 1
}

if (-not (Test-Path $backendEntry)) {
    Write-Error "Backend entry file not found. Expected: $backendEntry"
    exit 1
}

Push-Location $projectRoot
try {
    & $pythonPath $backendEntry
}
finally {
    Pop-Location
}
