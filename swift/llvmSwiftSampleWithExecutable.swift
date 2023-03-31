//
//  main.swift
//  testLLVMSwift2
//
//  Created by Takeshi Komori on 2023/03/30.
//

/*
 下記のようなSwiftプログラムをイメージ
 
 func hogeHoge(myVariable: Int) -> Int {
   return myVariable
 }
 
 func main() -> Int {
   return hogeHoge()
 }
 
 main()
 
 */

import Foundation
import LLVM

let module = Module(name: "main")
let builder = IRBuilder(module: module)
let hogeFuncName = "hogeHoge"
let mainFuncName = "main"

func createHogeFunc() {
    // 関数定義（関数の構造、関数定義をモジュールに追加?）
    let myFunctionType = FunctionType([IntType.int32],
                                      IntType.int32,
                                      variadic: false)
    let myFunction = module.addFunction(hogeFuncName, type: myFunctionType)

    // 関数を定義していく
    let entryBlock = myFunction.appendBasicBlock(named: "start")
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
}

func createMainFunc() {
    // 関数定義（関数の構造、関数定義をモジュールに追加?）
    let myFunctionType = FunctionType([],
                                      IntType.int32,
                                      variadic: false)
    let myFunction = module.addFunction(mainFuncName, type: myFunctionType)

    // 関数を定義していく
    let entryBlock = myFunction.appendBasicBlock(named: "entry")
    builder.positionAtEnd(of: entryBlock)
    let hogeFunc = module.function(named: hogeFuncName)!
    let result = builder.buildCall(hogeFunc, args: [IntType.int32.constant(10)], name: "result")
    builder.buildRet(result)
}

createHogeFunc()
createMainFunc()

module.dump()
/*
 ; ModuleID = 'main'
 source_filename = "main"

 define i32 @hogeHoge(i32 %0) {
 entry:
   %myVariable = alloca i32, align 4
   store i32 %0, i32* %myVariable, align 4
   %1 = load i32, i32* %myVariable, align 4
   %returnValue = add i32 %1, 55
   ret i32 %returnValue
 }

 define i32 @main() {
 entry:
   %result = call i32 @hogeHoge(i32 10)
   ret i32 %result
 }
 */

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
