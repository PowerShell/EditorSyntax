# SYNTAX TEST "source.powershell"
using namespace System.Management.Automation
# <- keyword.control.using.powershell
#     ^ keyword.other.powershell
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter.powershell
#Requires -PSSnapin DiskSnapin -Version 1.2
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                   ^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#                              ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                                       ^^^ meta.requires.powershell variable.parameter.powershell
#Requires -PSSnapin DiskSnapin
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                   ^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#Requires -Version 3
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^ meta.requires.powershell variable.parameter.powershell
#Requires -Version 3.0
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^^^ meta.requires.powershell variable.parameter.powershell
#Requires -Version 3 -RunAsAdministrator
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^ meta.requires.powershell variable.parameter.powershell
#                    ^^^^^^^^^^^^^^^^^^^ meta.requires.powershell keyword.other.powershell
#Requires -RunAsAdministrator
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^^^^^^^^^^^^ meta.requires.powershell keyword.other.powershell
#Requires -Modules PSWorkflow
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#Requires -Modules PSWorkflow -ThisIsInvalid
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#                             ^^^^^^^^^^^^^^ meta.requires.powershell
#Requires -Modules PSWorkflow, ActiveDirectory
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#                              ^^^^^^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#Requires -Modules PSWorkflow,ActiveDirectory
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#                             ^^^^^^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#Requires -ShellId MyLocalShell
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^^^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#Requires -Modules PSWorkflow, @{ModuleName="PSScheduledJob"; ModuleVersion="1.0.0.0"}
# <- punctuation.definition.comment.powershell
# ^ meta.requires.powershell keyword.control.requires.powershell
#         ^^^^^^^^ meta.requires.powershell keyword.other.powershell
#                  ^^^^^^^^^^ meta.requires.powershell variable.parameter.powershell
#                                ^^^^^^^^^^ meta.requires.powershell meta.hashtable.powershell variable.other.readwrite.powershell
#                                          ^ meta.requires.powershell meta.hashtable.powershell
#                                           ^^^^^^^^^^^^^^^^ meta.requires.powershell meta.hashtable.powershell string.quoted.double.powershell
#                                                           ^ meta.requires.powershell meta.hashtable.powershell keyword.other.statement-separator.powershell
#                                                             ^^^^^^^^^^^^^ meta.requires.powershell meta.hashtable.powershell variable.other.readwrite.powershell
#                                                                          ^ meta.requires.powershell meta.hashtable.powershell
#                                                                           ^^^^^^^^^ meta.requires.powershell meta.hashtable.powershell string.quoted.double.powershell

throw "Do not run this file!"
# <- keyword.control.powershell
#     ^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell

# Stop parsing
& tool.exe /arg1 'value' /arg2 $value --% /arg3 $value /arg4 "value" # Comment
# <- keyword.operator.other.powershell
# ^^^^^^^^ support.function.powershell
#          ^             ^            ^^  ^            ^ keyword.operator.assignment.powershell
#                                       ^ keyword.control.powershell

# Automatic variables
$_
# <- keyword.other.variable.definition.powershell
 # <- support.constant.automatic.powershell
$args
# <- keyword.other.variable.definition.powershell
# ^ support.constant.automatic.powershell
$error
# <- keyword.other.variable.definition.powershell
# ^ support.constant.variable.powershell
$home
# <- keyword.other.variable.definition.powershell
# ^ support.constant.variable.powershell
$foreach
# <- keyword.other.variable.definition.powershell
# ^ support.constant.automatic.powershell

# Normal variables
$variable
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
$script:variable
# <- keyword.other.variable.definition.powershell
# ^ storage.modifier.scope.powershell
#       ^ variable.other.readwrite.powershell
$ENV:ComputerName
# <- keyword.other.variable.definition.powershell
# ^ support.variable.drive.powershell
#    ^ variable.other.readwrite.powershell
${variable}
# <- keyword.other.variable.definition.powershell
 # <- punctuation.section.braces.begin.powershell
# ^^^^^^^^ variable.other.readwrite.powershell
#         ^ punctuation.section.braces.end.powershell
${script:variable}
# <- keyword.other.variable.definition.powershell
 # <- punctuation.section.braces.begin.powershell
# ^ storage.modifier.scope.powershell
#        ^ variable.other.readwrite.powershell
#                ^ punctuation.section.braces.end.powershell

# Variable properties should be highlighted
$variable.Name
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#        ^^^^^ entity.name.function.invocation.powershell

# In double-quoted strings, only the variable should be highlighted, not the property
"This is my $variable.Name!"
# <- string.quoted.double.powershell
# ^^^^^^^^^^         ^^^^^^^ string.quoted.double.powershell
#           ^ keyword.other.variable.definition.powershell
#            ^^^^^^^^ variable.other.readwrite.powershell

# When used in a subexpression, both should be highlighted
"This is my $($variable.Name)!"
# <- string.quoted.double.powershell
# ^^^^^^^^^^                 ^^ string.quoted.double.powershell
#           ^ ^ keyword.other.variable.definition.powershell
#            ^ punctuation.section.group.begin.powershell
#                           ^ punctuation.section.group.end.powershell
#              ^^^^^^^^ variable.other.readwrite.powershell
#                       ^^^^ entity.name.function.invocation.powershell

# $ENV:ComputerName should be highlighted
"This is the name of my computer: $ENV:ComputerName"
# <- string.quoted.double.powershell
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                 ^ string.quoted.double.powershell
#                                 ^ keyword.other.variable.definition.powershell
#                                  ^^^^ support.variable.drive.powershell
#                                      ^^^^^^^^^^^^ variable.other.readwrite.powershell

# Here as well
"This is the name of my computer: ${ENV:ComputerName}"
# <- string.quoted.double.powershell
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                   ^ string.quoted.double.powershell
#                                 ^ keyword.other.variable.definition.powershell
#                                  ^ punctuation.section.braces.begin.powershell
#                                   ^^^^ support.variable.drive.powershell
#                                       ^^^^^^^^^^^^ variable.other.readwrite.powershell
#                                                   ^ punctuation.section.braces.end.powershell

# Hashtable
$properties = @{
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#           ^ keyword.operator.assignment.powershell
#             ^ keyword.other.hashtable.begin.powershell
#              ^ punctuation.section.braces.begin.powershell
    Name      = 'Name'
    # <- meta.hashtable.powershell meta.hashtable.assignment.powershell variable.other.readwrite.powershell
    #         ^ meta.hashtable.powershell meta.hashtable.assignment.powershell keyword.operator.assignment.powershell
    #           ^ meta.hashtable.powershell string.quoted.single.powershell
	Something = $else
    # <- meta.hashtable.powershell meta.hashtable.assignment.powershell variable.other.readwrite.powershell
    # Atom-grammar-test is not tokenizing this correctly... Need to test in Atom - TODO
    Number    = 16
    # <- meta.hashtable.powershell meta.hashtable.assignment.powershell variable.other.readwrite.powershell
    #         ^ meta.hashtable.powershell meta.hashtable.assignment.powershell keyword.operator.assignment.powershell
    #           ^^ meta.hashtable.powershell constant.numeric.integer.powershell
    from      = 'hello world'
    # <- meta.hashtable.powershell meta.hashtable.assignment.powershell variable.other.readwrite.powershell
    #         ^ meta.hashtable.powershell meta.hashtable.assignment.powershell keyword.operator.assignment.powershell
    #           ^^^^^^^^^^^^^ meta.hashtable.powershell string.quoted.single.powershell
    hash      = @{
    # <- meta.hashtable.powershell meta.hashtable.assignment.powershell variable.other.readwrite.powershell
    #         ^ meta.hashtable.powershell meta.hashtable.assignment.powershell keyword.operator.assignment.powershell
    #           ^ keyword.other.hashtable.begin.powershell
    #            ^ punctuation.section.braces.begin.powershell
        hello = 'world'
        # <- meta.hashtable.powershell meta.hashtable.assignment.powershell variable.other.readwrite.powershell
        #     ^ meta.hashtable.powershell meta.hashtable.assignment.powershell keyword.operator.assignment.powershell
        #       ^^^^^^^ meta.hashtable.powershell string.quoted.single.powershell
    }
    # <- punctuation.section.braces.end.powershell
}
# <- punctuation.section.braces.end.powershell

# Spatting
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function.powershell
#                    ^ keyword.other.variable.definition.powershell
#                     ^ variable.other.readwrite.powershell

# ScriptBlock
    {Invoke-Something @properties}
#   ^ punctuation.section.braces.begin.powershell
#    ^^^^^^^^^^^^^^^^ support.function.powershell
#                     ^ keyword.other.variable.definition.powershell
#                      ^ variable.other.readwrite.powershell
#                                ^ punctuation.section.braces.end.powershell
{
# <- punctuation.section.braces.begin.powershell
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function.powershell
#                    ^ keyword.other.variable.definition.powershell
#                     ^ variable.other.readwrite.powershell
}
# <- punctuation.section.braces.end.powershell
$sb = {
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#     ^ punctuation.section.braces.begin.powershell
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function.powershell
#                    ^ keyword.other.variable.definition.powershell
#                     ^ variable.other.readwrite.powershell
}
# <- punctuation.section.braces.end.powershell

# Arrays
$a1 = @(1,2,3,4)
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#     ^ keyword.other.array.begin.powershell
#      ^ punctuation.section.group.begin.powershell
#              ^ punctuation.section.group.end.powershell
#       ^ ^ ^ ^ meta.group.array-expression.powershell constant.numeric.integer.powershell
#        ^ ^ ^ meta.group.array-expression.powershell keyword.operator.other.powershell
$a2 = ('one','two','three','four')
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#     ^ punctuation.section.group.begin.powershell
#      ^^^^^ ^^^^^ ^^^^^^^ ^^^^^^ string.quoted.single.powershell
#           ^     ^       ^ keyword.operator.other.powershell
#                                ^ punctuation.section.group.end.powershell
$a3 = $one, $two, $three, $four
# <- keyword.other.variable.definition.powershell
#     ^     ^     ^       ^ keyword.other.variable.definition.powershell
# ^    ^     ^     ^       ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#         ^     ^       ^ keyword.operator.other.powershell
$a1[0]
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#  ^ punctuation.section.bracket.begin.powershell
#   ^ constant.numeric.integer.powershell
#    ^ punctuation.section.bracket.end.powershell
$a2[-1]
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#  ^ punctuation.section.bracket.begin.powershell
#   ^^ constant.numeric.integer.powershell
#     ^ punctuation.section.bracket.end.powershell
$a3[1..2]
# <- keyword.other.variable.definition.powershell
# ^ variable.other.readwrite.powershell
#  ^ punctuation.section.bracket.begin.powershell
#   ^  ^ constant.numeric.integer.powershell
#    ^^ keyword.operator.range.powershell
#       ^ punctuation.section.bracket.end.powershell
    @(@($a))
#   ^ ^ keyword.other.array.begin.powershell
#    ^ ^ punctuation.section.group.begin.powershell
#       ^ keyword.other.variable.definition.powershell
#        ^ variable.other.readwrite.powershell
#         ^^ punctuation.section.group.end.powershell
    @(($i = 10); (++$j))
#   ^ keyword.other.array.begin.powershell
#    ^^          ^ punctuation.section.group.begin.powershell
#      ^            ^ keyword.other.variable.definition.powershell
#       ^            ^ variable.other.readwrite.powershell
#         ^ keyword.operator.assignment.powershell
#           ^^ constant.numeric.integer.powershell
#              ^ keyword.other.statement-separator.powershell
#                 ^^ keyword.operator.assignment.powershell
#             ^       ^^ punctuation.section.group.end.powershell
    @($i = 10)
#   ^ keyword.other.array.begin.powershell
#    ^ punctuation.section.group.begin.powershell
#     ^ keyword.other.variable.definition.powershell
#      ^ variable.other.readwrite.powershell
#        ^ keyword.operator.assignment.powershell
#          ^^ constant.numeric.integer.powershell
#            ^ punctuation.section.group.end.powershell
    $i[($y - 1) + $x]
#   ^   ^         ^ keyword.other.variable.definition.powershell
#    ^   ^         ^ variable.other.readwrite.powershell
#     ^ punctuation.section.bracket.begin.powershell
#      ^ punctuation.section.group.begin.powershell
#          ^    ^ keyword.operator.assignment.powershell
#            ^ constant.numeric.integer.powershell
#             ^ punctuation.section.group.end.powershell
#                   ^ punctuation.section.bracket.end.powershell

# Single quoted strings
    'This is a single quoted string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.powershell
    '$This is a single ''quoted'' string.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.powershell
    'This is a
    single quoted string.'
#   ^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.powershell
    'This #also'
#   ^^^^^^^^^^^^ string.quoted.single.powershell
    '$(Invoke-Something)'
#   ^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.powershell
    'This "string" is nice.'
#   ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.powershell

# Double quoted strings
    "This is a double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
    "$This is a double ""quoted"" string."
#   ^     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
#    ^ keyword.other.variable.definition.powershell
#     ^^^^ support.variable.automatic.powershell
    "This is a
    double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
    "This #also"
#   ^^^^^^^^^^^^ string.quoted.double.powershell
    "$(Invoke-Something)"
#   ^                   ^ string.quoted.double.powershell
#    ^ keyword.other.variable.definition.powershell
#     ^ punctuation.section.group.begin.powershell
#      ^ interpolated.complex.source.powershell support.function.powershell
#                      ^ punctuation.section.group.end.powershell
    "This 'string' is nice."
#   ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell

# Double quoted here-string
@"
# <- string.quoted.double.heredoc.powershell
 # <- string.quoted.double.heredoc.powershell
$This is a 'double quoted'
# <- keyword.other.variable.definition.powershell
# ^ string.quoted.double.heredoc.powershell support.variable.automatic.powershell
Isn't it "nice"??
"@
# <- string.quoted.double.heredoc.powershell
 # <- string.quoted.double.heredoc.powershell

# Numeric constants
    -3
#   ^^ constant.numeric.integer.powershell
    .5
#   ^^ constant.numeric.integer.powershell
    +.5
#   ^^^ constant.numeric.integer.powershell
    1.
#   ^ constant.numeric.integer.powershell
#    ^ source.powershell
    1.d
#   ^^^ constant.numeric.integer.powershell
    1.lGB
#   ^^^ constant.numeric.integer.powershell
#      ^^ keyword.other.powershell
    1.e+12d
#   ^^^ ^^^ constant.numeric.integer.powershell
#      ^ keyword.operator.assignment.powershell
    1e+12d
#   ^^ ^^^ constant.numeric.integer.powershell
#     ^ keyword.operator.assignment.powershell
    1.5
#   ^^^ constant.numeric.integer.powershell
    -1.5
#   ^^^^ constant.numeric.integer.powershell
    -3 + -2
#   ^^   ^^ constant.numeric.integer.powershell
#      ^ keyword.operator.assignment.powershell
    -3+-2
#   ^^ ^^ constant.numeric.integer.powershell
#     ^ keyword.operator.assignment.powershell
    3++2
#   ^ ^^ constant.numeric.integer.powershell
#    ^ keyword.operator.assignment.powershell
    +2
#   ^^ constant.numeric.integer.powershell
    -3+-
#   ^^ constant.numeric.integer.powershell
#     ^^ keyword.operator.assignment.powershell
    10/-10
#   ^^ ^^^ constant.numeric.integer.powershell
#     ^ keyword.operator.assignment.powershell
    10/-10D
#   ^^ ^^^^ constant.numeric.integer.powershell
#     ^ keyword.operator.assignment.powershell
    -10.002L
#   ^^^^^^^^ constant.numeric.integer.powershell
    $x..5.40D
#   ^ keyword.other.variable.definition.powershell
#    ^ variable.other.readwrite.powershell
#     ^^ keyword.operator.range.powershell
#       ^^^^^ constant.numeric.integer.powershell
    -500..-495
#   ^^^^  ^^^^ constant.numeric.integer.powershell
#       ^^ keyword.operator.range.powershell
    $true..3
#   ^ keyword.other.variable.definition.powershell
#    ^^^^ constant.language.powershell
#        ^^ keyword.operator.range.powershell
#          ^ constant.numeric.integer.powershell
    -2..$null
#   ^^ constant.numeric.integer.powershell
#     ^^ keyword.operator.range.powershell
#       ^ keyword.other.variable.definition.powershell
#        ^^^^ constant.language.powershell
    -3..3
#   ^^  ^ constant.numeric.integer.powershell
#     ^^ keyword.operator.range.powershell
    1..3
#   ^  ^ constant.numeric.integer.powershell
#    ^^ keyword.operator.range.powershell
    6,10,-3
#   ^ ^^ ^^ constant.numeric.integer.powershell
#    ^  ^ keyword.operator.other.powershell
    0x476
#   ^^^^^ constant.numeric.hex.powershell
    +0x20
#   ^^^^^ constant.numeric.hex.powershell
    -0x20
#   ^^^^^ constant.numeric.hex.powershell

# Types
[string]
# <- punctuation.section.bracket.begin.powershell
# ^ storage.type.powershell
#      ^ punctuation.section.bracket.end.powershell
[string[]]
# <- punctuation.section.bracket.begin.powershell
# ^ storage.type.powershell
#      ^ punctuation.section.bracket.begin.powershell
#       ^^ punctuation.section.bracket.end.powershell
[int32]
# <- punctuation.section.bracket.begin.powershell
# ^^^^ storage.type.powershell
#     ^ punctuation.section.bracket.end.powershell
[System.Collections.Generic.Dictionary[[System.String, mscorlib],[System.Management.Automation.ParameterMetadata,System.Management.Automation]]]
# <- punctuation.section.bracket.begin.powershell
# ^                                     ^              ^            ^                                             ^ storage.type.powershell
#                                     ^^                         ^ punctuation.section.bracket.begin.powershell
#                                                              ^                                                                             ^^^ punctuation.section.bracket.end.powershell
[System.Array+SZArrayEnumerator]
# <- punctuation.section.bracket.begin.powershell
# ^           ^ storage.type.powershell
#            ^ keyword.operator.assignment.powershell
#                              ^ punctuation.section.bracket.end.powershell
[int]::MinValue
# <- punctuation.section.bracket.begin.powershell
# ^ storage.type.powershell
#   ^ punctuation.section.bracket.end.powershell
[System.DateTime]::Parse('2016/09/21')
# <- punctuation.section.bracket.begin.powershell
# ^^^^^^^^^^^^^^ storage.type.powershell
#               ^ punctuation.section.bracket.end.powershell
#                       ^ punctuation.section.group.begin.powershell
#                                    ^ punctuation.section.group.end.powershell

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
øyvind.com # this should also highlight - TODO

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

# Note that the # in the path should highlight as a comment!
function Test-Drive([string]$roman) {
	$roman | c:\users\Me\Documents\Programming\F#\test.exe $roman
}

function Get-EscapedPath
{
    param(
    [Parameter(
        Position=0,
        Mandatory=$true,
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
param ($Var)

# Redirection
notepad.exe > log.txt
notepad.exe 1> log.txt
notepad.exe 2>&1
notepad.exe 3>&1
notepad.exe 4>&1
notepad.exe 5>&1
notepad.exe 6>&1
notepad.exe 2>&1> log.txt

# Operators
if (10 -cgt 100) { }
$a -is $b
$b -contains $c
$x -notcontains $c
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
$foo.bar
($foo).bar
(Invoke-Something).bar