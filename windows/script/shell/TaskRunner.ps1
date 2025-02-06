. "D:\dev\dotfiles\windows\script\shell\utils.ps1"

$tasks = @(
    "Disable-Recall",
    "Empty-RecycleBin"
)
foreach ($task in $tasks) {
    try {
       & "tasks/$task.ps1" 
    } catch {
        # TODO
    }
}

"Done"
