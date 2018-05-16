# Testing PowerShell syntax highlighting rules.

## Strings ##

### Single quoted strings
'Single quoted string.'
'Single "quoted" string.'
'Single ''quoted'' string.'
'Single quoted #string.'
'Single $quoted string.'

### Double quoted strings
"Double quoted string."
"Double 'quoted' string."
"Double ""quoted"" string."
"Double `"quoted`" string."
"Double quoted #string."
"Double $quoted string."

### Single quoted here-string
@'
Single quoted here-string.
Single 'quoted' here-string.
Single "quoted" here-string.
Single quoted #here-string.
Single $quoted here-string.
'@

### Double quoted here-string
@"
Double quoted here-string.
Double "quoted" here-string.
Double 'quoted' here-string.
Double quoted #here-string.
Double $quoted here-string.
"@

### Complex strings
'^(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)'

# This one currently fails. It's the exact same string as the one above. Uncomment to check.
#[ValidatePattern('^(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)')]

# Stop Parsing
# Synatx highlighting should stop after --%, with the exception of the comment.
command.exe -parameter 1 --% -parameter 2 /switch /par1:value # comment

# Variables
$name = 'value'
"variable in a $string"
"variable in a $($subExpression)"
$global:name = 'value'
$script:name = 'value'
$local:name = 'value'
$private:name = 'value'
$using:name = 'value'
${name} = 'value'
${variable-name} = 'value'
${#name} = 'value'
${123} = 'value'
${'name'} = 'value'
${variable name} = 'value'
${global: variable name} = 'value'
${script:this`{value`}is} = 'valid' # don't currently work correctly
$_ = $null
$123 = 'value'
$variable_name = 'value'
$variable-name = 'value' # - in variable name is not allowed
$$

# Syntax highlighting not consistent in these cases!
$foo.bar
($foo).bar
(Invoke-Something).bar

# Sub Expression
# Syntax highlighting not consistent in these two cases!
"blablabla $(invoke-foo baz $a.bar) blablabla"
invoke-foo baz $a.bar

# Arrays
@('One', 2, $three)
('One', 2, $three)
$p = @(Get-Process Notepad)
$a[0]
$a[-3..-1]
$a[0,2+4..6]
,(1,2,3)
,$a
$t = $a[0,1 + 3..($a.length - 1)]

# Hash Table
@{
    Key = 'Value'
    Key = 123
    Key = $value
}

$ht = @{
    Key = 'Value'
    Key = 123
    Key = $value
}

$hash = [ordered]@{ Number = 1; Shape = "Square"; Color = "Blue"}

# Splatting
Invoke-Something @parameters

# Script Block
{
    'String'
    Invoke-Something -p1 'value' -p2 $value
}

$sb = {
    'String'
    Invoke-Something -p1 'value' -p2 $value
}

# Types and .NET classes
[string]$var = 'string'
[system.string]$var = 'string'
[int]$var = 100
[uint64]$var = 100
[System.String]::Empty
[System.DateTime]::Parse('2016/09/21')
[int32[]]$ia = 1500,2230,3350,4000

# Numeric constants
1
9,9
9.9
10gb
2/5kb

# Numeric formatting
# {index[,alignment][:formatString]}
$a = 348
"{0:N2}" -f $a
"{0:D8}" -f $a
"{0:C2}" -f $a
"{0:P0}" -f $a
"{0:X0}" -f $a
(1.11).tostring("#.#")
"{1,10} {0,10} {2,10:x}" -f "First", "Second", 255
("{0,6}" -f 4.99), ("{0,6:##.00}" -f 15.9)
"{0:R}" -f (1mb/2.0)
"{0:00.0}" -f 4.12341234
"{0:##.#}" -f 4.12341234
"{0:#,#.#}" -f 1234.121234
"{0:##,,.000}" -f 1048576
"{this is not a #comment}"
"{0:##.#E000}" -f 2.71828
"{0:#.00'##'}" -f 2.71828
"{0:POS;NEG;ZERO}" -f -14
"{0:$## Please}" -f 14
"{0,-8:P1}" -f 1.75
"{0,10:N3}{1,10:N3}{2,10:N3}{3,10:N3}" -f 0.2, 0.3, 0.45, 0.91
'{0:00000.000}' -f 7.125

# Operators
$i = 0
$i++
$i += 10
$a -band $b
$x -gt $y
$string -not $null
$int -as [double]
if (! $variable) {}
if (-not $variable) {}
$a -band $b
$a -shr $b
$a -eq $b
$a -le $b
$a -less $b # -less is not a valid operator and shouldn't be tagged and highlighted as such.

# Parameters
Write-Host -Message 'This is a message'
Write-Host 'This is a message'
Write-Host something something
Get-WmiObject -Class Win32_OperatingSystem -ComputerName localhost | Select-Object -Property CSName,LastBootupTime

# Functions and filters
functioN MyFunction{}
function My-Function         {}
Function My.Function{}
function My-Function.Other{}
function Some.other.function{}
FUNCTION MyFunction2 {}
function MyFunction3
{

}
function New-File { }
function New-File ($Name) { }
function NewFile($Name) { }
functionMyFunction{}
filter myfilter($param) {}
Filter my-Filter ($param){}
function global:Invoke-Something {}

# This variant don't work properly
function
#comment
<# another comment #>
test
(
    [string]
    <# another comment #>
    [parameter(mandatory)]
    $s
)
{
    "test $s"
}

# Enum
enum myEnum
{
    listItem1
    listItem2
    listItem3
}

# - in enum name is not allowed
enum my-Enum {
    listItem1
    listItem2
    listItem3
}

# Class
class myClass {}

# - in class name is not allowed
class my-Class {}

# DSC
configuration myConfiguration {
	node web01, web02, web03 {

	}
}

# Switch
# switch [-regex|-wildcard|-exact][-casesensitive] (<value>)
# switch [-regex|-wildcard|-exact][-casesensitive] -file filename
switch ($variable)
{
    'Value' {
        return $false
    }

    2 {}

    {$value -le 100} {}

    default {
        return $true
    }
}

switch ("fourteen") {}
switch -CaseSensitive ("fourteen") {}
switch -Illegal ("fourteen") {}
switch -Regex ("fourteen") {}
switch -Wildcard ($a) {}
switch -regex -file .\somefile.txt {}
switch (3) {}
switch (4, 2) {}

# Executable files
. .\otherScript.ps1
& cmd.exe
c:\windows\system32\command.com
c:\file.txt
file.txt
command.cmd
co.cmd
a.bat
aa.bat
aaa.bat
aaaa.bat
øyvind.ps1
my file.exe

# Comment based help and keywords
# .ExternalHelp  psake.psm1-help.xml
#Requires -Version 2.0     # <-- should #Requires statements be highlighted differently?

<#
	.PARAMETER
	Something
	.SYNOPSISIS
	Something
	.SYNOPSIS
	.INPUTS
#>

# Methods
# Only the first method name is highlighted correctly.
$users.Split(',').Trim()

# Redirection
# Examples from https://technet.microsoft.com/en-us/library/hh847746.aspx
Get-Process > Process.txt
dir *.ps1 >> Scripts.txt
Get-Process none 2> Errors.txt
Get-Process none 2>> Save-Errors.txt
Get-Process none, Powershell 2>&1
Write-Warning "Test!" 3> Warnings.txt
Write-Warning "Test!" 3>> Save-Warnings.txt
Test-Warning 3>&1
Import-Module * -Verbose 4> Verbose.txt
Import-Module * -Verbose 4>> Save-Verbose.txt
Import-Module * -Verbose 4>&1
Write-Debug "Starting" 5> Debug.txt
Write-Debug "Saving" 5>> Save-Debug.txt
Test-Debug 5>&1
Test-Output *> Test-Output.txt
Test-Output *>> Test-Output.txt
Test-Output *>&1

# Special characters
# Should these be highlighted differently?
"`0"
for ($i = 0; $i -le 1; $i++){"`a"}
"backup`b`b out"
"There are two line breaks`n`nhere."
Write-Host "Let's not move`rDelete everything before this point."
"Column1`t`tColumn2`t`tColumn3"

# Range
Get-ChildItem c:\techdocs\[a-l]*.txt

# Other - strange cases
[string]
[string('string')]
[string("string")]
[string(Something = $true)]
[Parameter(Something = $true)]
string('string')
'string'
