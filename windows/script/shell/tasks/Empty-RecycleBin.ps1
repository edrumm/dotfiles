. "D:\dev\dotfiles\windows\script\shell\utils.ps1"
Write-Log "Run Empty-RecycleBin.ps1"

# error action to ignore known issue with PowerShell
Clear-RecycleBin -Confirm:$false -ErrorAction SilentlyContinue
Write-Log "Done"