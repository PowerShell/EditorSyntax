<#
    .Synopsis
        Convert the grammar file to json and/or run tests.

    .DESCRIPTION
        Build: Converts the .tmLanguage file to .json for use in VSCode or Atom.

        Test: Uses Atom and atom-grammar-test to run tests against specs and sample files to guard against regression.

    .EXAMPLE Build
        PS C:\EditorSyntax> .\build.ps1
        [Starting] Converting ../PowerShellSyntax.tmLanguage to json.
        ... Reading source file.
        ... Parsing content.
        ... Building contents.
        ... Creating directory: ./grammars
        [Finished] File written to: ../grammars/powershell.tmLanguage.json

    .EXAMPLE Test
        PS C:\EditorSyntax> .\build.ps1 Test
        Running specs...

        .....

        Finished in 0.281 seconds
        2 tests, 5 assertions, 0 failures, 0 skipped

    .NOTES
        This script is currently written for Windows. Someone with Mac OS X will need to add relevant paths.
#>
[cmdletbinding()]
param(
    [parameter()]
    [ValidateSet('Build','Test')]
    [string]
    $Task = 'Build'
)

# Load Helpers
. .\tools\build-helpers.ps1

if (-not(& npm -v)) {
    throw 'Requires Node.js - Could not find npm.'
}

switch ($Task) {
    'Build'   {
        try {
            & npm install
            & npm run build-grammar
        } catch {
            $PSCmdlet.ThrowTerminatingError($PSItem)
        }
    }
    'Test'    {
        if (Get-Command atom.cmd) {
            Write-Host "Atom already installed..."
            $script:ATOM_EXE_PATH = 'atom'
            RunSpecs
        } elseif (Test-Path '.\Atom') {
            $script:ATOM_EXE_PATH = Join-Path $pwd 'Atom\Atom.exe'
            RunSpecs
        } else {
            DownloadAtom
            RunSpecs
        }
    }
}