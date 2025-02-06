$file = $args[0]
if ($null -eq $file) {
    throw "usage: Touch [filepath]"
}

if (Test-Path $file) {
    (Get-ChildItem $file).LastWriteTime = Get-Date
} else {
    New-Item $file
}