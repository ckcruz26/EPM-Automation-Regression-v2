# Get the root directory (the parent directory of the script)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define the path to the virtual environment's Activate.ps1
$venvPath = Join-Path $scriptDir "venv\Scripts\Activate.ps1"

# Define the directories for reports and tests
$reportDir = Join-Path $scriptDir "report"
$testDir = Join-Path $scriptDir "test"

# Check if the activate.ps1 script exists
if (Test-Path $venvPath) {
    Write-Host "Activating virtual environment at: $venvPath"
    
    # Use dot sourcing to activate within the current session
    . $venvPath

    # Run Robot Framework tests with the output directory
    robot --outputdir $reportDir $testDir $args
} else {
    Write-Host "Virtual environment not found at: $venvPath"
    Write-Host "Please ensure your venv is created with: python -m venv venv"
}
