$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$frontendRoot = Join-Path $projectRoot "frontend"
$nodePath = "C:\Users\mdsah\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
$nodeDir = Split-Path -Parent $nodePath
$npmCli = Join-Path $projectRoot ".tools\npm\bin\npm-cli.js"

if (-not (Test-Path $nodePath)) {
    Write-Error "Bundled Node.js runtime not found. Expected: $nodePath"
    exit 1
}

if (-not (Test-Path $npmCli)) {
    Write-Error "Local npm CLI not found. Expected: $npmCli"
    exit 1
}

if (-not (Test-Path $frontendRoot)) {
    Write-Error "Frontend folder not found. Expected: $frontendRoot"
    exit 1
}

Push-Location $frontendRoot
try {
    $env:PATH = "$nodeDir;$env:PATH"
    & $nodePath "..\.tools\npm\bin\npm-cli.js" run dev
}
finally {
    Pop-Location
}
