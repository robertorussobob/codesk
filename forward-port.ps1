param (
[Parameter(Mandatory=$true)][int]$port
)
write-output "About to forward $port VM port to $port host port"
$argument="$port" + ":" + "localhost:" + "$port"
vagrant ssh -- -L $argument

# Usage: .\forward-port.ps1 -port 8480

