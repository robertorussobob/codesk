$id = New-Guid
$date = Get-Date -Format "o"
$dirname = -join($date, "_", $id)
$dirname = $dirname.replace(":", ".")
$path = -join(".\codesk-", $dirname)
git clone https://github.com/robertorussobob/codesk.git $path
$sidecar = ".\sidecar"
if (Test-Path $sidecar) {
    copy .\sidecar\* $path
}
cd $path
.\create-vm.ps1
