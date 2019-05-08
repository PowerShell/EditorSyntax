<#
    .Synopsis
        Convert the grammar file to json and/or run tests.

    .DESCRIPTION
        Build: Converts the .tmLanguage file to .json for use in VSCode or Atom.

        Test: Uses Atom and atom-grammar-test to run tests against specs and sample files to guard against regression.

    .EXAMPLE
        PS C:\EditorSyntax> .\build.ps1
        [Starting] Converting ../PowerShellSyntax.tmLanguage to json.
        ... Reading source file.
        ... Parsing content.
        ... Building contents.
        ... Creating directory: ./grammars
        [Finished] File written to: ../grammars/powershell.tmLanguage.json

    .EXAMPLE
        PS C:\EditorSyntax> .\build.ps1 Test
        Running specs...

        .....

        Finished in 0.281 seconds
        2 tests, 5 assertions, 0 failures, 0 skipped
#>
param(
    [switch]
    $Test
)

# Load Helpers
. .\tools\build-helpers.ps1
. .\tools\banners.ps1

SyntaxBanner

if (-not (npm -v)) {
    throw 'Requires Node.js - Could not find npm.'
}

npm install

# helper tasks
function RunBuild() {
    BuildBanner
    try {
        Write-Host "Building grammar file(s)..."
        npm run build-grammar
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($PSItem)
    }
}

function RunTests() {
    $script:ATOM_EXE_PATH = (Get-Command atom).Path
    if (-not $script:ATOM_EXE_PATH) {
        throw "Atom not found. Install it from https://atom.io/"
    }
}

RunBuild

if ($Test) {
    RunTests
    TestBanner
    RunSpecs
}

EndBanner
