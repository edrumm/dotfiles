. "D:\dev\dotfiles\windows\script\shell\utils.ps1"

$tasks = @(
    "Disable-Recall",
    "Empty-RecycleBin",
    "Run-Backup"
)
foreach ($task in $tasks) {
    try {
        Write-Log "tasks/$task.ps1"
       & "tasks/$task.ps1" 
       Write-Log "Done"
    } catch {
        # TODO
    }
}

"Done"
