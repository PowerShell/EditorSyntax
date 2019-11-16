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
#                                                           ^ meta.requires.powershell meta.hashtable.powershell punctuation.terminator.statement.powershell
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
#          ^             ^ keyword.operator.assignment.powershell
#                                     ^^^ keyword.control.powershell
#                                         ^^    ^^     ^^    ^^      ^ ^ string.unquoted.powershell

# Automatic variables
$_, $$, $^, $?
# <- punctuation.definition.variable.powershell
 # <- support.variable.automatic.powershell
#   ^ punctuation.definition.variable.powershell
#    ^ support.variable.automatic.powershell
#       ^ punctuation.definition.variable.powershell
#        ^ support.variable.automatic.powershell
#           ^ punctuation.definition.variable.powershell
#            ^ support.variable.automatic.powershell
$args
# <- punctuation.definition.variable.powershell
# ^ support.variable.automatic.powershell
$error
# <- punctuation.definition.variable.powershell
# ^ support.constant.variable.powershell
$home
# <- punctuation.definition.variable.powershell
# ^ support.constant.variable.powershell
$foreach
# <- punctuation.definition.variable.powershell
# ^ support.variable.automatic.powershell

# Normal variables
$variable
# <- punctuation.definition.variable.powershell
# ^ variable.other.readwrite.powershell
$script:variable
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ storage.modifier.scope.powershell
#       ^ variable.other.readwrite.powershell
$ENV:ComputerName
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ support.variable.drive.powershell
#    ^ variable.other.readwrite.powershell
${variable}
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
 # <- punctuation.section.braces.begin.powershell
# ^^^^^^^^ variable.other.readwrite.powershell
#         ^ punctuation.section.braces.end.powershell
${script:variable}
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
 # <- punctuation.section.braces.begin.powershell
# ^ storage.modifier.scope.powershell
#        ^ variable.other.readwrite.powershell
#                ^ punctuation.section.braces.end.powershell

# Variable properties should be highlighted
$variable.Name
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ variable.other.readwrite.powershell
#         ^^^^ variable.other.member.powershell

# In double-quoted strings, only the variable should be highlighted, not the property
"This is my $variable.Name!"
# <- punctuation.definition.string.begin.powershell string.quoted.double.powershell
# ^^^^^^^^^^         ^^^^^^^ string.quoted.double.powershell
#           ^ punctuation.definition.variable.powershell
#            ^^^^^^^^ variable.other.readwrite.powershell
#                          ^ punctuation.definition.string.end.powershell

# When used in a subexpression, both should be highlighted
"This is my $($variable.Name)!"
# <- punctuation.definition.string.begin.powershell string.quoted.double.powershell
# ^^^^^^^^^^                 ^^ string.quoted.double.powershell
#           ^ ^ punctuation.definition.variable.powershell
#            ^ punctuation.section.group.begin.powershell
#                           ^ punctuation.section.group.end.powershell
#              ^^^^^^^^ variable.other.readwrite.powershell
#                       ^^^^ variable.other.member.powershell
#                             ^ punctuation.definition.string.end.powershell

# $ENV:ComputerName should be highlighted
"This is the name of my computer: $ENV:ComputerName"
# <- punctuation.definition.string.begin.powershell string.quoted.double.powershell
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
#                                 ^ punctuation.definition.variable.powershell
#                                  ^^^^ support.variable.drive.powershell
#                                      ^^^^^^^^^^^^ variable.other.readwrite.powershell
#                                                  ^ punctuation.definition.string.end.powershell

# Here as well
"This is the name of my computer: ${ENV:ComputerName}"
# <- punctuation.definition.string.begin.powershell string.quoted.double.powershell
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                   ^ string.quoted.double.powershell
#                                 ^ punctuation.definition.variable.powershell
#                                  ^ punctuation.section.braces.begin.powershell
#                                   ^^^^ support.variable.drive.powershell
#                                       ^^^^^^^^^^^^ variable.other.readwrite.powershell
#                                                    ^ punctuation.definition.string.end.powershell

# @splat references only work in argument mode, should not highlight in strings
"This is a @double quoted string."
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
#          ^ not:punctuation.definition.variable.powershell
#           ^ not:variable.other.readwrite.powershell

# double check scopes for automatic variables in strings
"$_ $$ $Pwd"
# ^ support.variable.automatic.powershell
#    ^ support.variable.automatic.powershell
#       ^ support.variable.automatic.powershell

# Single quotes string
'This is a string'
# <- punctuation.definition.string.begin.powershell string.quoted.single.powershell
# ^^^^^^^^^^^^^^^ string.quoted.single.powershell
#                ^ punctuation.definition.string.end.powershell

# Hashtable
$properties = @{
# <- punctuation.definition.variable.powershell
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
#                    ^ punctuation.definition.variable.powershell
#                     ^ variable.other.readwrite.powershell

# ScriptBlock
    {Invoke-Something @properties}
#   ^ punctuation.section.braces.begin.powershell
#    ^^^^^^^^^^^^^^^^ support.function.powershell
#                     ^ punctuation.definition.variable.powershell
#                      ^ variable.other.readwrite.powershell
#                                ^ punctuation.section.braces.end.powershell
{
# <- punctuation.section.braces.begin.powershell
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function.powershell
#                    ^ punctuation.definition.variable.powershell
#                     ^ variable.other.readwrite.powershell
}
# <- punctuation.section.braces.end.powershell
$sb = {
# <- punctuation.definition.variable.powershell
# ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#     ^ punctuation.section.braces.begin.powershell
    Invoke-Something @properties
#   ^^^^^^^^^^^^^^^^ support.function.powershell
#                    ^ punctuation.definition.variable.powershell
#                     ^ variable.other.readwrite.powershell
}
# <- punctuation.section.braces.end.powershell

# Arrays
$a1 = @(1,2,3,4)
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#     ^ keyword.other.array.begin.powershell
#      ^ punctuation.section.group.begin.powershell
#              ^ punctuation.section.group.end.powershell
#       ^ ^ ^ ^ meta.group.array-expression.powershell constant.numeric.integer.powershell
#        ^ ^ ^ meta.group.array-expression.powershell keyword.operator.other.powershell
$a2 = ('one','two','three','four')
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#     ^ punctuation.section.group.begin.powershell
#      ^^^^^ ^^^^^ ^^^^^^^ ^^^^^^ string.quoted.single.powershell
#           ^     ^       ^ keyword.operator.other.powershell
#                                ^ punctuation.section.group.end.powershell
$a3 = $one, $two, $three, $four
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
#     ^     ^     ^       ^ punctuation.definition.variable.powershell
# ^    ^     ^     ^       ^ variable.other.readwrite.powershell
#   ^ keyword.operator.assignment.powershell
#         ^     ^       ^ keyword.operator.other.powershell
$a1[0]
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ variable.other.readwrite.powershell
#  ^ punctuation.section.bracket.begin.powershell
#   ^ constant.numeric.integer.powershell
#    ^ punctuation.section.bracket.end.powershell
$a2[-1]
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ variable.other.readwrite.powershell
#  ^ punctuation.section.bracket.begin.powershell
#   ^^ constant.numeric.integer.powershell
#     ^ punctuation.section.bracket.end.powershell
$a3[1..2]
# <- punctuation.definition.variable.powershell variable.other.readwrite.powershell
# ^ variable.other.readwrite.powershell
#  ^ punctuation.section.bracket.begin.powershell
#   ^  ^ constant.numeric.integer.powershell
#    ^^ keyword.operator.range.powershell
#       ^ punctuation.section.bracket.end.powershell
    @(@($a))
#   ^ ^ keyword.other.array.begin.powershell
#    ^ ^ punctuation.section.group.begin.powershell
#       ^ punctuation.definition.variable.powershell variable.other.readwrite.powershell
#        ^ variable.other.readwrite.powershell
#         ^^ punctuation.section.group.end.powershell
    @(($i = 10); (++$j))
#   ^ keyword.other.array.begin.powershell
#    ^^          ^ punctuation.section.group.begin.powershell
#      ^            ^ punctuation.definition.variable.powershell variable.other.readwrite.powershell
#       ^            ^ variable.other.readwrite.powershell
#         ^ keyword.operator.assignment.powershell
#           ^^ constant.numeric.integer.powershell
#              ^ punctuation.terminator.statement.powershell
#                 ^^ keyword.operator.assignment.powershell
#             ^       ^^ punctuation.section.group.end.powershell
    @($i = 10)
#   ^ keyword.other.array.begin.powershell
#    ^ punctuation.section.group.begin.powershell
#     ^ punctuation.definition.variable.powershell variable.other.readwrite.powershell
#      ^ variable.other.readwrite.powershell
#        ^ keyword.operator.assignment.powershell
#          ^^ constant.numeric.integer.powershell
#            ^ punctuation.section.group.end.powershell
    $i[($y - 1) + $x]
#   ^   ^         ^ punctuation.definition.variable.powershell variable.other.readwrite.powershell
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
#    ^ punctuation.definition.variable.powershell support.variable.automatic.powershell
#     ^^^^ support.variable.automatic.powershell
    "This is a
    double quoted string."
#   ^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.powershell
    "This #also"
#   ^^^^^^^^^^^^ string.quoted.double.powershell
    "$(Invoke-Something)"
#   ^                   ^ string.quoted.double.powershell
#    ^ punctuation.definition.variable.powershell
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
# <- punctuation.definition.variable.powershell
# ^ string.quoted.double.heredoc.powershell support.variable.automatic.powershell
Isn't it "nice"??
There is no @platting here!
#           ^ not:punctuation.definition.variable.powershell
#            ^ not:variable.other.readwrite.powershell
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
#   ^ punctuation.definition.variable.powershell
#    ^ variable.other.readwrite.powershell
#     ^^ keyword.operator.range.powershell
#       ^^^^^ constant.numeric.integer.powershell
    -500..-495
#   ^^^^  ^^^^ constant.numeric.integer.powershell
#       ^^ keyword.operator.range.powershell
    $true..3
#   ^ punctuation.definition.variable.powershell
#    ^^^^ constant.language.powershell
#        ^^ keyword.operator.range.powershell
#          ^ constant.numeric.integer.powershell
    -2..$null
#   ^^ constant.numeric.integer.powershell
#     ^^ keyword.operator.range.powershell
#       ^ punctuation.definition.variable.powershell constant.language.powershell
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
# <- support.function.powershell
#                ^ keyword.operator.assignment.powershell
Invoke-Something -foobar value
# <- support.function.powershell
#                ^ keyword.operator.assignment.powershell
Invoke-Something -foobar:$true
# <- support.function.powershell
#                ^ keyword.operator.assignment.powershell
#                        ^ punctuation.definition.variable.powershell
#                         ^^^^ constant.language.powershell
Invoke-Something -foobar: $true
# <- support.function.powershell
#                ^ keyword.operator.assignment.powershell
Invoke-Something -p1 v1 -p2 10 -p3 'value' -switch -verbose
# <- support.function.powershell
#                ^      ^      ^           ^       ^ keyword.operator.assignment.powershell
#                           ^^ constant.numeric.integer.powershell
#                                           ^ source.powershell
Invoke-Something (1..20 | Invoke-Something) -p2 'value'
# <- support.function.powershell
Invoke-Something -p1 v2 -p2 30 | Invoke-Something -switch
# <- support.function.powershell
#                ^      ^                         ^ keyword.operator.assignment.powershell
#                           ^^ constant.numeric.integer.powershell
#                              ^ keyword.operator.other.powershell
#                                ^ support.function.powershell
#                                                  ^ source.powershell
Invoke-Something -p1 {
# <- support.function.powershell
#                ^ keyword.operator.assignment.powershell
#                    ^ punctuation.section.braces.begin.powershell
    Invoke-Something -foobar:$true
#   ^ support.function.powershell
#                    ^ keyword.operator.assignment.powershell
#                            ^ punctuation.definition.variable.powershell
#                             ^^^^ constant.language.powershell
} | Invoke-Something
# <- punctuation.section.braces.end.powershell
# ^ keyword.operator.other.powershell
#   ^ support.function.powershell
Invoke-Something -p1 value `
# <- support.function.powershell
#                ^ keyword.operator.assignment.powershell
#                          ^ keyword.operator.other.powershell
    -p2 14.4 `
#   ^ keyword.operator.assignment.powershell
#       ^^^^ constant.numeric.integer.powershell
#            ^ keyword.operator.other.powershell
    -p3 $value | Invoke-Something -verbose
#   ^                             ^ keyword.operator.assignment.powershell
#       ^ punctuation.definition.variable.powershell
#              ^ keyword.operator.other.powershell
#                ^^^^^^^^^^^^^^^^ support.function.powershell

# Commands (Built-in variables)
ls *.ps1 -recurse
#  ^     ^ keyword.operator.assignment.powershell

# Commands (executable files)
. .\scripts\myscript.ps1 -parameter 'value'
# <- keyword.operator.other.powershell
#                        ^ keyword.operator.assignment.powershell
#                                   ^^^^^^^ string.quoted.single.powershell
& tool.exe
# <- keyword.operator.other.powershell
# ^^^^^^^^ support.function.powershell
something.cmd
# <- support.function.powershell
øyvind.com # this should also highlight - TODO

# switch
switch ("fourteen") {}
# <- keyword.control.powershell
#      ^ punctuation.section.group.begin.powershell
#       ^ string.quoted.double.powershell
#                 ^ punctuation.section.group.end.powershell
#                   ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#                    ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
switch -CaseSensitive ("fourteen") {}
# <- keyword.control.powershell
#      ^ keyword.operator.assignment.powershell
#                     ^ punctuation.section.group.begin.powershell
#                      ^ string.quoted.double.powershell
#                                ^ punctuation.section.group.end.powershell
#                                  ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#                                   ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
switch -Regex ("fourteen") {}
# <- keyword.control.powershell
#      ^ keyword.operator.assignment.powershell
#             ^ punctuation.section.group.begin.powershell
#              ^ string.quoted.double.powershell
#                        ^ punctuation.section.group.end.powershell
#                          ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#                           ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
switch -Wildcard ($a) {}
# <- keyword.control.powershell
#      ^ keyword.operator.assignment.powershell
#                ^ punctuation.section.group.begin.powershell
#                 ^ punctuation.definition.variable.powershell
#                   ^ punctuation.section.group.end.powershell
#                     ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#                      ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
switch -regex -file .\somefile.txt {}
# <- keyword.control.powershell
#      ^      ^ keyword.operator.assignment.powershell
#                                  ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#                                   ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
switch (3) {}
# <- keyword.control.powershell
#      ^ punctuation.section.group.begin.powershell
#       ^ constant.numeric.integer.powershell
#        ^ punctuation.section.group.end.powershell
#          ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#           ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
switch (4, 2) {}
# <- keyword.control.powershell
#      ^ punctuation.section.group.begin.powershell
#       ^  ^ constant.numeric.integer.powershell
#        ^ keyword.operator.other.powershell
#           ^ punctuation.section.group.end.powershell
#             ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#              ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell

switch -Regex -File $filePath {
# <- keyword.control.powershell
#      ^      ^ keyword.operator.assignment.powershell
#                   ^ punctuation.definition.variable.powershell
#                             ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
    '.' {}
#   ^^^ string.quoted.single.powershell
#       ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#        ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
    default {}
#   ^^^^^^^ keyword.control.powershell
#           ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#            ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
}
# <- meta.scriptblock.powershell punctuation.section.braces.end.powershell

switch -Wildcard -CaseSensitive ($something) {
# <- keyword.control.powershell
#      ^         ^ keyword.operator.assignment.powershell
#                               ^ punctuation.section.group.begin.powershell
#                                ^ punctuation.definition.variable.powershell
#                                 ^ variable.other.readwrite.powershell
#                                          ^ punctuation.section.group.end.powershell
#                                            ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
    '.' {}
#   ^^^ string.quoted.single.powershell
#       ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#        ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
    default {}
#   ^^^^^^^ keyword.control.powershell
#           ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#            ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
}
# <- meta.scriptblock.powershell punctuation.section.braces.end.powershell

switch ('this') {
# <- keyword.control.powershell
#      ^ punctuation.section.group.begin.powershell
#       ^^^^^^ string.quoted.single.powershell
#             ^ punctuation.section.group.end.powershell
#               ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
    'this' {}
#   ^^^^^^ string.quoted.single.powershell
#          ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#           ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
    default {}
#   ^^^^^^^ keyword.control.powershell
#           ^ meta.scriptblock.powershell punctuation.section.braces.begin.powershell
#            ^ meta.scriptblock.powershell punctuation.section.braces.end.powershell
}
# <- meta.scriptblock.powershell punctuation.section.braces.end.powershell

# Functions and filters
functioN MyFunction{}
# <- storage.type.powershell
#        ^^^^^^^^^^ entity.name.function.powershell
#                  ^ punctuation.section.braces.begin.powershell
#                   ^ punctuation.section.braces.end.powershell
function My-Function         {}
# <- storage.type.powershell
#        ^^^^^^^^^^^ entity.name.function.powershell
#                            ^ punctuation.section.braces.begin.powershell
#                             ^ punctuation.section.braces.end.powershell
Function My.Function{}
# <- storage.type.powershell
#        ^^^^^^^^^^^ entity.name.function.powershell
#                   ^ punctuation.section.braces.begin.powershell
#                    ^ punctuation.section.braces.end.powershell
function My-Function.Other{}
# <- storage.type.powershell
#        ^^^^^^^^^^^^^^^^^ entity.name.function.powershell
#                         ^ punctuation.section.braces.begin.powershell
#                          ^ punctuation.section.braces.end.powershell
function Some.other.function{}
# <- storage.type.powershell
#        ^^^^^^^^^^^^^^^^^^^ entity.name.function.powershell
#                           ^ punctuation.section.braces.begin.powershell
#                            ^ punctuation.section.braces.end.powershell
FUNCTION MyFunction2 {}
# <- storage.type.powershell
#        ^^^^^^^^^^^ entity.name.function.powershell
#                    ^ punctuation.section.braces.begin.powershell
#                     ^ punctuation.section.braces.end.powershell
function New-File { }
# <- storage.type.powershell
#        ^^^^^^^^ entity.name.function.powershell
#                 ^ punctuation.section.braces.begin.powershell
#                   ^ punctuation.section.braces.end.powershell
function New-File ($Name) { }
# <- storage.type.powershell
#        ^^^^^^^^ entity.name.function.powershell
#                         ^ punctuation.section.braces.begin.powershell
#                           ^ punctuation.section.braces.end.powershell
function NewFile($Name) { }
# <- storage.type.powershell
#        ^^^^^^^ entity.name.function.powershell
#               ^ punctuation.section.group.begin.powershell
#                ^ punctuation.definition.variable.powershell
#                   ^ variable.other.readwrite.powershell
#                     ^ punctuation.section.group.end.powershell
#                       ^ punctuation.section.braces.begin.powershell
#                         ^ punctuation.section.braces.end.powershell
filter myfilter($param) {}
# <- storage.type.powershell
#      ^^^^^^^^ entity.name.function.powershell
#              ^ punctuation.section.group.begin.powershell
#               ^ punctuation.definition.variable.powershell
#                ^ variable.other.readwrite.powershell
#                     ^ punctuation.section.group.end.powershell
#                       ^ punctuation.section.braces.begin.powershell
#                        ^ punctuation.section.braces.end.powershell
Filter my-Filter ($param){}
# <- storage.type.powershell
#      ^^^^^^^^^ entity.name.function.powershell
#                ^ punctuation.section.group.begin.powershell
#                 ^ punctuation.definition.variable.powershell
#                   ^ variable.other.readwrite.powershell
#                       ^ punctuation.section.group.end.powershell
#                        ^ punctuation.section.braces.begin.powershell
#                         ^ punctuation.section.braces.end.powershell

# Note that the # in the path should highlight as a comment!
function Test-Drive([string]$roman) {
# <- storage.type.powershell
#        ^^^^^^^^^^ entity.name.function.powershell
#                  ^ punctuation.section.group.begin.powershell
#                   ^ punctuation.section.bracket.begin.powershell
#                    ^^^^^^ storage.type.powershell
#                          ^ punctuation.section.bracket.end.powershell
#                           ^ punctuation.definition.variable.powershell
#                            ^ variable.other.readwrite.powershell
#                                 ^ punctuation.section.group.end.powershell
#                                   ^ punctuation.section.braces.begin.powershell
    $roman | c:\users\Me\Documents\Programming\F#\test.exe $roman
#   ^ punctuation.definition.variable.powershell
#    ^ variable.other.readwrite.powershell
#          ^ keyword.operator.other.powershell
#                                               ^ punctuation.definition.comment.powershell
#                                                       ^  ^ comment.line.powershell
}
# <- punctuation.section.braces.end.powershell

function Verb-Noun
# <- meta.function storage.type
#        ^ meta.function entity.name.function.powershell
{
# <- punctuation.section.braces.begin.powershell

    Param
    # <- keyword.control.powershell
    (
    # <- punctuation.section.group.begin.powershell
        # Param1 help description
        # <- comment.line.powershell punctuation.definition.comment.powershell
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
        [Parameter(Mandatory=$true,
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #         ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #          ^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                   ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                    ^ meta.attribute.powershell punctuation.definition.variable.powershell
        #                     ^^^^ meta.attribute.powershell constant.language.powershell
        #                         ^ meta.attribute.powershell keyword.operator.other.powershell
                   ValueFromPipeline=$true,
        #          ^^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                           ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                            ^ meta.attribute.powershell punctuation.definition.variable.powershell
        #                             ^^^^ meta.attribute.powershell constant.language.powershell
        #                                 ^ meta.attribute.powershell keyword.operator.other.powershell
                   ValueFromPipelineByPropertyName = $true,
        #          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                                          ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                                            ^ meta.attribute.powershell punctuation.definition.variable.powershell
        #                                             ^^^^ meta.attribute.powershell constant.language.powershell
        #                                                 ^ meta.attribute.powershell keyword.operator.other.powershell
                   ValueFromRemainingArguments=$false,
        #          ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                                     ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                                      ^ meta.attribute.powershell punctuation.definition.variable.powershell
        #                                       ^^^^^ meta.attribute.powershell constant.language.powershell
        #                                            ^ meta.attribute.powershell keyword.operator.other.powershell
                   Position=0,
        #          ^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                  ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                   ^ meta.attribute.powershell constant.numeric.integer.powershell
        #                    ^ meta.attribute.powershell keyword.operator.other.powershell
                   SupportsPaging,
        #          ^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                        ^ meta.attribute.powershell keyword.operator.other.powershell
                   ParameterSetName = 'Parameter Set 1')]
        #          ^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                           ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                             ^^^^^^^^^^^^^^^^^ meta.attribute.powershell string.quoted.single.powershell
        #                                              ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                                               ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateNotNullOrEmpty()]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #                      ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #                       ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                        ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateNotNull()]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #               ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #                ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                 ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateNotNullOrEmpty()]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #                      ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #                       ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                        ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateCount(0,5)]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #             ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #              ^ meta.attribute.powershell constant.numeric.integer.powershell
        #               ^ meta.attribute.powershell keyword.operator.other.powershell
        #                ^ meta.attribute.powershell constant.numeric.integer.powershell
        #                 ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                  ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateSet("sun", "moon", "earth")]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #           ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #            ^^^^ meta.attribute.powershell string.quoted.double.powershell
        #                 ^ meta.attribute.powershell keyword.operator.other.powershell
        #                   ^^^^^^ meta.attribute.powershell string.quoted.double.powershell
        #                         ^ meta.attribute.powershell keyword.operator.other.powershell
        #                           ^^^^^^^ meta.attribute.powershell string.quoted.double.powershell
        #                                  ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                                   ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [Alias("p1")]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #     ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #      ^^^^ meta.attribute.powershell string.quoted.double.powershell
        #          ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #           ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        $Param1
        # <- punctuation.definition.variable.powershell
        # ^ variable.other.readwrite.powershell
    )
    # <- punctuation.section.group.end.powershell

    # Do Something....

}
# <- punctuation.section.braces.end.powershell

# Class
class Vehicle {
# <- storage.type.powershell
#     ^ entity.name.function.powershell
#             ^ punctuation.section.braces.begin.powershell
    Vehicle() {}
#          ^ punctuation.section.group.begin.powershell
#           ^ punctuation.section.group.end.powershell
#             ^ punctuation.section.braces.begin.powershell
#              ^ punctuation.section.braces.end.powershell
    Vehicle([string]$Owner) {
#             ^ storage.type.powershell
#                   ^ punctuation.definition.variable.powershell
#                    ^ variable.other.readwrite.powershell
#                           ^ punctuation.section.braces.begin.powershell
        $this.Owner = $Owner
    }

    [int]$Mileage
#    ^ storage.type.powershell
#        ^ punctuation.definition.variable.powershell
#         ^ variable.other.readwrite.powershell
    [int]$Age
#    ^ storage.type.powershell
#        ^ punctuation.definition.variable.powershell
#         ^ variable.other.readwrite.powershell
    [string]$Owner
#    ^ storage.type.powershell
#           ^ punctuation.definition.variable.powershell
#            ^ variable.other.readwrite.powershell

    [void]Drive([int]$NumberOfMiles) {
#    ^           ^ storage.type.powershell
#                    ^ punctuation.definition.variable.powershell
#                     ^ variable.other.readwrite.powershell
        $this.Mileage += $NumberOfMiles
#       ^ punctuation.definition.variable.powershell
#        ^^^^ support.variable.automatic.powershell
#             ^ variable.other.member.powershell
#                     ^^ keyword.operator.assignment.powershell

    }
    # <- punctuation.section.braces.end.powershell
}
# <- punctuation.section.braces.end.powershell

# Control words
foreach ($item in $collection) {
# <- keyword.control.powershell
#       ^ punctuation.section.group.begin.powershell
#              ^^ keyword.control.powershell
#                            ^ punctuation.section.group.end.powershell
#                              ^ punctuation.section.braces.begin.powershell
#        ^        ^ punctuation.definition.variable.powershell
}
# <- punctuation.section.braces.end.powershell

try   { }
# <- keyword.control.powershell
#     ^ punctuation.section.braces.begin.powershell
#       ^ punctuation.section.braces.end.powershell
catch { }
# <- keyword.control.powershell
#     ^ punctuation.section.braces.begin.powershell
#       ^ punctuation.section.braces.end.powershell

# Reserved words
Configuration Crazyness {
# <- storage.type.powershell
#             ^ entity.name.function.powershell
#                       ^ punctuation.section.braces.begin.powershell
    Node Whatever {
#                 ^ punctuation.section.braces.begin.powershell
    }
    # <- punctuation.section.braces.end.powershell
}
# <- punctuation.section.braces.end.powershell

# Redirection
notepad.exe > log.txt
# <- support.function.powershell
#           ^ keyword.operator.redirection.powershell
notepad.exe 1> log.txt
# <- support.function.powershell
#           ^^ keyword.operator.redirection.powershell
notepad.exe 2>&1
# <- support.function.powershell
#           ^^^^ keyword.operator.redirection.powershell
notepad.exe 3>&1
# <- support.function.powershell
#           ^^^^ keyword.operator.redirection.powershell
notepad.exe 4>&1
# <- support.function.powershell
#           ^^^^ keyword.operator.redirection.powershell
notepad.exe 5>&1
# <- support.function.powershell
#           ^^^^ keyword.operator.redirection.powershell
notepad.exe 6>&1
# <- support.function.powershell
#           ^^^^ keyword.operator.redirection.powershell
notepad.exe 2>&1> log.txt
# <- support.function.powershell
#           ^^^^^ keyword.operator.redirection.powershell

# Operators
if (10 -cgt 100) { }
# <- keyword.control.powershell
#  ^ punctuation.section.group.begin.powershell
#   ^^      ^^^ constant.numeric.integer.powershell
#      ^^^^ keyword.operator.comparison.powershell
#              ^ punctuation.section.group.end.powershell
#                ^ punctuation.section.braces.begin.powershell
#                  ^  punctuation.section.braces.end.powershell
$a -is $b
#  ^ keyword.operator.comparison.powershell
$b -contains $c
#  ^ keyword.operator.comparison.powershell
$x -notcontains $c
#  ^ keyword.operator.comparison.powershell
$c -in $b
#  ^ keyword.operator.comparison.powershell
$c -notin $x
#  ^ keyword.operator.comparison.powershell
$a -match $b
#  ^ keyword.operator.comparison.powershell
$a -notmatch $b
#  ^ keyword.operator.comparison.powershell
$x -like $c
#  ^ keyword.operator.comparison.powershell
100 -and 0
#   ^ keyword.operator.logical.powershell
#        ^ constant.numeric.integer.powershell
$a -ceq 4 -and $a -ine $d -or
#  ^              ^ keyword.operator.comparison.powershell
#         ^               ^ keyword.operator.logical.powershell
#       ^ constant.numeric.integer.powershell
#              ^ punctuation.definition.variable.powershell
$c -is [Type]
#  ^ keyword.operator.comparison.powershell
#       ^ storage.type.powershell
$c -isnot [Type]
#  ^ keyword.operator.comparison.powershell
#          ^ storage.type.powershell
$c -as [Type]
#  ^ keyword.operator.comparison.powershell
#       ^ storage.type.powershell
$k = $y -bor $k
#  ^ keyword.operator.assignment.powershell
#       ^ keyword.operator.bitwise.powershell
$x = $y -band $x
#  ^ keyword.operator.assignment.powershell
#       ^ keyword.operator.bitwise.powershell
$z = -bnot $x
#  ^ keyword.operator.assignment.powershell
#    ^ keyword.operator.bitwise.powershell
$l = 1 -shl 10
#  ^ keyword.operator.assignment.powershell
#    ^      ^^ constant.numeric.integer.powershell
#      ^ keyword.operator.bitwise.powershell
$r = 10 -shr 1
#  ^ keyword.operator.assignment.powershell
#    ^^      ^ constant.numeric.integer.powershell
#       ^ keyword.operator.bitwise.powershell
$k = $y -xor $b
#  ^ keyword.operator.assignment.powershell
#       ^ keyword.operator.logical.powershell
$k = $y -bxor $b
#  ^ keyword.operator.assignment.powershell
#       ^ keyword.operator.bitwise.powershell
$a -icontains $c
#  ^ keyword.operator.comparison.powershell
$a -ccontains $c
#  ^ keyword.operator.comparison.powershell
$a -iNotContains $c
#  ^ keyword.operator.comparison.powershell
$a -cNotContains $c
#  ^ keyword.operator.comparison.powershell
$a -cmatch $c
#  ^ keyword.operator.comparison.powershell
$x -iMatch $c
#  ^ keyword.operator.comparison.powershell
$x -iNotMatch $c
#  ^ keyword.operator.comparison.powershell
$a -iLike $b
#  ^ keyword.operator.comparison.powershell
$b -cLike $c
#  ^ keyword.operator.comparison.powershell
"hey" -cgt "Hey"
#     ^ keyword.operator.comparison.powershell
"Hey" -igt "hey"
#     ^ keyword.operator.comparison.powershell
"hey" -cge "Hey"
#     ^ keyword.operator.comparison.powershell
"Hey" -ige "hey"
#     ^ keyword.operator.comparison.powershell
"HEY" -clt "hey"
#     ^ keyword.operator.comparison.powershell
"HEY" -ilt "hey"
#     ^ keyword.operator.comparison.powershell
"HEY" -cle "hey"
#     ^ keyword.operator.comparison.powershell
"HEY" -ile "hey"
#     ^ keyword.operator.comparison.powershell

# format
    "{0:N2}" -f $a
#   ^^^^^^^^ string.quoted.double.powershell
#            ^ keyword.operator.string-format.powershell
    "{0:D8}" -f $a
#   ^^^^^^^^ string.quoted.double.powershell
#            ^ keyword.operator.string-format.powershell
    "{0:C2}" -f $a
#   ^^^^^^^^ string.quoted.double.powershell
#            ^ keyword.operator.string-format.powershell
    "{0:P0}" -f $a
#   ^^^^^^^^ string.quoted.double.powershell
#            ^ keyword.operator.string-format.powershell
    "{0:X0}" -f $a
#   ^^^^^^^^ string.quoted.double.powershell
#            ^ keyword.operator.string-format.powershell
    (1.11).ToString("#.#")
#   ^              ^ punctuation.section.group.begin.powershell
#    ^^^^ constant.numeric.integer.powershell
#                    ^ string.quoted.double.powershell
    "{1,10} {0,10} {2,10:x}" -f "First", "Second", 255
#   ^          ^        ^ string.quoted.double.powershell
#                            ^ keyword.operator.string-format.powershell
#                                                  ^^^ constant.numeric.integer.powershell
    ("{0,6}" -f 4.99), ("{0,6:##.00}" -f 15.9)
#                                ^ string.quoted.double.powershell
#            ^                        ^ keyword.operator.string-format.powershell
    "{0:R}" -f (1mb/2.0)
#                ^^ keyword.other.powershell
#           ^ keyword.operator.string-format.powershell
    "{0:00.0}" -f 4.12341234
#              ^ keyword.operator.string-format.powershell
    "{0:##.#}" -f 4.12341234
#          ^ string.quoted.double.powershell
#              ^ keyword.operator.string-format.powershell
    "{0:#,#.#}" -f 1234.121234
#         ^ string.quoted.double.powershell
#               ^ keyword.operator.string-format.powershell
    "{0:##,,.000}" -f 1048576
#          ^ string.quoted.double.powershell
#                  ^ keyword.operator.string-format.powershell
    "{this is not a #comment}"
#                   ^ not:comment
    "{0:##.#E000}" -f 2.71828
#           ^ string.quoted.double.powershell
#                  ^ keyword.operator.string-format.powershell
    "{0:#.00'##'}" -f 2.71828
#            ^ string.quoted.double.powershell
#                  ^ keyword.operator.string-format.powershell
    "{0:POS;NEG;ZERO}" -f -14
#              ^ string.quoted.double.powershell
#                      ^ keyword.operator.string-format.powershell
    "{0:$## Please}" -f 14
#         ^ string.quoted.double.powershell
#                    ^ keyword.operator.string-format.powershell
    "{0,-8:P1}" -f 1.75
#       ^ string.quoted.double.powershell
#               ^ keyword.operator.string-format.powershell
    "{0,10:N3}{1,10:N3}{2,10:N3}{3,10:N3}" -f 0.2, 0.3, 0.45, 0.91
#                                          ^ keyword.operator.string-format.powershell
    '{0:00000.000}' -f 7.125
#         ^ string.quoted.single.powershell
#                   ^ keyword.operator.string-format.powershell

# Misc test cases
Test-Function -Class ClassName
#              ^ not:storage.type.powershell
New-Object -TypeName System.Diagnostics.Process
#                                       ^ not:keyword.control.powershell
New-Object -TypeName System.Data
#                           ^ not:keyword.control.powershell
@("any","array","has").foreach({ $_ })
# <- keyword.other.array.begin.powershell
# ^ meta.group.array-expression.powershell
#                      ^ keyword.control.powershell
#                               ^ meta.scriptblock.powershell
@('any','array','has').foreach{ $_ }
# <- keyword.other.array.begin.powershell
# ^ meta.group.array-expression.powershell
#                      ^ keyword.control.powershell
#                               ^ meta.scriptblock.powershell
@("any","array","has").where({ $_.Length -gt 3 })
# <- keyword.other.array.begin.powershell
# ^ meta.group.array-expression.powershell
#                      ^ keyword.control.powershell
#                               ^ meta.scriptblock.powershell
@("any","array","has").where{ $_.Length -gt 3 }
# <- keyword.other.array.begin.powershell
# ^ meta.group.array-expression.powershell
#                      ^ keyword.control.powershell
#                               ^ meta.scriptblock.powershell
$file = join-path $env:SystemDrive "$([System.io.path]::GetRandomFileName()).ps1"
# <- punctuation.definition.variable.powershell
#            ^ support.function.powershell
#                  ^ support.variable.drive.powershell
#                         ^ variable.other.readwrite.powershell
#                                   ^ string.quoted.double.powershell punctuation.definition.variable.powershell
#                                        ^ storage.type.powershell
$ScriptBlock | Out-File $file -Force
# <- punctuation.definition.variable.powershell
#            ^ keyword.operator.other.powershell
#                       ^ punctuation.definition.variable.powershell
#                             ^ keyword.operator.assignment.powershell
workflow w1 {}
# <- storage.type.powershell
#        ^ entity.name.function.powershell
#           ^ punctuation.section.braces.begin.powershell
#            ^ punctuation.section.braces.end.powershell
Workflow work { sequence {} }
# <- storage.type.powershell
#        ^ entity.name.function.powershell
#             ^ punctuation.section.braces.begin.powershell
#               ^^^^^^^^ keyword.control.powershell
#                        ^ punctuation.section.braces.begin.powershell
#                         ^ punctuation.section.braces.end.powershell
#                           ^ punctuation.section.braces.end.powershell
get-thing | Out-WithYou > $null # destroy
# ^          ^ support.function.powershell
#         ^ keyword.operator.other.powershell
#                       ^ keyword.operator.redirection.powershell
#                         ^ punctuation.definition.variable.powershell
#                          ^ constant.language.powershell
#                               ^ punctuation.definition.comment.powershell
"Escaped chars: `", `n, `$, `b, `t, `e, `u{10ffff}, `""
# <- string.quoted.double.powershell
#               ^^  ^^  ^^  ^^  ^^  ^^  ^^^^^^^^^^  ^^ string.quoted.double.powershell constant.character.escape.powershell
'But here they''re not escape chars: `", `n, `$, `b, `"'
#             ^^ constant.character.escape.powershell
#                                    ^^  ^^  ^^  ^^  ^^ not:constant.character.escape.powershell
"When you call a method: $( get-number | %{ invoke-command $( [string]::format("Like (this{0})","what?") ) $var } )"
#                        ^                                                                                 ^ punctuation.definition.variable.powershell
#                                      ^ keyword.operator.other.powershell
#                                                           ^                 ^ meta.group.complex.subexpression.powershell punctuation.section.group.begin.powershell
#                                                                ^ storage.type.powershell
#                                                                                                      ^ ^ meta.group.complex.subexpression.powershell punctuation.section.group.end.powershell
"This is the Debugreference variable: $DebugPreference"
# <- string.quoted.double.powershell
#                                     ^ variable.language.powershell

$ConfirmPreference $DebugPreference $ErrorActionPreference $ErrorView $FormatEnumerationLimit $InformationPreference $LogCommandHealthEvent $LogCommandLifecycleEvent $LogEngineHealthEvent $LogEngineLifecycleEvent $LogProviderHealthEvent $LogProviderLifecycleEvent $MaximumAliasCount $MaximumDriveCount $MaximumErrorCount $MaximumFunctionCount $MaximumHistoryCount $MaximumVariableCount $OFS $OutputEncoding $PSCulture $PSDebugContext $PSDefaultParameterValues $PSEmailServer $PSItem $PSModuleAutoLoadingPreference $PSModuleAutoloadingPreference $PSSenderInfo $PSSessionApplicationName $PSSessionConfigurationName $PSSessionOption $ProgressPreference $VerbosePreference $WarningPreference $WhatIfPreference
# <- variable.language.powershell
#                   ^ variable.language.powershell          ^ variable.language.powershell      ^ variable.language.powershell               ^ variable.language.powershell                  ^ variable.language.powershell                   ^ variable.language.powershell                ^ variable.language.powershell        ^ variable.language.powershell             ^ variable.language.powershell             ^ variable.language.powershell                       ^ variable.language.powershell                        ^ variable.language.powershell               ^ variable.language.powershell                        ^ variable.language.powershell       ^ variable.language.powershell        ^ variable.language.powershell
#                                    ^ variable.language.powershell     ^ variable.language.powershell                 ^ variable.language.powershell                  ^ variable.language.powershell                  ^ variable.language.powershell                    ^ variable.language.powershell        ^ variable.language.powershell           ^ variable.language.powershell             ^ variable.language.powershell  ^ variable.language.powershell                           ^ variable.language.powershell                                        ^ variable.language.powershell               ^ variable.language.powershell
#                                                                                                                                                                                                                                                                                                                                                                                                       ^ variable.language.powershell             ^ variable.language.powershell                   ^ variable.language.powershell                                                                                                                     ^ variable.language.powershell          ^ variable.language.powershell