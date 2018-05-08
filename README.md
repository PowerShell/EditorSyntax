[![Build status](https://ci.appveyor.com/api/projects/status/github/powershell/editorsyntax?branch=master&svg=true)](https://ci.appveyor.com/project/powershell/editorsyntax/branch/master)[![Join the chat at https://gitter.im/PowerShell/EditorSyntax](https://badges.gitter.im/PowerShell/EditorSyntax.svg)](https://gitter.im/PowerShell/EditorSyntax?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# PowerShell Syntax Definition for Editors

This project establishes the central development and maintenance of syntax definition
files for the PowerShell language used by editors that leverage the XML version of the
[TextMate language grammar format](http://manual.macromates.com/en/language_grammars).

Currently this syntax definition is used in the following editors and extensions:

- [Visual Studio Code](https://github.com/Microsoft/vscode) by Microsoft
- [PowerShell Package for Sublime Text](https://github.com/SublimeText/PowerShell) by [Guillermo López-Anglada](https://github.com/guillermooo)
- [language-powershell for Atom](https://github.com/jugglingnutcase/language-powershell) by [James Sconfitto](https://github.com/jugglingnutcase/)

In the future we may find a more common syntax that allows us to generate syntax
definitions for editors that don't leverage the TextMate format.

## Status

We are starting with the current state of the TextMate grammar that is being used in
both VS Code and Sublime Text.  There are a number of existing issues with the grammar
that we need to track down and fix.  Please see [issue #1](https://github.com/PowerShell/EditorSyntax/issues/1)
for more details.

## Build and Import (VS Code)

### Prerequisites

- Node.JS, >= 8.9.1

### Build

1. Navigate via command line to the `./tools/` directory and install dependencies:

    ```
    npm install
    ```

2. Run the `build-grammar` script to generate the json file.

    ```
    npm run build-grammar
    ```

3. The .json file will be generated in `./syntaxes/` at the root of the project. You will need to copy it in to VS Code manually.

    1. Locate the VS Code installation directory and navigate to to `resources/app/extensions/powershell/syntaxes`

    2. Rename `powershell.tmLanguage.json` to `powershell.tmLanguage.json_default`

    3. Copy `powershell.tmLanguage.json` from `./syntaxes/` within the project folder to where you just renamed the file under VS Code's path.

4. If VS Code is already running you will need to run "Reload Window" from the command pallete.

## Contributing

We would love to have community contributions to this project to make PowerShell syntax
highlighting great in as many editors as we can.  Please feel free to file issues or
send pull requests if you'd like to contribute.

## Maintainers

- [Sergei Vorobev](https://github.com/vors) - [@xvorsx](https://twitter.com/xvorsx)
- [Øyvind Kallstad](https://github.com/gravejester) - [@okallstad](https://twitter.com/okallstad)

## License

This extension is [licensed under the MIT License](LICENSE).  Please see the
[third-party notices](Third%20Party%20Notices.txt) file for details on the original
source of the TextMate definition that we use.
