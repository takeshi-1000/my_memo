import Foundation
import LLVM

// 依存関係
// moduleがmodule2を持っている
let module = Module(name: "main")
let module2 = Module(name: "module2")
let hogeHogeFuncName = "hogeHoge"
let hogeHogeFunctionType = FunctionType([IntType.int32], IntType.int32, variadic: false)
_ = module2.addFunction(hogeHogeFuncName, type: hogeHogeFunctionType)

let builder = IRBuilder(module: module)
let hogeFuncName = "hogeHoge"
let mainFuncName = "main"


/*
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
 */

func createMainFunc() {
    // 関数定義（関数の構造、関数定義をモジュールに追加?）
    let myFunctionType = FunctionType([],
                                      IntType.int32,
                                      variadic: false)
    let myFunction = module.addFunction(mainFuncName, type: myFunctionType)
    // 関数を定義していく
    let entryBlock = myFunction.appendBasicBlock(named: "entry")
    builder.positionAtEnd(of: entryBlock)
    let hogeFunc = module2.function(named: hogeHogeFuncName)!
    
    let hogeFuncPointer = builder.buildPointerCast(of: hogeFunc,
                                                   to: PointerType(pointee: hogeHogeFunctionType))
//    print("@@@ 通過")
    let result = builder.buildCall(hogeFuncPointer, args: [IntType.int32.constant(10)])
//    print("@@@ 通過2")
    builder.buildRet(result)
}

//createHogeFunc()
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
//    try module.description.write(to: URL(fileURLWithPath: "test.ll"),
//                                 atomically: false,
//                                 encoding: .utf8)
    let targetMachine = try TargetMachine()
    try targetMachine.emitToFile(module: module, type: .assembly, path: "test.s")
    try targetMachine.emitToFile(module: module, type: .object, path: "test.o")
//    try module.emitToFile(module: <#T##Module#>, type: <#T##CodegenFileType#>, path: <#T##String#>)
    
//    let task = Process()
//    task.executableURL = URL(fileURLWithPath: "/opt/homebrew/opt/llvm@11/bin/clang")
//    task.arguments = ["-c", "my_module_main.bc"]
//    try task.run()
//    task.waitUntilExit()
} catch let error {
    print("error: \(error)")
}

/*
[takeshikomori@mac334-komori:~/me/takeshi-1000/testSwiftProgram/2023/0401]
$ objdump -d test.o 

test.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <ltmp0>:
       0: fd 7b bf a9  	stp	x29, x30, [sp, #-16]!
       4: 40 01 80 52  	mov	w0, #10
       8: 00 00 00 94  	bl	0x8 <ltmp0+0x8>
       c: fd 7b c1 a8  	ldp	x29, x30, [sp], #16
      10: c0 03 5f d6  	ret

[takeshikomori@mac334-komori:~/me/takeshi-1000/testSwiftProgram/2023/0401]
$ nm test.o
0000000000000000 T _main
                 U hogeHoge
0000000000000000 t ltmp0
0000000000000018 s ltmp1
0000000000000038 s ltmp2

[takeshikomori@mac334-komori:~/me/takeshi-1000/testSwiftProgram/2023/0401]
$ cat test.s
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_main
	.p2align	2
_main:
	.cfi_startproc
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w0, #10
	bl	hogeHoge
	ldp	x29, x30, [sp], #16
	ret
	.cfi_endproc

.subsections_via_symbols
*/
