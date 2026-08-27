const fs = require('fs');
const path = require('path');
const vsctm = require('vscode-textmate');
const oniguruma = require('vscode-oniguruma');

const wasmBin = fs.readFileSync(path.join(__dirname, 'node_modules', 'vscode-oniguruma', 'release', 'onig.wasm'));

oniguruma.loadWASM(wasmBin.buffer).then(() => {
    const registry = new vsctm.Registry({
        onigLib: Promise.resolve({
            createOnigScanner(patterns) { return new oniguruma.OnigScanner(patterns); },
            createOnigString(s) { return new oniguruma.OnigString(s); }
        }),
        loadGrammar: async (scopeName) => {
            const grammarPath = path.join(__dirname, 'grammars', 'powershell.tmLanguage.json');
            return vsctm.parseRawGrammar(fs.readFileSync(grammarPath, 'utf8'), grammarPath);
        }
    });

    registry.loadGrammar('source.powershell').then(grammar => {
        const text = fs.readFileSync(path.join(__dirname, 'spec', 'testfiles', 'syntax_test_Function.ps1'), 'utf8');
        const lines = text.split(/\r\n|\n/);
        let ruleStack = vsctm.INITIAL;
        for (let i = lines.length - 15; i < lines.length; i++) {
            const line = lines[i];
            if (!line) continue;
            const lineTokens = grammar.tokenizeLine(line, ruleStack);
            ruleStack = lineTokens.ruleStack;
            
            console.log(`Line ${i + 1}: ${line}`);
            lineTokens.tokens.forEach(token => {
                const tokenText = line.substring(token.startIndex, token.endIndex);
                if (tokenText.trim()) {
                    console.log(`  Token: "${tokenText}"`);
                    console.log(`  Scopes: ${token.scopes.join(', ')}`);
                }
            });
        }
    });
});
