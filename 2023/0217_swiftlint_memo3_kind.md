# swiftlint rules で表示される `kind` について深ぼってみる

## 一次ソース

https://github.com/realm/SwiftLint/blob/e0f23fa8e9dc784ac5c0d8aa641949c4d972ad66/Source/SwiftLintFramework/Models/RuleKind.swift
<br>https://realm.github.io/SwiftLint/Enums/RuleKind.html

- kind
  - `style`: Describes rules that validate stylistic choices.(文体の選択を検証するルールを記述しています。)
  - `lint`: Describes rules that validate Swift source conventions. (Swiftのソース規約を検証するルールを記述しています。)
  - `idiomatic`: Describes rules that validate common practices in the Swift community.(Swiftコミュニティにおける一般的な慣習を検証するためのルールを記述します。)
  - `metrics`: Describes rules that validate magnitudes or measurements of Swift source.(Swiftソースのマグニチュードや測定値を検証するルールを記述します。)
  - `performance`: Describes rules that validate that code patterns with poor performance are avoided.(性能の悪いコードパターンを回避することを検証するルールを記述する。)


## 色々調べてみる

### (1)styleの例

#### `closing_blace`

https://github.com/realm/SwiftLint/blob/325d0ee1e44a87fc82afeb874b83ceb82f6728cf/Source/SwiftLintFramework/Rules/Style/ClosingBraceRule.swift#L11

`Closing brace with closing parenthesis should not have any whitespaces in the middle`
<br>閉じ括弧と閉じ括弧は、途中に空白があってはいけません。

<img width="1017" alt="スクリーンショット 2023-02-17 8 28 11" src="https://user-images.githubusercontent.com/16571394/219511061-c2e996ac-0f8b-424b-afc2-a282905faae6.png">

#### `closure_end_indentation`

https://github.com/realm/SwiftLint/blob/74dbd52adda90eee0313654d876fdf88c8325552/Source/SwiftLintFramework/Rules/Style/ClosureEndIndentationRule.swift#L12

`Closure end should have the same indentation as the line that started it.`
<br>クロージャーの終わりは、それを開始した行と同じインデントでなければなりません。

closure_end_indentationは初期状態で、opt-in true かつ enable_config false なので、下記のように.swiftlint.ymlを書き換える必要があります

```
opt_in_rules:
  - closure_end_indentation
```

<img width="1053" alt="スクリーンショット 2023-02-17 8 42 56" src="https://user-images.githubusercontent.com/16571394/219513000-092a444e-cba2-410e-8f9b-3b7307a5a1fc.png">

https://realm.github.io/SwiftLint/closure_end_indentation.html にサンプルある

### (2)lintの例

※　https://realm.github.io/SwiftLint のサンプル見ればわかりそうなものがあったことに気付いたので、それで賄えるものはそれで賄ってます

#### `anyobject_protocol`

https://realm.github.io/SwiftLint/anyobject_protocol.html

#### `array_init`

https://realm.github.io/SwiftLint/array_init.html

### (3)idiomaticの例

#### `anonymous_argument_in_multiline_closure`

https://realm.github.io/SwiftLint/anonymous_argument_in_multiline_closure.html

<img width="493" alt="スクリーンショット 2023-02-17 8 58 47" src="https://user-images.githubusercontent.com/16571394/219514900-33a1b11e-29b8-4dbe-bb86-b2efe6264d77.png">

2行目にクロージャの引数を持ってくる場合には、引数名を明示する方が好むらしい

#### `duplicate_imports`

https://realm.github.io/SwiftLint/duplicate_imports.html

これはなんでコンパイルエラーにならないんだろう

### (4)metricsの例

#### `enum_case_associated_values_count`

https://realm.github.io/SwiftLint/enum_case_associated_values_count.html

enumの引数の数は多すぎてはダメ

#### `file_length`

fileの行数を少なくしよう

https://realm.github.io/SwiftLint/file_length.html
