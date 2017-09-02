$sourcePath = '.\themes\theme-psise\theme.json'
$destinationPath = Join-Path -Path $env:USERPROFILE -ChildPath '.vscode\extensions\ms-vscode.powershell-1.4.1\themes\theme-psise'
Copy-Item -Path $sourcePath -Destination $destinationPath -Force
Write-Host 'Installed ISE Dev Theme'