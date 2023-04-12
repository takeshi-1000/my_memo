## 前提
環境: MacOS 13.1, Apple M1

## やりたいこと

下記のようなLLVM IR をオブジェクトファイルにして

```
; ModuleID = 'main'
source_filename = "main"

define i32 @main() {
entry:
  ret i32 20
}
```

そのオブジェクトファイルを最低限システムライブラリとリンク(遅延リンク/実行時リンク)させて、実行バイナリ(Mach-o, arm64)にする

## 結果

`ld test.o -syslibroot /Applications/{Xcode.app名}/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -o {実行バイナリ名} -lSystem` で十分そう?

```
$ ld test.o -syslibroot /Applications/Xcode14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -o test1 -L/usr/local/lib -lSystem

[takeshikomori@mac334-komori:~/Desktop]
$ ls
a.out	test.o	test.s	test1

[takeshikomori@mac334-komori:~/Desktop]
$ ./test1 

[takeshikomori@mac334-komori:~/Desktop]
$ echo $?
20

[takeshikomori@mac334-komori:~/Desktop]
$ ld test.o -syslibroot /Applications/Xcode14.3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -o test2 -lSystem

[takeshikomori@mac334-komori:~/Desktop]
$ ls
test.o	test.s	test1	test2

[takeshikomori@mac334-komori:~/Desktop]
$ ./test2

[takeshikomori@mac334-komori:~/Desktop]
$ echo $?
20

[takeshikomori@mac334-komori:~/Desktop]
$ ld test.o -syslibroot /Applications/Xcode14.3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -o test2
ld: dynamic executables or dylibs must link with libSystem.dylib for architecture arm64

[takeshikomori@mac334-komori:~/Desktop]
$ ld test.o -syslibroot /Applications/Xcode14.0.1.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -o test3 -lSystem

[takeshikomori@mac334-komori:~/Desktop]
$ ./test3

[takeshikomori@mac334-komori:~/Desktop]
$ echo $?                                                                                                                                     
20

[takeshikomori@mac334-komori:~/Desktop]
$ ls              
test.o	test.s	test1	test2	test3

[takeshikomori@mac334-komori:~/Desktop]
$ otool -L test1
test1:
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1319.0.0)

[takeshikomori@mac334-komori:~/Desktop]
$ otool -L test2
test2:
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1319.100.3)

[takeshikomori@mac334-komori:~/Desktop]
$ otool -L test3
test3:
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1311.100.3)
```

### 参考

swiftcやclang等のコンパイラドライバ使ってリンクした際の出力見て、なんとなくリンクに必要な指定をみた

```
$ /usr/bin/clang test.o -v
Apple clang version 14.0.0 (clang-1400.0.29.202)
Target: arm64-apple-darwin22.3.0
Thread model: posix
InstalledDir: /Applications/Xcode14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld" -demangle -lto_library /Applications/Xcode14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib -dynamic -arch arm64 -platform_version macos 13.0.0 13.1 -syslibroot /Applications/Xcode14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -o a.out -L/usr/local/lib test.o -lSystem /Applications/Xcode14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/14.0.0/lib/darwin/libclang_rt.osx.a

$ swiftc test.o -v
Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
Target: arm64-apple-macosx13.0
/Applications/Xcode14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld test.o /Applications/Xcode14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/clang/lib/darwin/libclang_rt.osx.a -syslibroot /Applications/Xcode14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.1.sdk -lobjc -lSystem -arch arm64 -L /Applications/Xcode14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx -L /Applications/Xcode14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.1.sdk/usr/lib/swift -platform_version macos 13.0.0 13.1.0 -o test
```
