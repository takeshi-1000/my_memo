swiftのソースコードを書く際に、パース処理に失敗した場合でも、意味解析に失敗した場合でも、
XcodeIDE上では、どちらもコンパイラのエラーであることに変わりはないし、どのフェーズで失敗したかをGUIやCLIなどの、Swift言語を使う側のエンジニアが気にすることはない。

### パース

パース処理に失敗した場合のエラーは下記あたりに定義されている
https://github.com/apple/swift/blob/bf84d8dfe0df272b32c9a9c17d9d47c4f844440c/include/swift/AST/DiagnosticsParse.def

(例)
`expected_rparen_expr_list` 
https://github.com/apple/swift/blob/7ce977832befb6b17bfdb4b242b118403de870b9/include/swift/AST/DiagnosticsParse.def#L1321

<img width="960" alt="スクリーンショット 2022-12-14 13 56 21" src="https://user-images.githubusercontent.com/16571394/207509469-858e20cd-8118-45c7-9d21-14198788c724.png">

### 意味解析

意味解析に失敗した場合のエラーは下記あたりに定義されている
https://github.com/apple/swift/blob/05443c442e94fe709131011fe23bc69fe3fe47b8/include/swift/AST/DiagnosticsSema.def

(例)
`type_of_expression_is_ambiguous`
https://github.com/apple/swift/blob/05443c442e94fe709131011fe23bc69fe3fe47b8/include/swift/AST/DiagnosticsSema.def#L3851

<img width="943" alt="スクリーンショット 2022-12-14 13 51 42" src="https://user-images.githubusercontent.com/16571394/207509291-1081c7ec-83da-437d-bedc-30033bf99f42.png">
