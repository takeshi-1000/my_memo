ローカルでビルドしたswiftコンパイラ(swiftc)を、任意のXcodeプロジェクトのコンパイラとして使うには、下記を参考にするとよさそう

https://github.com/apple/swift/blob/7123d2614b5f222d03b3762cb110d27a9dd98e24/docs/HowToGuides/FAQ.md#how-do-i-use-a-locally-built-compiler-to-build-x

ビルド設定に、`SWIFT_EXEC`のkeyでswiftcのバイナリのpathを追加する

<img width="778" alt="スクリーンショット 2022-12-27 8 47 37" src="https://user-images.githubusercontent.com/16571394/209588915-f1a2f00b-460e-4e31-88b4-7e377008dcc8.png">

ここの修正した際に作成したものでコンパイル/リンクすることができた。
https://github.com/apple/swift/pull/62777
