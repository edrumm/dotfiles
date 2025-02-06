Function Write-Log {
    Param ([string]$message)
    $logfile = "$env:USERPROFILE\Documents\scripts.log"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append -FilePath $logfile
}