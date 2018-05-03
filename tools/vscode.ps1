[cmdletbinding(DefaultParameterSetName='Install')]
param(
    [Parameter(ParameterSetName='Install')]
    [switch]$InstallSyntax,

    [Parameter(ParameterSetName='Revert')]
    [switch]$RevertSyntax
)

$SyntaxPath = Join-Path $PSScriptRoot "..\syntaxes\powershell.tmLanguage.json"

if ($InstallSyntax) {
    if (-not(Test-Path $SyntaxPath)) {
        throw "No syntax to install. Please follow the build steps in the README.md"
    }

} elseif ($RevertSyntax) {

} else {
    throw "Please use either -InstallSyntax or -RevertSyntax"
}