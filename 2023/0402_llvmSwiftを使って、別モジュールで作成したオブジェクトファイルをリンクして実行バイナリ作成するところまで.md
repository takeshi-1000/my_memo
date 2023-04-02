下記のようなSwiftのコードをLLVMSwiftを使って、LLVM IR 生成部分を試しに作ってみる

```
Module

import Module2

func main() -> Int {
  return hogeHoge(int: 10)
}

Module2

func hogeHoge(int: Num) {
  return Num + 55
}

```

<img width="600" alt="スクリーンショット 2023-04-02 17 23 49" src="https://user-images.githubusercontent.com/16571394/229341260-56b3f5a8-b97f-44b4-8987-be16645d3789.png">

## Module側

```
import Foundation
import LLVM

let module = Module(name: "main")
let module2 = Module(name: "module2")
let hogeHogeFuncName = "_hogeHoge"
let hogeHogeFunctionType = FunctionType([IntType.int32], IntType.int32, variadic: false)
let hogeHogeFuncPtrType = PointerType(pointee: hogeHogeFunctionType)
let builder = IRBuilder(module: module)

func createMainFunc() {
    let mainFunctionType = FunctionType([],
                                        IntType.int32,
                                        variadic: false)
    let myFunction = module.addFunction("main", type: mainFunctionType)
    let hogeHogeFunction = module2.addFunction(hogeHogeFuncName, type: hogeHogeFunctionType)
    let entryBlock = myFunction.appendBasicBlock(named: "entry")
    builder.positionAtEnd(of: entryBlock)
    
    let hogeHogeFuncPointer = builder.buildPointerCast(of: hogeHogeFunction,
                                                       to: hogeHogeFuncPtrType)
    let result = builder.buildCall(hogeHogeFuncPointer, args: [IntType.int32.constant(10)])
    builder.buildRet(result)
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

## Module2側

```
 let module2 = Module(name: "module2")
 let hogeHogeFuncName = "hogeHoge"
 let hogeHogeFunctionType = FunctionType([IntType.int32], IntType.int32, variadic: false)
 let hogeHogeFuncPtrType = PointerType(pointee: hogeHogeFunctionType)
 let builderForModule2 = IRBuilder(module: module2)

 func createHogeHogeFunc() {
     let hogeHogeFunction = module2.addFunction(hogeHogeFuncName, type: hogeHogeFunctionType)
     let entryBlock = hogeHogeFunction.appendBasicBlock(named: "entry")
     builderForModule2.positionAtEnd(of: entryBlock)

     let arg0 = hogeHogeFunction.firstParameter!
     let returnValue = builderForModule2.buildAdd(arg0, IntType.int32.constant(55))
     builderForModule2.buildRet(returnValue)
 }

 createHogeHogeFunc()
 module2.dump()

 do {
     let targetMachine = try TargetMachine()
     try targetMachine.emitToFile(module: module2, type: .assembly, path: "test2.s")
     try targetMachine.emitToFile(module: module2, type: .object, path: "test2.o")
 } catch let error {
     print("error: \(error)")
 }
```

## シンボル情報

```
$ nm test.o
                 U _hogeHoge
0000000000000000 T _main
0000000000000000 t ltmp0
0000000000000018 s ltmp1
0000000000000038 s ltmp2
```

```
$ nm test2.o
0000000000000000 T _hogeHoge
0000000000000000 t ltmp0
0000000000000008 s ltmp1
```

→ test.o は _hogeHoge のアドレスが決まってないが、Link時にアドレスバインドするんだろう

## わかってないこととか疑問とかメモ

- Module2側の `let hogeHogeFunction = module2.addFunction(hogeHogeFuncName, type: hogeHogeFunctionType)` のコードがあるが、これだけでグローバルになってくれる
- Module2側で hogeHogeFuncName = "hogeHoge"としているが、 勝手に `_hogeHoge` となってくれる
  - これと連動させるために、 Moudle側のfuncNameを `_hogeHoge` としている（依存を呼び出す側は、「_」がつかなかった） 

## 一つのモジュールパターン

<img width="600" alt="スクリーンショット 2023-04-02 17 29 51" src="https://user-images.githubusercontent.com/16571394/229341563-96035655-8436-41d8-a5a6-d3aa8181f32a.png">

### コードイメージ

```
Module

import Module2

func main() -> Int {
  return hogeHoge(int: 10)
}

func hogeHoge(int: Num) {
  return Num + 55
}

```


```
import Foundation
import LLVM

let module = Module(name: "main")
let hogeHogeFuncName = "hogeHoge"
let hogeHogeFunctionType = FunctionType([IntType.int32], IntType.int32, variadic: false)
let hogeHogeFuncPtrType = PointerType(pointee: hogeHogeFunctionType)
let builder = IRBuilder(module: module)

func createHogeFunc() {
    let hogeHogeFunction = module.addFunction(hogeHogeFuncName, type: hogeHogeFunctionType)
    let entryBlock = hogeHogeFunction.appendBasicBlock(named: "entry")
    builder.positionAtEnd(of: entryBlock)

    let arg0 = hogeHogeFunction.firstParameter!
    let returnValue = builder.buildAdd(arg0, IntType.int32.constant(55))
    builder.buildRet(returnValue)
}

func createMainFunc() {
    // 関数定義（関数の構造、関数定義をモジュールに追加?）
    let mainFunctionType = FunctionType([],
                                        IntType.int32,
                                        variadic: false)
    let mainFunction = module.addFunction("main", type: mainFunctionType)
    let hogeHogeFunction = module.function(named: hogeHogeFuncName)!
    // 関数を定義していく
    let entryBlock = mainFunction.appendBasicBlock(named: "entry")
    builder.positionAtEnd(of: entryBlock)
        
    let result = builder.buildCall(hogeHogeFunction, args: [IntType.int32.constant(10)])
    builder.buildRet(result)
}

createHogeFunc()
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

## シンボル情報

```
$ nm test.o
0000000000000000 T _hogeHoge
0000000000000008 T _main
0000000000000000 t ltmp0
0000000000000020 s ltmp1
0000000000000060 s ltmp2
```

