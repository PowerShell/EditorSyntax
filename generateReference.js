var fs            = require('fs');
var Registry      = require('vscode-textmate').Registry;
var yaml          = require('js-yaml');
var registry      = new Registry();
var ruleStack     = null;
var lastElementId = 0;
var grammarPath   = './grammars/PowerShellSyntax.tmLanguage'
var referencePath = './referenceFile.yaml'
var testFilePath  = './test.ps1';

// read grammar file
var registry = new Registry();
var grammar = registry.loadGrammarFromPathSync(grammarPath);

// read test script
var fileContents = require('fs').readFileSync(testFilePath).toString();
var lines = fileContents.split(/\r\n|\r|\n/);

var ref = {"lines":[]};

// iterate through each line in the test script
for (var i = 0; i < lines.length; i++) {
    var line = lines[i];

    // skip empty lines
    if (line != '') {
        var tokens = [];
        var lineTokens = grammar.tokenizeLine(line, ruleStack);
        for (var y = 0; y < lineTokens.tokens.length; y++) {
            var token = lineTokens.tokens[y];
            var tokenString = line.substring(token.startIndex,token.endIndex);
            var scopes = token.scopes;
            tokens.push({"token":tokenString,"scopes":scopes});
        }
        ref.lines.push({"line":line,"tokens":tokens});
        ruleStack = lineTokens.ruleStack;
    }
}

var refYaml = yaml.dump(ref);
fs.writeFileSync(referencePath,refYaml);
console.log("Reference file created!");