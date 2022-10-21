$id = New-Guid
$date = Get-Date -Format "o"
$dirname = -join($date, "_", $id)
$dirname = $dirname.replace(":", ".")
$path = -join(".\codesk-", $dirname)
git clone https://github.com/robertorussobob/codesk.git $path
copy .\sidecar\* $path
cd $path
.\up
