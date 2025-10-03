if ($args.Count -ne 2) {
    throw "usage: Ln [source][target]"
}

mklink /D $args[0] $args[1]