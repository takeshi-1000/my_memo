## swiftfomatをconfigファイルを作成して使用してみる

- swiftformatの設定ファイルは、swiftformatのcliでも設定できそうなコマンドラインオプションをあらかじめ書いておく感じっぽい
- swiftlintで言うところのrulesの出力の仕方が違くて多少アレってなる https://github.com/nicklockwood/SwiftFormat/issues/159#issuecomment-318696395 
  - あらかじめコマンドライン引数をセットしておき、特段メモリ上では管理しないという考え方で、 swiftformat --rules で出力される内容はここの内容と連動しないことに注意

## swiftformat rules, options の違い

> SwiftFormat の設定はrulesとoptionsに分かれています。ルールは、コードに変更を適用する SwiftFormat ライブラリの関数です。オプションは、ルールの動作を制御する設定です。

とのこと

<img width="635" alt="スクリーンショット 2023-02-20 7 47 24" src="https://user-images.githubusercontent.com/16571394/219979932-30840e21-7021-4714-baea-423ce47c4933.png">


