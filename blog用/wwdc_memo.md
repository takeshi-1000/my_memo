wwdc 個人的な反省と得た知見

反省、気づきメモ

- Xcode15にアップデートしないとwwdcのサンプル動かせない。。何らかのプロジェクトで適用したい場合には無理
  - 今回はリンカのアップデートとかもあったので、すぐに取り込めなかった。。すぐ試すにはCocoapodsなどのライブラリ管理システムも、公式のpackage manager に移していくのがいいのかも
- 日本語翻訳は最初の方はキーノートくらいでしかない
  - ラボというのを使った方が良い?  
- セッションが多すぎて計画的に見た方がいいのかも + 英語なのでちょっとやる気が削がれる
- 自宅pcのスペックが足りなくなりそう(13-inch, Early 2015)
  - pcのアップデートを組み込む必要がありそう

学び

- 新しいlinker
- swift api generator でXcodeとシームレスにできるのかも?
- Swift observation。リアクティブな実装方法他にもあるのか?
- swiftui scrollview が新しくなった?
- SwiftData型
- Swiftgen的なものがあるっぽい?

swift api generator

- new swift package plugin
  - https://developer.apple.com/videos/play/wwdc2022/110359/ これ見た方が良さそう
  - https://github.com/apple/swift-openapi-generator/blob/main/Plugins/OpenAPIGenerator/plugin.swift ここでプラグインの実装はありそう
  - R.swift にもpluginありそう
