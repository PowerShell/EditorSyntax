$grammarPathx64 = 'C:\Program Files\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage'
$grammarPathx64Backup = 'C:\Program Files\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage.old'
$grammarPathx86 = 'C:\Program Files (x86)\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage'
$grammarPathx86Backup = 'C:\Program Files (x86)\Microsoft VS Code\resources\app\extensions\powershell\syntaxes\PowershellSyntax.tmLanguage.old'

function Test-IsAdmin {
    $windowsIdentity=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $windowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($windowsIdentity)
    $adm=[System.Security.Principal.WindowsBuiltInRole]::Administrator
    Write-Output ($windowsPrincipal.IsInRole($adm))
}

if (Test-IsAdmin) {
    function Set-GrammarFile ($newFile,$oldFile) {
        if (Test-Path -Path $oldFile) {
            Remove-Item -Path $newFile -Force
            Copy-Item -Path $oldFile -Destination $newFile -Force
            Remove-Item -Path $oldFile -Force
        }
        else {
            Write-Warning 'No backup found of the grammar file!'
            break
        }
    }

    if (Test-Path -Path $grammarPathx64) {
        Set-GrammarFile $grammarPathx64 $grammarPathx64Backup
        Write-Host 'Original grammar file restored! Please reload vscode'
    }

    elseif (Test-Path -Path $grammarPathx86) {
        Set-GrammarFile $grammarPathx86 $grammarPathx86Backup
        Write-Host 'Original grammar file restored!  Please reload vscode'
    }

    else {
        Write-Warning 'PowershellSyntax.tmLanguage not found!'
    }
}
else {
    Write-Warning 'PowerShell needs to run elevated (Run as Administrator) for this script to work!'
}

