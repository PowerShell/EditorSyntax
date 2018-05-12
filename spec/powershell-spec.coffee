grammarTest = require 'atom-grammar-test'
path        = require 'path'

#######################################################################
#                                Scopes
#######################################################################
#
# When modifying or adding scopes do so using the variables below. Tests
# should use the variables and not strings to avoid duplication of work and errors.
#
# If a symbol or construct has different scopes under different conditions make
# sure it makes sense like @ defining a splat and @ defining a hashtable. Otherwise
# aim for consistency as much as possible.
#
# - Scope naming: https://www.sublimetext.com/docs/3/scope_naming.html
# - Language specific: All scopes should end with '.powershell'.
# - Exceptions: when an exception is made for cosmetic or consistency reasons
#     leave a comment above the scope with the reasoning.
#
# This file should be used as a reference when working on the 'examples\'. When you
# change a scope make sure you check the example files for any occurances.

# ------------------------------- Setup -------------------------------

atomPackage = 'EditorSyntax'
docScope    = 'source.powershell'

# -------------------------- Tokens / Symbols -------------------------

# Comments
singleLineCommentOpen = 'punctuation.definition.comment.powershell'             # #
commentBlockOpen      = 'punctuation.definition.comment.block.begin.powershell' # <#
commentBlockClose     = 'punctuation.definition.comment.block.end.powershell'   # #>

# Strings
doubleQuote                = '' # "
doubleQuoteHereStringOpen  = '' # @"
doubleQuoteHereStringClose = '' # "@
singleQuote                = '' # '
singleQuoteHereStringOpen  = '' # @'
singleQuoteHereStringClose = '' # '@

# Variables
# ..This should be punctuation.definition.variable.powershell but too many themes
# ..do not define it. This makes it inherit from whatever the parent scope is.
variableToken = 'keyword.other.variable.definition.powershell' # $, @
variableColon = 'support.variable.drive.powershell'            # :

# Sections
braceOpen    = 'punctuation.section.block.begin.powershell'   # {
braceClose   = 'punctuation.section.block.end.powershell'     # }
bracketOpen  = 'punctuation.section.bracket.begin.powershell' # [
bracketClose = 'punctuation.section.bracket.end.powershell'   # ]
parensOpen   = 'punctuation.section.group.begin.powershell'   # (
parensClose  = 'punctuation.section.group.end.powershell'     # )

# Other
range          = 'keyword.operator.range.powershell'        # ..
assignment     = 'keyword.operator.assignment.powershell'   # =
hashTableToken = 'keyword.other.hashtable.begin.powershell' # @

# ------------------------------- Basic -------------------------------

# Comments
singleLineComment = 'comment.line.powershell'
commentBlock      = 'comment.block.powershell'
commentDocSection = 'comment.block.documentation.powershell'
commentDocKeyword = 'keyword.operator.documentation.powershell'

# Strings - simple

# Strings - complex

# Strings - here strings

# Variables
variableAutomatic  = ''
variableConstant   = ''
variableName       = ''
variablePreference = ''
variableProperty   = ''
variableScope      = ''

# -------------------------- Numbers and Math -------------------------

# ----------------------------- Functions -----------------------------

# ----------------------------- Constructs ----------------------------

# ---------------------------- Meta Scopes ----------------------------

#######################################################################
#                                 Tests
#######################################################################

describe 'PowerShell Grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage atomPackage,

    runs ->
      grammar = atom.grammars.grammarForScopeName(docScope)

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe docScope

  describe 'Comments', ->
    it 'tokenizes single line comments correctly.', ->
      {tokens} = grammar.tokenizeLine '# This is a comment.'

      expect(tokens[0]).toEqual value: '#', scopes: [docScope, singleLineCommentOpen]
      expect(tokens[1]).toEqual value: ' This is a comment.', scopes: [docScope, singleLineComment]

    it 'tokenizes comment blocks correctly.', ->
      lines = grammar.tokenizeLines '''
        <#
           This is a comment block
        #>
        <#
        # This is still a comment block
        #>
      '''

      expect(lines[0][0]).toEqual value: '<#', scopes: [docScope, commentBlock, commentBlockOpen]
      expect(lines[1][0]).toEqual value: '   This is a comment block', scopes: [docScope, commentBlock]
      expect(lines[2][0]).toEqual value: '#>', scopes: [docScope, commentBlock, commentBlockClose]
      expect(lines[3][0]).toEqual value: '<#', scopes: [docScope, commentBlock, commentBlockOpen]
      expect(lines[4][0]).toEqual value: '# This is still a comment block', scopes: [docScope, commentBlock]
      expect(lines[5][0]).toEqual value: '#>', scopes: [docScope, commentBlock, commentBlockClose]

  describe 'Automated tests', ->
    # grammarTest path.join(__dirname, 'examples/syntax_test_advancedFunctions.ps1')
    # grammarTest path.join(__dirname, 'examples/syntax_test_classes.ps1')
    # grammarTest path.join(__dirname, 'examples/syntax_test_file1.ps1')
    # grammarTest path.join(__dirname, 'examples/syntax_test_file2.ps1')
    # grammarTest path.join(__dirname, 'examples/syntax_test_TheBigFile.ps1')