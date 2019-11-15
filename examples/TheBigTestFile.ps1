using namespace System.Management.Automation
#Requires -PSSnapin DiskSnapin -Version 1.2
#Requires -PSSnapin DiskSnapin
#Requires -Version 3
#Requires -Version 3.0
#Requires -Version 3 -RunAsAdministrator
#Requires -RunAsAdministrator
#Requires -Modules PSWorkflow
#Requires -Modules PSWorkflow -ThisIsInvalid
#Requires -Modules PSWorkflow, ActiveDirectory
#Requires -Modules PSWorkflow,ActiveDirectory
#Requires -ShellId MyLocalShell
#Requires -Modules PSWorkflow @{
    ModuleName="PSScheduledJob"
    ModuleVersion="1.0.0.0"
}

throw "Do not run this file!"

<#

	The big PowerShell syntax highlighting test file

#>

# Stop parsing
& tool.exe /arg1 'value' /arg2 $value --% /arg3 $value /arg4 "value" # Comment

# Automatic variables
$_
$args
$error
$home
$foreach

# Normal variables
$variable
$script:variable
$ENV:ComputerName
# This is not allowed
$ENV:
${variable}
${script:variable}
${#variableName}
${'variableName'}
${"$variableName"}
${variable name}
${script:this`{name`}is"valid"}

# Variable properties should be highlighted
$variable.Name
($variable).Name

# In double-quoted strings, only the variable should be highlighted, not the property
"This is my $variable.Name!"

# When used in a subexpression, both should be highlighted
"This is my $($variable.Name)!"

# $ENV:ComputerName should be highlighted
"This is the name of my computer: $ENV:ComputerName"

# Here as well
"This is the name of my computer: ${ENV:ComputerName}"

# This is still not allowed though
"This is the name of my computer $ENV: "

# This is an illegal variable name
$variable-name

# Hashtable
$properties = @{
	Name = 'Name'
	Something = $else
    Number = 16
    from = 'hello world'
    hash = @{
        hello = 'world'
    }
}

# Spatting
Invoke-Something @properties

# ScriptBlock
{Invoke-Something @properties}
{
	Invoke-Something @properties
}
$sb = {
	Invoke-Something @properties
}

# Arrays
$a1 = @(1,2,3,4)
$a2 = ('one','two','three','four')
$a3 = $one, $two, $three, $four
$a1[0]
$a2[-1]
$a3[1..2]
@(@($a))
@(($i = 10); (++$j))
@($i = 10)
$i[($y - 1) + $x]

# Single quoted strings
'This is a single quoted string.'
'$This is a single ''quoted'' string.'
'This is a
single quoted string.'
'This #also'
'$(Invoke-Something)'
'This "string" is nice.'

# Single quoted here-string
@'
$This is a ''single quoted''
$('Here-String')
Isn't it "nice"??
'@

# Double quoted strings
"This is a double quoted string."
"$This is a double ""quoted"" string."
"This is a
double quoted string."
"This #also"
"$(Invoke-Something)"
"This 'string' is nice."

# Double quoted here-string
@"
$This is a 'double quoted'
$('Here-String')
Isn't it "nice"??
"@

# Numeric constants
-3
.5
+.5
1.
1.d
1.lGB
1.e+12d
1e+12d
1.5
-1.5
-3 + -2
-3+-2
3++2
+2
-3+-
10/-10
10/-10D
-10.002L
$x..5.40D
-500..-495
$true..3
-2..$null
-3..3
1 .. 3kb
1..3
6,10,-3
0x476
+0x20
-0x20

# Types
[string]
[string[]]
[int32]
[System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.Management.Automation.ParameterMetadata,System.Management.Automation]]]
[System.Array+SZArrayEnumerator]
[int]::MinValue
[System.DateTime]::Parse('2016/09/21')

# Commands (functions)
Invoke-Something -foobar
Invoke-Something -foobar value
Invoke-Something -foobar:$true
Invoke-Something -foobar: $true
Invoke-Something -p1 v1 -p2 10 -p3 'value' -switch -verbose
Invoke-Something (1..20 | Invoke-Something) -p2 'value'
Invoke-Something -p1 v2 -p2 30 | Invoke-Something -switch
Invoke-Something -p1 {
	Invoke-Something -foobar:$true
} | Invoke-Something
Invoke-Something -p1 value `
	-p2 14.4 `
	-p3 $value | Invoke-Something -verbose

# Commands (Built-in variables)
ls *.ps1 -recurse

# Commands (executable files)
. .\scripts\myscript.ps1 -parameter 'value'
& tool.exe
something.cmd
øyvind.com # this should also highlight - TODO!

# But this should not highlight anything
file.1
This.txt
Function.txt
Where.txt
ForEach-Object.txt

# switch
switch ("fourteen") {}
switch -CaseSensitive ("fourteen") {}
switch -Illegal ("fourteen") {} # Using illegal switch parameter
switch -Regex ("fourteen") {}
switch -Wildcard ($a) {}
switch -regex -file .\somefile.txt {}
switch (3) {}
switch (4, 2) {}

switch -Regex -File $filePath {
    '.' {}
    default {}
}

switch -Wildcard -CaseSensitive ($something) {
    '.' {}
    default {}
}

switch ('this') {
    'this' {}
    default {}
}

# Illegal backtick
Invoke-Command -arg1 $val1 `
	           -arg2 $val2 `

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

function foo
#comment
{

}

# This one will not highlight the function name,
# because of the comments after 'function'. TODO?
function
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

# Note that the # in the path should highlight as a comment!
function Test-Drive([string]$roman) {
	$roman | c:\users\Me\Documents\Programming\F#\test.exe $roman
}

function Get-EscapedPath
{
    param(
    [Parameter(
        Position=0,
        Mandatory=$true
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)
    ]
    [string]$path
    )

    process {
        if ($path.Contains(' '))
        {
            return '"' + $path + '"'
        }
        return $path
    }
}

# Enum
enum test
{
    listItem1
    listItem2
    listItem3
}

# Illegal enum name
enum my-Enum {

}

# Class
class Vehicle {
    Vehicle() {}
    Vehicle([string]$Owner) {
        $this.Owner = $Owner
    }

    [int]$Mileage
    [int]$Age
    [string]$Owner

    [void]Drive([int]$NumberOfMiles) {
        $this.Mileage += $NumberOfMiles
    }
}

class Car: Vehicle {
    Car() {}

    Car([int]$Age) {
        $this.Age = $Age
    }

    Car([int]$Age, [string]$Owner) : base([string]$Owner) {
        $this.Age = $Age
        $this.Owner = $Owner
    }

    hidden [int]$Length
    static [int]$Width

    SetLength([int]$Length) {
        $this.Length = $Length
    }
}

# Illegal class name
class my-class {}

# Control words
foreach ($item in $collection) {
	try {
		if ($item -gt 100) {
			continue
		}
	}
	catch {
		break
	}
}

# Reserved words
Configuration Crazyness {
    Node Whatever {
    }
}
param ()

# Redirection
notepad.exe > log.txt
notepad.exe 1> log.txt
notepad.exe 2>&1
notepad.exe 3>&1
notepad.exe 4>&1
notepad.exe 5>&1
notepad.exe 6>&1
notepad.exe 2>&1> log.txt

# Note: 7 isn't a valid stream
notepad.exe 7>&1

# Operators
if (10 -cgt 100) { }
$a -is $b
$b -contains $c
$x -notcontains $c
$c -in $b
$c -notin $x
$a -match $b
$a -notmatch $b
$x -like $c
100 -and 0
$a -ceq 4 -and $a -ine $d -or
$c -is [Type]
$c -isnot [Type]
$c -as [Type]
$k = $y -bor $k
$x = $y -band $x
$z = -bnot $x
$k = $y -xor $b
$k = $y -bxor $b
$a -icontains $c
$a -ccontains $c
$a -iNotContains $c
$a -cNotContains $c
$a -cmatch $c
$x -iMatch $c
$x -iNotMatch $c
$a -iLike $b
$b -cLike $c
"hey" -cgt "Hey"
"Hey" -igt "hey"
"hey" -cge "Hey"
"Hey" -ige "hey"
"HEY" -clt "hey"
"HEY" -ilt "hey"
"HEY" -cle "hey"
"HEY" -ile "hey"

# this isn't a valid operator:
$x -foobar $y

# Negative: these are cmdlets with unapproved verbs
# we should not highlight keywords in them
Foo-Is
Foo-Not
Foo-Join
Foo-Bxor
Foo-f
Foo-eq
Foo-match

# format
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

# Help Directives (Comment based help)

    # Should also be able to use with line comments
    # .DESCRIPTION
    # .EXAMPLE sdkl
    #
    # .EXTERNALHELP some
    # .REMOTEHELPRUNSPACE some
    # .ExternalHelp some

    <#
        .DESCRIPTION
        This is a description.
        .REMOTEHELPRUNSPACE some
        .example
        .EXAMPLE
        Get-Power 3 4
        81

        .ExternalHelp C:\MyScripts\Update-Month-Help.xml

        .FORWARDHELPCATEGORY  Cmdlet

        .FORWARDHELPTARGETNAME Get-Help

        .INPUTS
        None.

        .LINK
        Online version: http://www.acmecorp.com/widget.html
        .LINK
        Set-ProcedureName

        .NOTES
        Something.

        .OUTPUTS
        None unless the -PassThru switch parameter is used.

        .PARAMETER ParameterName

        .SYNOPSIS
        Something.
    #>

# Misc test cases
@("any","array","has").foreach({ $_ })
@('any','array','has').foreach{ $_ }
@("any","array","has").where({ $_.Length -gt 3 })
@("any","array","has").where{ $_.Length -gt 3 }
foo "$(x).exe"
$file = join-path $env:SystemDrive "$([System.io.path]::GetRandomFileName()).ps1"
$ScriptBlock | Out-File $file -Force
workflow w1 {}
Workflow work {}
get-thing | Out-WithYou > $null # destroy
"Escaped chars: `", `n, `$, `b, `t, `""
'But here they''re not escape chars: `", `n, `$, `b, `"'
"When you call a method: $( get-number | %{ invoke-command $( [string]::format("Like (this{0})","what?") ) $var } )"
foo
$a = $("Guess what, happens ""here, hey""" | "Hm... $("this, is" strange.) you can't really pipe to a string, but nevermind for now.")
this-isnot.ps1
a_mistake.here.ps1
"anothermistake.ps1"
$users.Split(',').Trim()
TestConfiguration -OutputPath $workingDirectory
"blablabla $(invoke-foo baz $a.bar) blablabla"
invoke-foo baz $a.bar
var
-var
_var
jvar
varj
[ValidatePattern('^(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)')]
$foo.bar
($foo).bar
(Invoke-Something).bar
#comment
some#comment # we need a space before the # for it to become a comment
