$sourcePath = '.\themes\theme-psise\theme.json'
$destinationPath = Join-Path -Path $env:USERPROFILE -ChildPath .vscode\extensions\ms-vscode.powershell-*\themes\theme-psise
Copy-Item -Path $sourcePath -Destination (Resolve-Path -Path $destinationPath) -Force
Write-Host 'Installed ISE Dev Theme'