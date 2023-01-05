runtimeとは実行時に必要なプログラムみたいなもので、
コンパイル時にバイナリに埋め込むこともできそうみたいだが
出力サイズがデカくなるようなので、ライブラリとして切り離されているっぽい

`/usr/lib/swift/libswiftCore.dylib` として、そのプログラムがランタイムライブラリとして埋め込まれているっぽい。

```
[takeshikomori@MacBook-Pro-2:~/me/takeshi-1000/testSwiftProgram/2023/0102]
$ cat main.swift 
print("hello")

[takeshikomori@MacBook-Pro-2:~/me/takeshi-1000/testSwiftProgram/2023/0102]
$ ./main 
hello

[takeshikomori@MacBook-Pro-2:~/me/takeshi-1000/testSwiftProgram/2023/0102]
$ otool -L main
main:
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1311.100.3)
	/usr/lib/swift/libswiftCore.dylib (compatibility version 1.0.0, current version 5.6.0)
```

swiftは静的型付け言語と呼ばれる一方で、実行時に動的な振る舞いをすることがあり、それをランタイムライブラリで処理してくれるっぽい

https://kateinoigakukun.hatenablog.com/entry/2019/12/13/140059 一時情報あたれてないが、左記記事によると下記周りをやってくれているそう

- メモリ確保
- ARC
- 実行時の型システム
- 動的キャスト

ランタイムライブラリの実装はこの辺? https://github.com/apple/swift/tree/main/stdlib/public/runtime

objective-c runtime https://scrapbox.io/tasuwo-ios/Objective-C_Runtime

> 従って、Objective-C で書かれたコードの実行のためには、[/ コンパイラ] のみでなく、コンパイルされたコードを実行するための専用のランタイムシステムが必要となる。このようなランタイムシステムは、ちょうど Objective-C 言語のための OS のように動作する。このランタイムシステムが Objective-C Runtime となる。

この記述なるほどなという感じ
