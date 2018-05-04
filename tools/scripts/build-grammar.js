/*---------------------------------------------------------------------------------------------
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *
 *  Modified for PowerShell\EditorSyntax from Microsoft\vscode (update-grammar.js)
 *    This script generates the JSON file using the same tools as vscode's build.
 *--------------------------------------------------------------------------------------------*/

 'use strict';

var path = require('path');
var fs = require('fs');
var plist = require('fast-plist');

exports.update = function (tmlPath, dest) {
    console.log('... Reading source file.');
    var content = fs.readFileSync(tmlPath).toString();

    console.log('... Parsing content.');
    var grammar;
	grammar = plist.parse(content);

    console.log('... Building contents.');
    let result = {
        information_for_contributors: [
            'This file has been converted from source and may not be in line with the official build.',
            'The current master branch for this syntax can be found here: https://github.com/PowerShell/EditorSyntax',
            'If you want to provide a fix or improvement, please create a pull request against the original repository.'
        ]
    };

    result.version = require('child_process')
        .execSync('git rev-parse HEAD')
        .toString().trim()

    let keys = ['name', 'scopeName', 'comment', 'injections', 'patterns', 'repository'];
    for (let key of keys) {
        if (grammar.hasOwnProperty(key)) {
            result[key] = grammar[key];
        }
    }

    var dirname = path.dirname(dest);
    if (!fs.existsSync(dirname)) {
        console.log('... Creating directory: ' + dirname);
        fs.mkdirSync(dirname);
    }

    fs.writeFileSync(dest, JSON.stringify(result, null, '\t'));
    console.log('[Finished] File written to: ' + dest);
};

if (path.basename(process.argv[1]) === 'build-grammar.js') {
    console.log('[Starting] Converting ' + process.argv[2] + ' to json.');
    exports.update(process.argv[2], process.argv[3]);
}
