. "D:\dev\dotfiles\windows\script\shell\utils.ps1"
Write-Log "Run Disable-Recall.ps1"

$recallPath = "C:\Windows\System32\Recall.exe"
if (Test-Path $recallPath) {
    $service = Get-Service -Name "Recall" -ErrorAction SilentlyContinue

    if ($service -and $service.Status -eq "Running") {
        Stop-Service -Name "Recall" -Force
        Write-Log "Recall service stopped"
    }

    Set-Service -Name "Recall" -StartupType Disabled
    Write-Log "Recall service StartupType disabled"
    
} else {
    Write-Log "Recall service not found"
}

Write-Log "Done"
