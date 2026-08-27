const fs = require('fs');
const path = require('path');
const vsctm = require('vscode-textmate');
const oniguruma = require('vscode-oniguruma');

const wasmBin = fs.readFileSync(path.join(__dirname, 'node_modules', 'vscode-oniguruma', 'release', 'onig.wasm'));

const vscodeOnigurumaLib = oniguruma.loadWASM(wasmBin.buffer).then(() => {
    return {
        createOnigScanner(patterns) { return new oniguruma.OnigScanner(patterns); },
        createOnigString(s) { return new oniguruma.OnigString(s); }
    };
});

const registry = new vsctm.Registry({
    onigLib: vscodeOnigurumaLib,
    loadGrammar: async (scopeName) => {
        if (scopeName === 'source.powershell') {
            const grammarPath = path.join(__dirname, 'grammars', 'powershell.tmLanguage.json');
            const grammarContent = fs.readFileSync(grammarPath, 'utf8');
            return vsctm.parseRawGrammar(grammarContent, grammarPath);
        }
        return null;
    }
});

registry.loadGrammar('source.powershell').then(grammar => {
    const text = fs.readFileSync(path.join(__dirname, 'spec', 'testfiles', 'syntax_test_Function.ps1'), 'utf8');
    const lines = text.split(/\r\n|\n/);
    let ruleStack = vsctm.INITIAL;
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        const lineTokens = grammar.tokenizeLine(line, ruleStack);
        ruleStack = lineTokens.ruleStack;
        
        if (line.includes('Clean')) {
            console.log(`Line ${i + 1}: ${line}`);
            lineTokens.tokens.forEach(token => {
                const tokenText = line.substring(token.startIndex, token.endIndex);
                if (tokenText.trim()) {
                    console.log(`  Token: "${tokenText}"`);
                    console.log(`  Scopes: ${token.scopes.join(', ')}`);
                }
            });
        }
    }
});
