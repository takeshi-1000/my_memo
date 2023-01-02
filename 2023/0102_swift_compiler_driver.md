```
print("hoge")
```

上記のようなswiftファイルがオブジェクトファイルになるまでどういうパイプラインを辿るのかを知るために、swift-frontend周りのソースコードを読んだ

`swftc -c main.swift` を実行すると、以下のような順で実行される

1. swiftc main.swiftはswift-frontendのシンボリックリンクなので、swift-frontendのバイナリが実行される
2. https://github.com/apple/swift/blob/main/lib/Basic/Program.cpp#L33 が呼ばれて、swift-driverが呼ばれる。下記のようなコマンドが実行される
  - `/Users/takeshikomori/me/takeshi-1000/swift-project/build/Ninja-RelWithDebInfoAssert/swift-macosx-arm64/bin/swift-driver --driver-mode=swiftc -Xfrontend -new-driver-path -Xfrontend /Users/takeshikomori/me/takeshi-1000/swift-project/build/Ninja-RelWithDebInfoAssert/swift-macosx-arm64/bin/swift-driver -c main.swift -v`
3.  driverのバイナリがswift-frontendのコマンドを実行する
  - `/Users/takeshikomori/me/takeshi-1000/swift-project/build/Ninja-RelWithDebInfoAssert/swift-macosx-arm64/bin/swift-frontend -frontend -c -primary-file main.swift -target arm64-apple-macosx12.0 -Xllvm -aarch64-use-tbi -enable-objc-interop -color-diagnostics -new-driver-path /Users/takeshikomori/me/takeshi-1000/swift-project/build/Ninja-RelWithDebInfoAssert/swift-macosx-arm64/bin/swift-driver -empty-abi-descriptor -resource-dir /Users/takeshikomori/me/takeshi-1000/swift-project/build/Ninja-RelWithDebInfoAssert/swift-macosx-arm64/lib/swift -module-name main -o main.o`
4. swift-frontendのバイナリが実行され、コンパイルの本処理が走る?

<img width="954" alt="スクリーンショット 2023-01-02 8 14 34" src="https://user-images.githubusercontent.com/16571394/210187183-ecec9ab3-f7f2-4f34-9d8b-93e749409a54.png">

swift-driverは https://github.com/apple/swift-driver でswift言語で開発されているっぽい
