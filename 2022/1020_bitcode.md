## bitcodeとは何か

- LLVM IR のバイナリみたいなもので、実行バイナリに変換するためのファイル。
  - 基本的にユーザーが触ることが少ないような低レイヤのファイルだが、アセンブリファイルと比べると可読性は高そう 
- Xcode13系まで、AppStoreConnect提出時に、bitcodeを有効化することで、提出する実行バイナリにbitcodeを含めて提出していた。

### bitcodeがあると何が嬉しいのか

- 新しいCPUアーキテクチャに互換性のあるバイナリを作成するのに、bitcodeからLLVM IR を復元し、新しいCPUアーキテクチャ向けの実行バイナリを生成する
- これがないと、新しいアークテクチャのcpu搭載したスマホがリリースされた際に、実行バイナリを開発者側で作成して提出しないといけない。

### イメージ図

<img width="816" alt="スクリーンショット 2022-10-20 14 21 16" src="https://user-images.githubusercontent.com/16571394/196862768-7483cf16-4373-4d08-b825-5e8ffe37f9c0.png">

### Xcode14からは対応する必要がなくなった

https://qiita.com/temoki/items/92999fcede0a7b89760f#%E3%81%AA%E3%81%9Cbitcode%E3%81%AF%E5%BB%83%E6%AD%A2%E3%81%95%E3%82%8C%E3%81%9F%E3%81%AE%E3%81%8B

> 今回、Appleがサポートするデバイスのうち、最後の32bitデバイスであるApple Watch Series 3がサポート対象外となりました。
> これは64bitへの移行が完了したことを意味し、Bitcodeが役目を終えたということでしょう。

## LLVM  ちょい深掘り

- SwiftでもLLVMの技術を使ってそう
- Objective-c と clang とかの関係面白い https://codezine.jp/article/detail/8768
  - 元々GCCをフロントエンドに使っていたこと知らなかった。Clangを作ったことによるAppleの推進面白い

https://www.swift.org/swift-compiler/#compiler-architecture

<img width="863" alt="スクリーンショット 2022-10-20 22 42 41" src="https://user-images.githubusercontent.com/16571394/196965116-7c2b73ee-b2b5-429e-941f-a9c3e37460f5.png">
