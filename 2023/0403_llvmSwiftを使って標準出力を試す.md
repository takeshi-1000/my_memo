C言語のprintf関数を呼び出して、リンク時にそのアドレスを解決するイメージ

```
import Foundation
import LLVM

let module = Module(name: "main")
let builder = IRBuilder(module: module)

let printfFunctionType = FunctionType([PointerType(pointee: IntType.int8)],
                                      IntType.int32,
                                      variadic: true)
let printfFunction = module.addFunction("printf", type: printfFunctionType)

func createMainFunc() {
    let mainFunctionType = FunctionType([], IntType.int32, variadic: false)
    let mainFunction = module.addFunction("main", type: mainFunctionType)
    let entryBlock = mainFunction.appendBasicBlock(named: "entry")
    builder.positionAtEnd(of: entryBlock)

    let formatString = builder.buildGlobalStringPtr("Hello, World!\n", name: "formatString")

    let returnValue = builder.buildCall(printfFunction, args: [formatString])
    builder.buildRet(returnValue)
}

createMainFunc()
module.dump()

do {
    let targetMachine = try TargetMachine()
    try targetMachine.emitToFile(module: module, type: .assembly, path: "test.s")
    try targetMachine.emitToFile(module: module, type: .object, path: "test.o")
} catch let error {
    print("error: \(error)")
}

```

上記で作成したtest.oのシンボルを見ると、下記のようになっていて

```
0000000000000000 T _main
                 U _printf
0000000000000018 s l_formatString
0000000000000000 t ltmp0
0000000000000018 s ltmp1
0000000000000028 s ltmp2
0000000000000048 s ltmp3
```

clangを使って実行バイナリ作成するさいに、cの標準ライブラリのprintfとリンクしてくれて、アドレス解決してくれる

```
$ nm testProgram 
0000000100000000 T __mh_execute_header
0000000100003f4c T _main
                 U _printf
```

と思ったが、アドレス入ってないので実行時にアドレス解決してくれる感じなんだろう。

```
$ ./testProgram 
Hello, World!
```

下記のdylibのシンボル辿ればどこかしらにあると思う

```
$ otool -L testProgram 
testProgram:
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1319.0.0)
```
