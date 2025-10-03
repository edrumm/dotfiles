if ($args.Count -ne 1) {
    throw "usage: Cat [path]"
}

Get-Content -Path $args[0]