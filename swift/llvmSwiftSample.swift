//
//  main.swift
//  testLLVMSwift2
//
//  Created by Takeshi Komori on 2023/03/30.
//

import Foundation
import LLVM

let module = Module(name: "main")

let builder = IRBuilder(module: module)

let main = builder.addFunction("main",
                               type: FunctionType([], IntType.int64))
let entry = main.appendBasicBlock(named: "entry")
builder.positionAtEnd(of: entry)

let constant = IntType.int64.constant(21)
let sum = builder.buildAdd(constant, constant)
builder.buildRet(sum)

module.dump()

let targetMachine = try TargetMachine()
try targetMachine.emitToFile(module: module, type: .object, path: "hogeHoge.o")

/*
; ModuleID = 'main'
source_filename = "main"

define i64 @main() {
entry:
  ret i64 42
}
*/
