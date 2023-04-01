import Foundation
import LLVM

let module = Module(name: "main")
let builder = IRBuilder(module: module)
let mainFuncName = "main"

func createMainFunc() {
    // 関数定義（関数の構造、関数定義をモジュールに追加?）
    let myFunctionType = FunctionType([],
                                      IntType.int32,
                                      variadic: false)
    let myFunction = module.addFunction(mainFuncName, type: myFunctionType)

    // 関数を定義していく
    let entryBlock = myFunction.appendBasicBlock(named: "entry")
    builder.positionAtEnd(of: entryBlock)
    builder.buildRet(IntType.int32.constant(42))
}

createMainFunc()
module.dump()

do {
//    try module.description.write(to: URL(fileURLWithPath: "test.ll"),
//                                 atomically: false,
//                                 encoding: .utf8)
    try module.emitBitCode(to: "my_module.bc")
    let task = Process()
    task.executableURL = URL(fileURLWithPath: "/usr/bin/clang")
    task.arguments = ["-c", "my_module.bc"]
    try task.run()
    task.waitUntilExit()
} catch let error {
    print("error: \(error)")
}
