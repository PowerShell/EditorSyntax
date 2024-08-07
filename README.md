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

### Prerequisites

- Node.JS, >= 8.9.1
- Atom text editor (tests)

### Build (build.ps1)

1. Run `build.ps1` to generate the grammar.

    ```
    PS> .\build.ps1
    ```

2. The .json file will be generated in `./grammars/` at the root of the project.

### Test (build.ps1)

> Requires the Atom text editor be installed.

1. Run `.\build.ps1` with `-Test`. Which will build the grammar file and run all of the specs.

    ```
    PS> .\build.ps1 -Test
    ```

### Build (npm)

1. Use `npm` to install dependencies:

    ```
    npm install
    ```

2. Run the `build-grammar` script to generate the json file.

    ```
    npm run build-grammar
    ```

3. The .json file will be generated in `./grammars/` at the root of the project.

### Test (Atom cli)

1. Build the grammar file using the above steps.

3. Use the Atom cli command for your os (atom.cmd or atom.sh) to run the tests from the root of the EditorSystax project folder.

    ```
    atom --test spec
    ```

## Contributing

We would love to have community contributions to this project to make PowerShell syntax
highlighting great in as many editors as we can.  Please feel free to file issues or
send pull requests if you'd like to contribute.

## Maintainers

- [Andy Jordan](https://github.com/andyleejordan)
- [Nick James](https://github.com/omniomi)

## License

This extension is [licensed under the MIT License](LICENSE). Please see the
[third-party notices](Third%20Party%20Notices.txt) file for details on the original
source of the TextMate definition that we use.

## Code of Conduct

Please see our [Code of Conduct](.github/CODE_OF_CONDUCT.md) before participating in this project.

## Security Policy

For any security issues, please see our [Security Policy](.github/SECURITY.md).
