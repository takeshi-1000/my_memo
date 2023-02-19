# nicklockwoodさんのSwiftFormatの続き

## swiftfomatをconfigファイルを作成して使用してみる

- swiftformatの設定ファイルは、swiftformatのcliでも設定できそうなコマンドラインオプションをあらかじめ書いておく感じっぽい
- swiftlintで言うところのrulesの出力の仕方が違くて多少アレってなる https://github.com/nicklockwood/SwiftFormat/issues/159#issuecomment-318696395 
  - あらかじめコマンドライン引数をセットしておき、特段メモリ上では管理しないという考え方で、 swiftformat --rules で出力される内容はコンフィグファイルと連動しないことに注意。確かにcatコマンドで出力すればdisableしているのが何かみたいなことは理解できる

## swiftformat rules, options の違い

> SwiftFormat の設定はrulesとoptionsに分かれています。ルールは、コードに変更を適用する SwiftFormat ライブラリの関数です。オプションは、ルールの動作を制御する設定です。

とのこと [参考](https://github.com/nicklockwood/SwiftFormat#configuration:~:text=SwiftFormat%20%E3%81%AE%E8%A8%AD%E5%AE%9A%E3%81%AFrules%E3%81%A8options%E3%81%AB%E5%88%86%E3%81%8B%E3%82%8C%E3%81%A6%E3%81%84%E3%81%BE%E3%81%99%E3%80%82%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%AF%E3%80%81%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AB%E5%A4%89%E6%9B%B4%E3%82%92%E9%81%A9%E7%94%A8%E3%81%99%E3%82%8B%20SwiftFormat%20%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E3%81%AE%E9%96%A2%E6%95%B0%E3%81%A7%E3%81%99%E3%80%82%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AF%E3%80%81%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%AE%E5%8B%95%E4%BD%9C%E3%82%92%E5%88%B6%E5%BE%A1%E3%81%99%E3%82%8B%E8%A8%AD%E5%AE%9A%E3%81%A7%E3%81%99%E3%80%82)

<img width="635" alt="スクリーンショット 2023-02-20 7 47 24" src="https://user-images.githubusercontent.com/16571394/219979932-30840e21-7021-4714-baea-423ce47c4933.png">

# appleのswift-format調べてみる

- install: https://github.com/takeshi-1000/my_memo/blob/main/log/2023/0220_swift-fomat-install
  - 参考: https://zenn.dev/usk2000/articles/b07d0ac3bc016a#homebrew

```
$ swift-format -h   
OVERVIEW: Format or lint Swift source code

USAGE: swift-format [--version] <subcommand>

OPTIONS:
  -v, --version           Print the version and exit
  -h, --help              Show help information.

SUBCOMMANDS:
  dump-configuration      Dump the default configuration in JSON format to standard output
  format (default)        Format Swift source code
  lint                    Diagnose style issues in Swift source code

  See 'swift-format help <subcommand>' for detailed help.
```

```
$ swift-format dump-configuration
{
  "fileScopedDeclarationPrivacy" : {
    "accessLevel" : "private"
  },
  "indentation" : {
    "spaces" : 2
  },
  "indentConditionalCompilationBlocks" : true,
  "indentSwitchCaseLabels" : false,
  "lineBreakAroundMultilineExpressionChainComponents" : false,
  "lineBreakBeforeControlFlowKeywords" : false,
  "lineBreakBeforeEachArgument" : false,
  "lineBreakBeforeEachGenericRequirement" : false,
  "lineLength" : 100,
  "maximumBlankLines" : 1,
  "prioritizeKeepingFunctionOutputTogether" : false,
  "respectsExistingLineBreaks" : true,
  "rules" : {
    "AllPublicDeclarationsHaveDocumentation" : false,
    "AlwaysUseLowerCamelCase" : true,
    "AmbiguousTrailingClosureOverload" : true,
    "BeginDocumentationCommentWithOneLineSummary" : false,
    "DoNotUseSemicolons" : true,
    "DontRepeatTypeInStaticProperties" : true,
    "FileScopedDeclarationPrivacy" : true,
    "FullyIndirectEnum" : true,
    "GroupNumericLiterals" : true,
    "IdentifiersMustBeASCII" : true,
    "NeverForceUnwrap" : false,
    "NeverUseForceTry" : false,
    "NeverUseImplicitlyUnwrappedOptionals" : false,
    "NoAccessLevelOnExtensionDeclaration" : true,
    "NoBlockComments" : true,
    "NoCasesWithOnlyFallthrough" : true,
    "NoEmptyTrailingClosureParentheses" : true,
    "NoLabelsInCasePatterns" : true,
    "NoLeadingUnderscores" : false,
    "NoParensAroundConditions" : true,
    "NoVoidReturnOnFunctionSignature" : true,
    "OneCasePerLine" : true,
    "OneVariableDeclarationPerLine" : true,
    "OnlyOneTrailingClosureArgument" : true,
    "OrderedImports" : true,
    "ReturnVoidInsteadOfEmptyTuple" : true,
    "UseEarlyExits" : false,
    "UseLetInEveryBoundCaseVariable" : true,
    "UseShorthandTypeNames" : true,
    "UseSingleLinePropertyGetter" : true,
    "UseSynthesizedInitializer" : true,
    "UseTripleSlashForDocumentationComments" : true,
    "UseWhereClausesInForLoops" : false,
    "ValidateDocumentationComments" : false
  },
  "tabWidth" : 8,
  "version" : 1
}
```

```
$ swift-format help format
OVERVIEW: Format Swift source code

When no files are specified, it expects the source from standard input.

USAGE: swift-format format [--in-place] [--configuration <configuration>] [--assume-filename <assume-filename>] [--recursive] [--ignore-unparsable-files] [--parallel] [--color-diagnostics] [--no-color-diagnostics] [<paths> ...]

ARGUMENTS:
  <paths>                 Zero or more input filenames.

OPTIONS:
  -i, --in-place          Overwrite the current file when formatting.
  --configuration <configuration>
                          The path to a JSON file containing the configuration of the linter/formatter.
  --assume-filename <assume-filename>
                          When using standard input, the filename of the source to include in diagnostics.
  -r, --recursive         Recursively run on '.swift' files in any provided directories.
  --ignore-unparsable-files
                          Ignores unparsable files, disabling all diagnostics and formatting for files that contain invalid syntax.
  -p, --parallel          Process files in parallel, simultaneously across multiple cores.
  --color-diagnostics/--no-color-diagnostics
                          Enables or disables color diagnostics when printing to standard error. The default behavior if this flag is omitted is to use colors if standard error
                          is connected to a terminal, and to not use colors otherwise.
  -h, --help              Show help information.

```

```
$ swift-format help lint  
OVERVIEW: Diagnose style issues in Swift source code

When no files are specified, it expects the source from standard input.

USAGE: swift-format lint [--configuration <configuration>] [--assume-filename <assume-filename>] [--recursive] [--ignore-unparsable-files] [--parallel] [--color-diagnostics] [--no-color-diagnostics] [<paths> ...] [--strict]

ARGUMENTS:
  <paths>                 Zero or more input filenames.

OPTIONS:
  --configuration <configuration>
                          The path to a JSON file containing the configuration of the linter/formatter.
  --assume-filename <assume-filename>
                          When using standard input, the filename of the source to include in diagnostics.
  -r, --recursive         Recursively run on '.swift' files in any provided directories.
  --ignore-unparsable-files
                          Ignores unparsable files, disabling all diagnostics and formatting for files that contain invalid syntax.
  -p, --parallel          Process files in parallel, simultaneously across multiple cores.
  --color-diagnostics/--no-color-diagnostics
                          Enables or disables color diagnostics when printing to standard error. The default behavior if this flag is omitted is to use colors if standard error
                          is connected to a terminal, and to not use colors otherwise.
  -s, --strict            Fail on warnings.
  -h, --help              Show help information.
```

`indentation` -> `spaces` を変えてみる例

`swift-format dump-configuration` のデフォルトの `indentation` -> `spaces` がXcodeの設定と連動してない

https://user-images.githubusercontent.com/16571394/219982688-a0ff6a8b-9fc0-4628-9bea-9948d553da24.mov


下記のXcodeの設定と連動させるために4に設定してみる。

<img width="821" alt="スクリーンショット 2023-02-20 8 56 46" src="https://user-images.githubusercontent.com/16571394/219983268-8197ee2e-0a3f-46f0-a22c-0915c44c1820.png">

https://user-images.githubusercontent.com/16571394/219983277-a736bc57-0c58-41bd-bd83-1d6d03fed52b.mov



