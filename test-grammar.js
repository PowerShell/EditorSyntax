const fs = require('fs');
const plist = require('fast-plist');
const grammar = plist.parse(fs.readFileSync('PowerShellSyntax.tmLanguage', 'utf8'));
// well, fast-plist only parses plist. We need a regex engine.
