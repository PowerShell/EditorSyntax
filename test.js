var fs            = require('fs');
var Registry      = require('vscode-textmate').Registry;
var yaml          = require('js-yaml');
var referencePath = './referenceFile.yaml';
var testFilePath  = './test.ps1';
var grammarPath   = './grammars/PowerShellSyntax.tmLanguage'
var ruleStack     = null;
var lastElementId = 0;
var passed        = true;

// read reference file
var referenceFile = yaml.safeLoad(fs.readFileSync(referencePath,'utf-8'));
var ref = referenceFile.lines;

// read grammar file
var registry = new Registry();
var grammar = registry.loadGrammarFromPathSync(grammarPath);

// read test script
var fileContents = require('fs').readFileSync(testFilePath).toString();
var lines = fileContents.split(/\r\n|\r|\n/);

// iterate through each line in the test script
for (var i = 0; i < lines.length; i++) {
    var line = lines[i];

    // skip empty lines
    if (line != '') {

        var refLine = ref.filter(function(objRef) {
            return objRef.line == line;
        });

        if (refLine[0] != undefined) {

            // iterate through tokens found in this line
            var lineTokens = grammar.tokenizeLine(line, ruleStack);
            for (var y = 0; y < lineTokens.tokens.length; y++) {
                var token = lineTokens.tokens[y];
                var tokenString = line.substring(token.startIndex,token.endIndex);
                var refToken = refLine[0].tokens[y].token

                // check that a reference is returned for this token
                if (refToken != undefined) {

                    // check that the reference token mathes current token
                    if (tokenString == refToken) {

                        var tokenScopes = token.scopes;
                        var refScopes = refLine[0].tokens[y].scopes;

                        // check that token scopes match the reference scopes
                        if (Array.isArray(tokenScopes)) {
                            checkTokenScopes = tokenScopes.join();
                        }
                        else { checkTokenScopes = tokenScopes }
                        if (Array.isArray(refScopes)) {
                            checkRefScopes = refScopes;
                        }
                        else { checkRefScopes = refScopes }
                        if (checkTokenScopes == checkRefScopes) {
                            //console.log('Everything is OK!');
                        }
                        else {
                            passed = false;
                            console.warn('[' + (i+1) + '] Scope mismatch found: \t');
                            console.warn('    test: \t' + checkTokenScopes);
                            console.warn('    ref:\t' + checkRefScopes);
                        }
                    } else {
                        passed = false;
                        console.warn('[' + (i+1) + '] Token mismatch found!\t"' + tokenString + '" should be "' + refToken + '"');
                    }
                }
            }
            ruleStack = lineTokens.ruleStack;
        }  else {
            passed = false;
            console.warn('[' + (i+1) + '] No reference found for: \t' + line);
        }
    }
}

if (passed) {
    console.log('All tests passed!');
}