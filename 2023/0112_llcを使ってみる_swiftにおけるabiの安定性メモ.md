### llcを使ってオブジェクトファイル / アセンブリファイルを作成し、それをもとに実行バイナリを作ってみる

```
test.swift

print("hello")
```

1. swiftコンパイラドライバでbcを作成(swiftツールチェーンという言い方でも良いか?)

```
$ swiftc test.swift -emit-bc -v
Apple Swift version 5.6.1 (swiftlang-5.6.0.323.66 clang-1316.0.20.12)
Target: arm64-apple-macosx12.0
/Applications/Xcode13.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-frontend -frontend -emit-bc -primary-file test.swift -target arm64-apple-macosx12.0 -Xllvm -aarch64-use-tbi -enable-objc-interop -stack-check -sdk /Applications/Xcode13.4.1.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk -color-diagnostics -new-driver-path /Applications/Xcode13.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-driver -resource-dir /Applications/Xcode13.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift -module-name test -target-sdk-version 12.3 -o test.bc
```

2. 作成したビットコードを入力値としてllcに渡し、オブジェクトファイルを作成

```
$ llc test.bc --filetype=obj 
$ ls
test.bc	test.o		test.swift
```

3. swiftツールチェーンにオブジェクトファイルを渡し、実行バイナリを作る

```
$ swiftc test.o -v
Apple Swift version 5.6.1 (swiftlang-5.6.0.323.66 clang-1316.0.20.12)
Target: arm64-apple-macosx12.0
/Applications/Xcode13.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld test.o /Applications/Xcode13.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/clang/lib/darwin/libclang_rt.osx.a -syslibroot /Applications/Xcode13.4.1.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk -lobjc -lSystem -arch arm64 -L /Applications/Xcode13.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx -L /Applications/Xcode13.4.1.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk/usr/lib/swift -platform_version macos 12.0.0 12.3.0 -o test
```

※2の時にアセンブリファイルを作成したい場合は、`llc test.bc --filetype=asm` という感じに、アセンブリファイルであることを示すオプションをつける

### swiftにおけるabiの安定性周りのメモ

https://www.swift.org/blog/abi-stability-and-apple/
https://www.youtube.com/watch?v=3AXNKO932vo

- abiが安定するまでは、アプリにランタイム、標準ライブラリなどバンドルする必要があった
- abi安定以降は、OS内にdylibが搭載されるので、アプリバンドルに含むことなく、システムに搭載されたdylibとリンクすることが可能で、ストレージの削減につながる
- abi安定してないもので実行しているアプリは、継続してアプリにバンドルされたdylibを参照して実行することが可能みたい

> However, as a result of this, the Swift runtime is now a component of the user’s target operating system rather than part of the developer’s toolchain. As a consequence, in the future, for a Swift project to adopt new Swift runtime and standard library functionality, it may also have to require new OS versions that include an updated Swift runtime supporting the added features. This tradeoff between adopting new language features and frameworks or maintaining compatibility with older OS versions has always existed for Objective-C and Apple system frameworks, and will now be a factor for Swift as well.

- ABI安定化はメリットあるものの、ランタイムがよりOS依存(ABI依存)になったので、ABIの制約を受けることになる
