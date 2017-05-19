[![Join the chat at https://gitter.im/PowerShell/EditorSyntax](https://badges.gitter.im/PowerShell/EditorSyntax.svg)](https://gitter.im/PowerShell/EditorSyntax?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

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

## Contributing

We would love to have community contributions to this project to make PowerShell syntax
highlighting great in as many editors as we can.  Please feel free to file issues or
send pull requests if you'd like to contribute.

## Maintainers

- [David Wilson](https://github.com/daviwil) - [@daviwil](http://twitter.com/daviwil)
- [Sergei Vorobev](https://github.com/vors) - [@xvorsx](https://twitter.com/xvorsx)
- [Øyvind Kallstad](https://github.com/gravejester) - [@okallstad](https://twitter.com/okallstad)

## License

This extension is [licensed under the MIT License](LICENSE).  Please see the
[third-party notices](Third%20Party%20Notices.txt) file for details on the original
source of the TextMate definition that we use.
