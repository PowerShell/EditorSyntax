var fs               = require('fs');
var yaml             = require('js-yaml');
var plist            = require('plist');
var cson             = require('cson');
var source           = './PowerShellSyntax.YAML-tmLanguage'
var destinationPlist = './grammars/PowerShellSyntax.tmLanguage'
var destinationJson  = './grammars/PowerShellSyntax-JSON-tmLanguage'
var destinationCson  = './grammars/PowerShellSyntax.cson'


var grammarObj   = yaml.safeLoad(fs.readFileSync(source,'utf-8'));
var grammarJson  = JSON.stringify(grammarObj,null,2);
var grammarPlist = plist.build(grammarObj);
var grammarCson  = cson.stringify(grammarObj,null,2);

fs.writeFileSync(destinationPlist,grammarPlist);
fs.writeFileSync(destinationJson,grammarJson);
fs.writeFileSync(destinationCson,grammarCson);
console.log('YAML > Plist conversion done. File saved as ' + destinationPlist);
console.log('YAML > JSON conversion done.  File saved as ' + destinationJson);
console.log('YAML > CSON conversion done.  File saved as ' + destinationCson);