## 背景

- 言語処理系のossに興味があり、何かのタイミングで[val](https://github.com/val-lang/val)プロジェクトを見つけた
- コンパイラのソースがswiftで書かれているのでもしかしたら読めるかも?と思った
- swiftの特徴（特に値型）に影響を受けて、それを拡張するような形?になっているっぽいので興味を持った

## 環境

- macOS 13.2.1（22D68)
- version: https://github.com/val-lang/val/commit/1a0ed4f9bcf023e01f32cb9883cce29527144720 この辺りのコミット
- swiftバージョン 5.7.2 下記参照

```
$ swiftc --version
swift-driver version: 1.62.15 Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
Target: arm64-apple-macosx13.0
```
※元々swift5.7でビルドしようとしていたが、変な箇所でコンパイルエラーになったので https://github.com/val-lang/val/issues/526 を参考にswiftのバージョンを上記に挙げてビルド成功

失敗時のログ
```
$ swift build -c release
[1/1] Planning buildCompiling plugin Format Source Code...
Compiling plugin GenerateManualPlugin...
Compiling plugin Lint Source Code...
Building for production...
/Users/takeshikomori/me/takeshi-1000/val/Sources/Utils/DirectedGraph.swift:33:26: error: cannot specialize protocol type 'Collection'
  public var edges: some Collection<Edge> {
                         ^
/Users/takeshikomori/me/takeshi-1000/val/Sources/Utils/String+Extensions.swift:25:33: error: cannot specialize protocol type 'Collection'
  public func removingSuffix<S: Collection<Character>>(_ suffix: S) -> Self.SubSequence {
                                ^
/Users/takeshikomori/me/takeshi-1000/val/Sources/Utils/String+Extensions.swift:26:42: error: cannot convert value of type 'Float16' to expected argument type 'Int'
    if let i = index(endIndex, offsetBy: -suffix.count, limitedBy: startIndex),
                                         ^
                                         Int(         )
/Users/takeshikomori/me/takeshi-1000/val/Sources/Utils/String+Extensions.swift:26:50: error: value of type 'S' has no member 'count'
    if let i = index(endIndex, offsetBy: -suffix.count, limitedBy: startIndex),
                                          ~~~~~~ ^~~~~
/Users/takeshikomori/me/takeshi-1000/val/Sources/Utils/String+Extensions.swift:27:13: error: cannot convert value of type '()' to expected argument type 'Range<String.Index>'
      self[i...].elementsEqual(suffix)
            ^
/Users/takeshikomori/me/takeshi-1000/val/Sources/Utils/String+Extensions.swift:27:11: error: instance method 'elementsEqual' requires that 'S' conform to 'Sequence'
      self[i...].elementsEqual(suffix)
          ^
Swift.Sequence:2:28: note: where 'OtherSequence' = 'S'
    @inlinable public func elementsEqual<OtherSequence>(_ other: OtherSequence) -> Bool where OtherSequence : Sequence, Self.Element == OtherSequence.Element
                           ^
[1/3] Compiling Utils Collection+Extensions.swift
```

成功時のログ
```
$ swift build -c release                                                   
[1/1] Planning buildCompiling plugin Format Source Code...
Compiling plugin GenerateManualPlugin...
Compiling plugin Lint Source Code...
Building for production...
[16/16] Linking valc
Build complete! (61.43s)
```

## val実行バイナリできるか

文法あまり厳密に見れてないので、すぐ直せるものもあるかも。

(1) https://tour.val-lang.dev/hello-world を参考に下記作成したができてなかった

```
Hello.val

public fun main() {
  print("Hello, World!")
}
```

```
$ ~/me/takeshi-1000/val/.build/release/valc test.val
test.val:2:3: error: undefined name 'print' in this scope
  print("Hello, World!")
  ~~~~~
```

(2) 下記プログラムでもダメそう

```
public fun main() {
  var length = 1
  length = 2
}
```

```
$ ~/me/takeshi-1000/val/.build/release/valc Hello.val -o hello
Hello.val:3:3: error: left-hand side of assignment must be marked for mutation
  length = 2
  ^

```

(3) 下記プログラムでもダメそう

```
public fun main() {
  var length = 1
}
```

```
$ ~/me/takeshi-1000/val/.build/release/valc Hello.val -o hello
In file included from /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/ValCore.cpp:1:
In file included from /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/ValCore.h:3:
In file included from /opt/homebrew/opt/llvm@11/bin/../include/c++/v1/cstdlib:85:
/opt/homebrew/opt/llvm@11/bin/../include/c++/v1/stdlib.h:93:15: fatal error: 'stdlib.h' file not found
#include_next <stdlib.h>
              ^~~~~~~~~~
1 error generated.
In file included from /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/Hello.cpp:1:
In file included from /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/Hello.h:2:
In file included from /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/ValCore.h:3:
In file included from /opt/homebrew/opt/llvm@11/bin/../include/c++/v1/cstdlib:85:
/opt/homebrew/opt/llvm@11/bin/../include/c++/v1/stdlib.h:93:15: fatal error: 'stdlib.h' file not found
#include_next <stdlib.h>
              ^~~~~~~~~~
1 error generated.
```

(4) 下記を試すとできた

どのタイミングでそうしたか覚えていないが、clangのパスが `/opt/homebrew/opt/llvm@11/bin/clang` になっていて、<br>
rcファイルにhomebrewで引っ張ってきたclangを見るようなものがあったのでそれを取って、既に搭載されているclangでやったらできた

```
// export PATH="/opt/homebrew/opt/llvm@11/bin:$PATH"
```

上記にして、カスタムで通しているパス指定をなくして、下記のようにclangのパスを標準のものにして
```
$ which clang
/usr/bin/clang
```

下記のファイルで実行バイナリまで作成できた
```
$ cat Hello.val 
public fun main() {
 var length = 1
}
$ ~/me/takeshi-1000/val/.build/release/valc Hello.val -o hello -v
Writing file:///var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/ValCore.h
Writing file:///var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/ValCore.cpp
Writing file:///var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/Hello.h
Writing file:///var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/Hello.cpp
/usr/bin/clang++ -o /Users/takeshikomori/me/takeshi-1000/testValProgram/hello -I /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/ValCore.cpp /var/folders/4c/0qwhzzgx3q1_455_mgl56x080000gp/T/Hello.cpp
```

```
$ otool -L hello 
hello:
	/usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 1300.36.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1319.0.0)
```

(5) 下記の複数ファイルパターンもできた

## メモ

- `--emit <output-type>    Emit the specified type output files. From: raw-ast, raw-ir, ir, cpp, binary (default: binary)` これを見ると、IRGenの生成後にCppを作成するフェーズがある。これを最終的にコンパイル+リンク(ビルド)している感じ?

```
$ ~/me/takeshi-1000/val/.build/release/valc -help                          
USAGE: valc [--modules] [--import-builtin] [--no-std] [--typecheck] [--trace-inference <file:line>] [--emit <output-type>] [--cc <CXXCompiler>] [--cc-flags <CXXCompilerFlags> ...] [-o <file>] [--verbose] [<inputs> ...]

ARGUMENTS:
  <inputs>

OPTIONS:
  --modules               Compile inputs as separate modules.
  --import-builtin        Import the built-in module.
  --no-std                Do not include the standard library.
  --typecheck             Type-check the input file(s).
  --trace-inference <file:line>
                          Enable tracing of type inference requests at the given line.
  --emit <output-type>    Emit the specified type output files. From: raw-ast, raw-ir, ir, cpp, binary (default: binary)
  --cc <CXXCompiler>      Select the C++ compiler used by the Val backend. From: clang, gcc, msvc (Windows only) (default: clang)
  --cc-flags <CXXCompilerFlags>
                          Specify flags for the CXX compiler to use
  -o <file>               Write output to <file>.
  -v, --verbose           Use verbose output.
  -h, --help              Show help information.
```

```
[takeshikomori@mac334-komori:~/me/takeshi-1000/testValProgram/20230324]
$ cat Test.val 
fun main() {

}

[takeshikomori@mac334-komori:~/me/takeshi-1000/testValProgram/20230324]
$ ls
Test.val

[takeshikomori@mac334-komori:~/me/takeshi-1000/testValProgram/20230324]
$ ~/me/takeshi-1000/val/.build/release/valc Test.val --emit cpp -v
Writing ValCore.h -- file:///Users/takeshikomori/me/takeshi-1000/testValProgram/20230324/
Writing ValCore.cpp -- file:///Users/takeshikomori/me/takeshi-1000/testValProgram/20230324/
Writing Test.h -- file:///Users/takeshikomori/me/takeshi-1000/testValProgram/20230324/
Writing Test.cpp -- file:///Users/takeshikomori/me/takeshi-1000/testValProgram/20230324/

[takeshikomori@mac334-komori:~/me/takeshi-1000/testValProgram/20230324]
$ ls                                                              
Test.cpp	Test.h		Test.val	ValCore.cpp	ValCore.h
```
