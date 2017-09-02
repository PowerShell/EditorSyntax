$grammarPathx64 = 'C:\Program Files\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage'
$grammarPathx64Backup = 'C:\Program Files\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage.old'
$grammarPathx86 = 'C:\Program Files (x86)\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage'
$grammarPathx86Backup = 'C:\Program Files (x86)\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage.old'
$grammarPath = Resolve-Path -Path '.\grammars\PowerShellSyntax.tmLanguage'
function Test-IsAdmin {
    $windowsIdentity=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $windowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($windowsIdentity)
    $adm=[System.Security.Principal.WindowsBuiltInRole]::Administrator
    Write-Output ($windowsPrincipal.IsInRole($adm))
}

if (Test-IsAdmin) {
    function Set-GrammarFile ($new,$original,$backup) {
        if (Test-Path -Path $backup) {
            Remove-Item -Path $backup -Force
        }
        Copy-Item -Path $original -Destination $backup -Force
        Copy-Item -Path $new -Destination $original -Force
    }

    if (Test-Path -Path $grammarPathx64) {
        Set-GrammarFile $grammarPath $grammarPathx64 $grammarPathx64Backup
        Write-Host 'New grammar file set! Please reload vscode'
    }

    elseif (Test-Path -Path $grammarPathx86) {
        Set-GrammarFile $grammarPath $grammarPathx86 $grammarPathx86Backup
        Write-Host 'New grammar file set! Please reload vscode'
    }

    else {
        Write-Warning 'PowershellSyntax.tmLanguage not found!'
    }
}
else {
    Write-Warning 'PowerShell needs to run elevated (Run as Administrator) for this script to work!'
}


