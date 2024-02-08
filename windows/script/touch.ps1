$file = $args[0]
if ($file -eq $null) {
	echo "Usage: Touch <filepath>"
} else {
	if (Test-Path $file) {
		(Get-ChildItem $file).LastWriteTime = Get-Date
	} else {
		New-Item $file
	}
}