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

# ------------------------------- Basic -------------------------------

# Comments
singleLineComment = 'comment.line.powershell'
commentDocSection = 'comment.block.documentation.powershell'
commentDocKeyword = 'keyword.operator.documentation.powershell'

# ---------------------------- Meta Scopes ----------------------------

# Comments
metaCommentBlock = 'comment.block.powershell'

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

  # Directly test comments as comment tokens are used for atom-grammar-test
  describe 'Comments', ->
    it 'tokenizes single line comments correctly.', ->
      {tokens} = grammar.tokenizeLine '# This is a comment.'

      expect(tokens[0]).toEqual value: '#', scopes: [docScope, singleLineComment, singleLineCommentOpen]
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

      expect(lines[0][0]).toEqual value: '<#', scopes: [docScope, metaCommentBlock, commentBlockOpen]
      expect(lines[1][0]).toEqual value: '   This is a comment block', scopes: [docScope, metaCommentBlock]
      expect(lines[2][0]).toEqual value: '#>', scopes: [docScope, metaCommentBlock, commentBlockClose]
      expect(lines[3][0]).toEqual value: '<#', scopes: [docScope, metaCommentBlock, commentBlockOpen]
      expect(lines[4][0]).toEqual value: '# This is still a comment block', scopes: [docScope, metaCommentBlock]
      expect(lines[5][0]).toEqual value: '#>', scopes: [docScope, metaCommentBlock, commentBlockClose]

  describe 'Automated tests', ->
    describe 'syntax_test_Function.ps1', ->
      grammarTest path.join(__dirname, 'testfiles/syntax_test_Function.ps1')
    describe 'syntax_test_Class.ps1', ->
      grammarTest path.join(__dirname, 'testfiles/syntax_test_Class.ps1')
    describe 'syntax_test_TheBigTestFile.ps1', ->
      grammarTest path.join(__dirname, 'testfiles/syntax_test_TheBigTestFile.ps1')
