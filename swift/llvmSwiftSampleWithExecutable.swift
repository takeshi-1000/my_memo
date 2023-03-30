import Foundation
import LLVM

let module = Module(name: "main")
let builder = IRBuilder(module: module)

// 関数定義（関数の構造、関数定義をモジュールに追加?）
let myFunctionType = FunctionType([IntType.int32],
                                  IntType.int32,
                                  variadic: false)
let myFunction = module.addFunction("main", type: myFunctionType)

// 関数を定義していく
let entryBlock = myFunction.appendBasicBlock(named: "entry")
// これないと落ちる
// ChatGPT: positionAtEnd関数は、IRBuilderクラスの現在の基本ブロックを変更するためのものです。
// 基本ブロックが指定されていない場合、positionAtEnd関数を呼び出すことはできません。
builder.positionAtEnd(of: entryBlock)

let arg1 = myFunction.parameter(at: 0)
let var1 = builder.buildAlloca(type: IntType.int32, name: "myVariable")

builder.buildStore(arg1!, to: var1)

// 変数の値を取得する
let value = builder.buildLoad(var1, type: IntType.int32)
let returnValue = builder.buildAdd(value, IntType.int32.constant(55), name: "returnValue")

builder.buildRet(returnValue)

module.dump()

do {
    try module.description.write(to: URL(fileURLWithPath: "test.ll"),
                                 atomically: false,
                                 encoding: .utf8)
    try module.emitBitCode(to: "my_module.bc")
    
    let task = Process()
    task.executableURL = URL(fileURLWithPath: "/usr/bin/clang")
    task.arguments = ["-o", "my_program", "my_module.bc"]
    try task.run()
    task.waitUntilExit()
} catch let error {
    print("error: \(error)")
}
