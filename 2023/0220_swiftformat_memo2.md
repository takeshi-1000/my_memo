## swiftfomatをconfigファイルを作成して使用してみる

- swiftformatの設定ファイルは、swiftformatのcliでも設定できそうなコマンドラインオプションをあらかじめ書いておく感じっぽい
- swiftlintで言うところのrulesの出力の仕方が違くて多少アレってなる https://github.com/nicklockwood/SwiftFormat/issues/159#issuecomment-318696395 
  - あらかじめコマンドライン引数をセットしておき、特段メモリ上では管理しないという考え方で、 swiftformat --rules で出力される内容はここの内容と連動しないことに注意

## swiftformat rules, options の違い

> SwiftFormat の設定はrulesとoptionsに分かれています。ルールは、コードに変更を適用する SwiftFormat ライブラリの関数です。オプションは、ルールの動作を制御する設定です。

とのこと [参考](https://github.com/nicklockwood/SwiftFormat#configuration:~:text=SwiftFormat%20%E3%81%AE%E8%A8%AD%E5%AE%9A%E3%81%AFrules%E3%81%A8options%E3%81%AB%E5%88%86%E3%81%8B%E3%82%8C%E3%81%A6%E3%81%84%E3%81%BE%E3%81%99%E3%80%82%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%AF%E3%80%81%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AB%E5%A4%89%E6%9B%B4%E3%82%92%E9%81%A9%E7%94%A8%E3%81%99%E3%82%8B%20SwiftFormat%20%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E3%81%AE%E9%96%A2%E6%95%B0%E3%81%A7%E3%81%99%E3%80%82%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AF%E3%80%81%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%AE%E5%8B%95%E4%BD%9C%E3%82%92%E5%88%B6%E5%BE%A1%E3%81%99%E3%82%8B%E8%A8%AD%E5%AE%9A%E3%81%A7%E3%81%99%E3%80%82)

<img width="635" alt="スクリーンショット 2023-02-20 7 47 24" src="https://user-images.githubusercontent.com/16571394/219979932-30840e21-7021-4714-baea-423ce47c4933.png">


