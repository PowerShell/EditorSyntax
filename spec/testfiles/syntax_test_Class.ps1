# SYNTAX TEST "source.powershell"
using namespace system.management.automation
# <- keyword.control.using.powershell
#     ^ keyword.other.powershell
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.parameter.powershell

# Define a class
class TypeName
# <- storage.type.powershell
#     ^ entity.name.function
{
    # Property with validate set
    # <- punctuation.definition.comment.powershell
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
    [ValidateSet("val1", "Val2")]
    # <- meta.attribute.powershell punctuation.section.bracket.begin.powershell
    # ^ meta.attribute.powershell support.function.attribute.powershell
    #           ^ meta.attribute.powershell punctuation.section.group.begin.powershell
    #            ^^^^^^ meta.attribute.powershell string.quoted.double.powershell
    #                  ^ meta.attribute.powershell keyword.operator.other.powershell
    #                    ^^^^^^ meta.attribute.powershell string.quoted.double.powershell
    #                          ^ meta.attribute.powershell punctuation.section.group.end.powershell
    #                           ^ meta.attribute.powershell punctuation.section.bracket.end.powershell
    [string] $P1
    # <- punctuation.section.bracket.begin.powershell
    # ^ storage.type.powershell
    #      ^ punctuation.section.bracket.end.powershell
    #        ^ punctuation.definition.variable.powershell
    #         ^^ variable.other.readwrite.powershell

    # Static property
    # <- punctuation.definition.comment.powershell
    # ^^^^^^^^^^^^^^^ comment.line.powershell
    static [hashtable] $P2
    # <- storage.modifier.powershell
    #      ^ punctuation.section.bracket.begin.powershell
    #       ^ storage.type.powershell
    #                ^ punctuation.section.bracket.end.powershell
    #                  ^ punctuation.definition.variable.powershell
    #                   ^^ variable.other.readwrite.powershell

    # Hidden property does not show as result of Get-Member
    # <- punctuation.definition.comment.powershell
    # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.powershell
    hidden [int] $P3
    # <- storage.modifier.powershell
    #      ^ punctuation.section.bracket.begin.powershell
    #       ^ storage.type.powershell
    #          ^ punctuation.section.bracket.end.powershell
    #            ^ punctuation.definition.variable.powershell
    #             ^^ variable.other.readwrite.powershell

    # Constructor
    # <- punctuation.definition.comment.powershell
    # ^^^^^^^^^^^ comment.line.powershell
    TypeName ([string] $s) {
        #    ^ punctuation.section.group.begin.powershell
        #     ^ punctuation.section.bracket.begin.powershell
        #      ^^^^^^ storage.type.powershell
        #            ^ punctuation.section.bracket.end.powershell
        #              ^ punctuation.definition.variable.powershell
        #               ^ variable.other.readwrite.powershell
        #                ^ punctuation.section.group.end.powershell
        $this.P1 = $s
        # <- punctuation.definition.variable.powershell
        # ^ support.variable.automatic.powershell
        #     ^^ variable.other.member.powershell
        #        ^ keyword.operator.assignment.powershell
        #          ^ punctuation.definition.variable.powershell
        #           ^ variable.other.readwrite.powershell
    }

    # Static method
    # <- punctuation.definition.comment.powershell
    # ^^^^^^^^^^^^^ comment.line.powershell
    static [void] MemberMethod1([hashtable] $h) {
    # <- storage.modifier.powershell
    #      ^ punctuation.section.bracket.begin.powershell
    #       ^^^^ storage.type.powershell
    #           ^ punctuation.section.bracket.end.powershell
    #                          ^ punctuation.section.group.begin.powershell
    #                           ^ punctuation.section.bracket.begin.powershell
    #                            ^^^^^^^^^ storage.type.powershell
    #                                     ^ punctuation.section.bracket.end.powershell
    #                                       ^ punctuation.definition.variable.powershell
    #                                        ^ variable.other.readwrite.powershell
    #                                         ^ punctuation.section.group.end.powershell
        [TypeName]::P2 = $h
        # <- punctuation.section.bracket.begin.powershell
        # ^ storage.type.powershell
        #        ^ punctuation.section.bracket.end.powershell
        #              ^ keyword.operator.assignment.powershell
        #                ^ punctuation.definition.variable.powershell
        #                 ^ variable.other.readwrite.powershell
    }

    # Instance method
    # <- punctuation.definition.comment.powershell
    # ^^^^^^^^^^^^^^^ comment.line.powershell
    [int] MemberMethod2([int] $i) {
    # <- punctuation.section.bracket.begin.powershell
    # ^ storage.type.powershell
    #   ^ punctuation.section.bracket.end.powershell
    #                  ^ punctuation.section.group.begin.powershell
    #                   ^ punctuation.section.bracket.begin.powershell
    #                    ^^^ storage.type.powershell
    #                       ^ punctuation.section.bracket.end.powershell
    #                         ^ punctuation.definition.variable.powershell
    #                          ^ variable.other.readwrite.powershell
    #                           ^ punctuation.section.group.end.powershell
        $this.P3 = $i
        # <- punctuation.definition.variable.powershell
        # ^ support.variable.automatic.powershell
        #     ^^ variable.other.member.powershell
        #        ^ keyword.operator.assignment.powershell
        #          ^ punctuation.definition.variable.powershell
        #           ^ variable.other.readwrite.powershell
        return $this.P3
        # <- keyword.control.powershell
        #      ^ punctuation.definition.variable.powershell
        #       ^^^^ support.variable.automatic.powershell
        #            ^^ variable.other.member.powershell
    }
}
