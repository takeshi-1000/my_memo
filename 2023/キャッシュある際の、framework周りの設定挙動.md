## 背景

https://github.com/trill-lang/trill　
でビルド通すためにいろいろ試行錯誤していた際に、自作フレームワークを追加する場合のビルド時の挙動がちょっとややこしかったの整理

## 準備

Hogeフレームワークをあるソースに追加するとする

```
// main.swift

import Hoge

func main() -> Int {
  return 0
}

main()
```

実際には、testTrillDummyというターゲットがあって、それにASTモジュールを依存するような状態

<img width="973" alt="スクリーンショット 2023-04-11 8 23 08" src="https://user-images.githubusercontent.com/16571394/231017607-e59c749d-5b40-442c-a3e2-93985102d048.png">

## 実験

### (a)キャッシュがない状態（クリーンビルド後の状態）で、ビルド（準備の状態と変わりなし）

- ビルド通る
- otool -L でバイナリ見ると、ASTフレームワークがリンクされていることがわかる

```
$ otool -L ~/Library/Developer/Xcode/DerivedData/trill-emoublwjyjhoiihjyjoxdhhnkrwo/Build/Products/Debug/testTrillDummy
/Users/takeshikomori/Library/Developer/Xcode/DerivedData/trill-emoublwjyjhoiihjyjoxdhhnkrwo/Build/Products/Debug/testTrillDummy:
	@rpath/AST.framework/Versions/A/AST (compatibility version 0.0.0, current version 0.0.0)
	/System/Library/Frameworks/Foundation.framework/Versions/C/Foundation (compatibility version 300.0.0, current version 1971.0.0)
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1319.100.3)
	/usr/lib/swift/libswiftCore.dylib (compatibility version 1.0.0, current version 5.8.0)
	/usr/lib/swift/libswiftCoreFoundation.dylib (compatibility version 1.0.0, current version 120.100.0, weak)
	/usr/lib/swift/libswiftDarwin.dylib (compatibility version 1.0.0, current version 0.0.0, weak)
	/usr/lib/swift/libswiftDispatch.dylib (compatibility version 1.0.0, current version 20.0.0, weak)
	/usr/lib/swift/libswiftIOKit.dylib (compatibility version 1.0.0, current version 1.0.0, weak)
	/usr/lib/swift/libswiftObjectiveC.dylib (compatibility version 1.0.0, current version 6.0.0, weak)
	/usr/lib/swift/libswiftXPC.dylib (compatibility version 1.0.0, current version 6.0.0, weak)

```

### (b)キャッシュがある状態（クリーンビルド後の状態）で、import文除却してビルド

- ビルド通る
- otool -L の結果は(a)と同じ
- ただし、モジュール内の参照を使いたい場合はエラーが出ることに注意。

### (c-1)キャッシュがある状態（クリーンビルド後の状態）で、フレームワークの設定を外す + importはした状態でビルド

- ビルド通る
- otool -L の結果は下記のようになっており、ASTモジュールはリンクされてなさそう

```
$ otool -L ~/Library/Developer/Xcode/DerivedData/trill-emoublwjyjhoiihjyjoxdhhnkrwo/Build/Products/Debug/testTrillDummy
/Users/takeshikomori/Library/Developer/Xcode/DerivedData/trill-emoublwjyjhoiihjyjoxdhhnkrwo/Build/Products/Debug/testTrillDummy:
	/System/Library/Frameworks/Foundation.framework/Versions/C/Foundation (compatibility version 300.0.0, current version 1971.0.0)
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1319.100.3)
	/usr/lib/swift/libswiftCore.dylib (compatibility version 1.0.0, current version 5.8.0)
	/usr/lib/swift/libswiftCoreFoundation.dylib (compatibility version 1.0.0, current version 120.100.0, weak)
	/usr/lib/swift/libswiftDarwin.dylib (compatibility version 1.0.0, current version 0.0.0, weak)
	/usr/lib/swift/libswiftDispatch.dylib (compatibility version 1.0.0, current version 20.0.0, weak)
	/usr/lib/swift/libswiftIOKit.dylib (compatibility version 1.0.0, current version 1.0.0, weak)
	/usr/lib/swift/libswiftObjectiveC.dylib (compatibility version 1.0.0, current version 6.0.0, weak)
	/usr/lib/swift/libswiftXPC.dylib (compatibility version 1.0.0, current version 6.0.0, weak)
```

※フレームワークの設定を外すとは下記のようなこと

<img width="1063" alt="スクリーンショット 2023-04-11 8 33 37" src="https://user-images.githubusercontent.com/16571394/231018825-c5382af9-ac77-411e-aed4-913ce222b7a1.png">

### (c-2) キャッシュがある状態（クリーンビルド後の状態）で、フレームワークの設定を外す + importはした状態+importするものの参照が必要な場合のビルド

- ビルド通る
- otool -L の結果は下記のようになっており、(c-1)と違ってASTモジュールはリンクされている

```
$ otool -L ~/Library/Developer/Xcode/DerivedData/trill-emoublwjyjhoiihjyjoxdhhnkrwo/Build/Products/Debug/testTrillDummy
/Users/takeshikomori/Library/Developer/Xcode/DerivedData/trill-emoublwjyjhoiihjyjoxdhhnkrwo/Build/Products/Debug/testTrillDummy:
	/System/Library/Frameworks/Foundation.framework/Versions/C/Foundation (compatibility version 300.0.0, current version 1971.0.0)
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1319.100.3)
	/usr/lib/swift/libswiftCore.dylib (compatibility version 1.0.0, current version 5.8.0)
	/usr/lib/swift/libswiftCoreFoundation.dylib (compatibility version 1.0.0, current version 120.100.0, weak)
	/usr/lib/swift/libswiftDarwin.dylib (compatibility version 1.0.0, current version 0.0.0, weak)
	/usr/lib/swift/libswiftDispatch.dylib (compatibility version 1.0.0, current version 20.0.0, weak)
	/usr/lib/swift/libswiftIOKit.dylib (compatibility version 1.0.0, current version 1.0.0, weak)
	/usr/lib/swift/libswiftObjectiveC.dylib (compatibility version 1.0.0, current version 6.0.0, weak)
	/usr/lib/swift/libswiftXPC.dylib (compatibility version 1.0.0, current version 6.0.0, weak)
	@rpath/AST.framework/Versions/A/AST (compatibility version 0.0.0, current version 0.0.0)
```

### (d)(c-1)からキャッシュがない状態(クリーンビルドをする)にして、その他同じにした状態でビルド

- ビルド通らない
- no such module エラーになる。（当たり前と言えば当たり前）

## わかること

- フレームワークのキャッシュがある無しに関わらず、フレームワークの参照が必要な場合には、Xcodeの設定を追加しておき import Mojule して参照を使う
- フレームワークのキャッシュがある場合に、Xcodeの設定をとってもビルドが通る場合がある
  - import Module → ビルド通る
    - この時対象のモジュールは実行バイナリにリンクされていない
  - import Module + Modueのなんらかの参照 → ビルド通らない
