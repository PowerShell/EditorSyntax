# SYNTAX TEST "source.powershell"
using module Microsoft.PowerShell.Management
# <- keyword.control.using.powershell
#     ^ keyword.other.powershell
#            ^ variable.parameter.powershell

<#
# <- punctuation.definition.comment.block.begin.powershell
    .Synopsis
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        Short description
    .DESCRIPTION
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        Long description
    .EXAMPLE
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        Example of how to use this cmdlet
    .EXAMPLE
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        Another example of how to use this cmdlet
    .INPUTS
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        Inputs to this cmdlet (if any)
    .OUTPUTS
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        Output from this cmdlet (if any)
    .NOTES
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        General notes
    .COMPONENT
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        The component this cmdlet belongs to
    .ROLE
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        The role this cmdlet belongs to
    .FUNCTIONALITY
    # <- constant.string.documentation.powershell
    # ^ keyword.operator.documentation.powershell
        The functionality that best describes this cmdlet

    This should not be considered documentaton -> .role
                                                  # ^ not:keyword.operator.documentation.powershell
#>
# <- punctuation.definition.comment.block.end.powershell
function Verb-Noun {
# <- meta.function storage.type
#        ^ meta.function entity.name.function.powershell
    [CmdletBinding(DefaultParameterSetName  = 'Parameter Set 1',
    # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
    # ^ meta.attribute.powershell support.function.attribute.powershell
    #             ^ meta.attribute.powershell punctuation.section.group.begin.powershell
    #              ^ meta.attribute.powershell variable.parameter.attribute.powershell
    #                                       ^ meta.attribute.powershell keyword.operator.assignment.powershell
    #                                         ^ meta.attribute.powershell string.quoted.single.powershell
                   SupportsShouldProcess    = $true,
                #  ^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
                #                           ^ meta.attribute.powershell keyword.operator.assignment.powershell
                #                             ^ meta.attribute.powershell punctuation.definition.variable.powershell
                #                              ^^^^ meta.attribute.powershell constant.language.powershell
                   PositionalBinding        = $false,
                #  ^^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
                #                           ^ meta.attribute.powershell keyword.operator.assignment.powershell
                #                             ^ meta.attribute.powershell punctuation.definition.variable.powershell
                #                              ^^^^^ meta.attribute.powershell constant.language.powershell
                   HelpUri                  = 'http://www.microsoft.com/',
                #  ^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
                #                           ^ meta.attribute.powershell keyword.operator.assignment.powershell
                #                              ^ meta.attribute.powershell string.quoted.single.powershell
                   ConfirmImpact            = 'Medium')]
                #  ^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
                #                           ^ meta.attribute.powershell keyword.operator.assignment.powershell
                #                              ^ meta.attribute.powershell string.quoted.single.powershell
                #                                     ^ meta.attribute.powershell punctuation.section.group.end.powershell
                #                                      ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
    [Alias()]
    # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
    # ^ meta.attribute.powershell support.function.attribute.powershell
    #     ^ meta.attribute.powershell punctuation.section.group.begin.powershell
    #      ^ meta.attribute.powershell punctuation.section.group.end.powershell
    #       ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
    [OutputType([String])]
    # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
    # ^ meta.attribute.powershell support.function.attribute.powershell
    #          ^ meta.attribute.powershell punctuation.section.group.begin.powershell
    #           ^ meta.attribute.powershell punctuation.section.bracket.begin.powershell
    #            ^^^^^^ meta.attribute.powershell storage.type.powershell
    #                  ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
    #                   ^ meta.attribute.powershell punctuation.section.group.end.powershell
    #                    ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
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
        $Param1,
        # <- punctuation.definition.variable.powershell
        # ^ variable.other.readwrite.powershell
        #      ^ keyword.operator.other.powershell

        # Param2 help description
        # <- comment.line.powershell punctuation.definition.comment.powershell
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
        [Parameter(ParameterSetName='Parameter Set 1')]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #         ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #          ^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                          ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                           ^^^^^^^^^^^^^^^^^ meta.attribute.powershell string.quoted.single.powershell
        #                                            ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                                             ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [AllowNull()]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #         ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #          ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #           ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [AllowEmptyCollection()]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #                    ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #                     ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                      ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [AllowEmptyString()]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #                ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #                 ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                  ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateScript({$true})]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #              ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #               ^ meta.scriptblock.powershell meta.attribute.powershell
        #                ^ meta.attribute.powershell punctuation.definition.variable.powershell
        #                 ^^^^ meta.scriptblock.powershell constant.language.powershell
        #                     ^ meta.scriptblock.powershell meta.attribute.powershell
        #                      ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                       ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateRange(0,5)]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #             ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #              ^ meta.attribute.powershell constant.numeric.integer.powershell
        #               ^ meta.attribute.powershell keyword.operator.other.powershell
        #                ^ meta.attribute.powershell constant.numeric.integer.powershell
        #                 ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                  ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [int32]
        # <- punctuation.section.bracket.begin.powershell
        # ^ storage.type.powershell
        #     ^ punctuation.section.bracket.end.powershell
        $Param2,
        # <- punctuation.definition.variable.powershell
        # ^ variable.other.readwrite.powershell
        #      ^ keyword.operator.other.powershell

        # Param3 help description
        # <- comment.line.powershell punctuation.definition.comment.powershell
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
        [Parameter(ParameterSetName='Another Parameter Set')]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #         ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #          ^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                          ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                           ^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell string.quoted.single.powershell
        #                                                  ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                                                   ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidatePattern("[a-z]*")]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #               ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #                ^^^^^^^^ meta.attribute.powershell string.quoted.double.powershell
        #                        ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                         ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateLength(0,15)]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #              ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #               ^ meta.attribute.powershell constant.numeric.integer.powershell
        #                ^ meta.attribute.powershell keyword.operator.other.powershell
        #                 ^^ meta.attribute.powershell constant.numeric.integer.powershell
        #                   ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                    ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [String]
        # <- punctuation.section.bracket.begin.powershell
        # ^ storage.type.powershell
        #      ^ punctuation.section.bracket.end.powershell
        $Param3,
        # <- punctuation.definition.variable.powershell
        # ^ variable.other.readwrite.powershell
        #      ^ keyword.operator.other.powershell

        # Param4 help description
        # <- comment.line.powershell punctuation.definition.comment.powershell
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
        [Parameter(ParameterSetName='Parameter Set 1')]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #         ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #          ^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                          ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                           ^^^^^^^^^^^^^^^^^ meta.attribute.powershell string.quoted.single.powershell
        #                                            ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                                             ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidateScript({Test-Path $_})] #Make sure cmdlets don't break highlighting
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #              ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #               ^ meta.attribute.powershell meta.scriptblock.powershell
        #                ^^^^^^^^^ meta.scriptblock.powershell support.function.powershell
        #                          ^ meta.scriptblock.powershell punctuation.definition.variable.powershell
        #                           ^ meta.scriptblock.powershell support.variable.automatic.powershell
        #                            ^ meta.attribute.powershell meta.scriptblock.powershell
        #                             ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                              ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [string]
        # <- punctuation.section.bracket.begin.powershell
        # ^ storage.type.powershell
        #      ^ punctuation.section.bracket.end.powershell
        $Param4,
        # <- punctuation.definition.variable.powershell
        # ^ variable.other.readwrite.powershell
        #      ^ keyword.operator.other.powershell

        # Param5 help description
        # <- comment.line.powershell punctuation.definition.comment.powershell
        # ^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
        [Parameter(ParameterSetName='Parameter Set 1')]
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #         ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #          ^^^^^^^^^^^^^^^^ meta.attribute.powershell variable.parameter.attribute.powershell
        #                          ^ meta.attribute.powershell keyword.operator.assignment.powershell
        #                           ^^^^^^^^^^^^^^^^^ meta.attribute.powershell string.quoted.single.powershell
        #                                            ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                                             ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        [ValidatePattern('(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)')] # this regex shouldn't break highlighting
        # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
        # ^ meta.attribute.powershell support.function.attribute.powershell
        #               ^ meta.attribute.powershell punctuation.section.group.begin.powershell
        #                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.attribute.powershell string.quoted.single.powershell
        #                                                                                         ^ meta.attribute.powershell punctuation.section.group.end.powershell
        #                                                                                          ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
        #                                                                                            ^ comment.line.powershell punctuation.definition.comment.powershell
        #                                                                                             ^ comment.line.powershell
        [string]
        # <- punctuation.section.bracket.begin.powershell
        # ^ storage.type.powershell
        #      ^ punctuation.section.bracket.end.powershell
        $Param5
        # <- punctuation.definition.variable.powershell
        # ^ variable.other.readwrite.powershell
        )
        # <- punctuation.section.group.end.powershell

    Begin
    # <- keyword.control.powershell
    {
    }
    Process {
    # <- keyword.control.powershell
        if ($pscmdlet.ShouldProcess("Target", "Operation")) {
        # <- keyword.control.powershell
        #  ^ punctuation.section.group.begin.powershell
        #   ^ punctuation.definition.variable.powershell
        #    ^^^^^^^^ support.variable.automatic.powershell
        #             ^^^^^^^^^^^^^ variable.other.member.powershell
        #                          ^ punctuation.section.group.begin.powershell
        #                                                ^ punctuation.section.group.end.powershell
        #                                                 ^ punctuation.section.group.end.powershell
        }
    }
    End {
    # <- keyword.control.powershell

    }
}
