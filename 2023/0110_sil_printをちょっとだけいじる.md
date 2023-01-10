silをもう少し深く知るために、 -emit-silgen で生成されるraw sil の内容をちょっとだけ変えてみる

https://github.com/apple/swift/blob/main/lib/SIL/IR/SILPrinter.cpp#L3157

を `OS << "[ossa] 👍";` に変えてみる

```
[takeshikomori@MacBook-Pro-2:~/me/takeshi-1000/testSwiftProgram/2023/0110]
$ cat test.swift 
func test() {
print("hello")
}

test()
```

```
[takeshikomori@MacBook-Pro-2:~/me/takeshi-1000/testSwiftProgram/2023/0110]
$ ~/me/takeshi-1000/swift-project/build/Ninja-RelWithDebInfoAssert/swift-macosx-arm64/bin/swiftc test.swift -emit-silgen
sil_stage raw

import Builtin
import Swift
import SwiftShims

func test()

// main
sil [ossa] 👍@main : $@convention(c) (Int32, UnsafeMutablePointer<Optional<UnsafeMutablePointer<Int8>>>) -> Int32 {
bb0(%0 : $Int32, %1 : $UnsafeMutablePointer<Optional<UnsafeMutablePointer<Int8>>>):
  // function_ref test()
  %2 = function_ref @$s4testAAyyF : $@convention(thin) () -> () // user: %3
  %3 = apply %2() : $@convention(thin) () -> ()
  %4 = integer_literal $Builtin.Int32, 0          // user: %5
  %5 = struct $Int32 (%4 : $Builtin.Int32)        // user: %6
  return %5 : $Int32                              // id: %6
} // end sil function 'main'

// test()
sil hidden [ossa] 👍@$s4testAAyyF : $@convention(thin) () -> () {
bb0:
  %0 = integer_literal $Builtin.Word, 1           // user: %2
  // function_ref _allocateUninitializedArray<A>(_:)
  %1 = function_ref @$ss27_allocateUninitializedArrayySayxG_BptBwlF : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer) // user: %2
  %2 = apply %1<Any>(%0) : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer) // user: %3
  (%3, %4) = destructure_tuple %2 : $(Array<Any>, Builtin.RawPointer) // users: %15, %5
  %5 = pointer_to_address %4 : $Builtin.RawPointer to [strict] $*Any // user: %12
  %6 = string_literal utf8 "hello"                // user: %11
  %7 = integer_literal $Builtin.Word, 5           // user: %11
  %8 = integer_literal $Builtin.Int1, -1          // user: %11
  %9 = metatype $@thin String.Type                // user: %11
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %10 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %11
  %11 = apply %10(%6, %7, %8, %9) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %13
  %12 = init_existential_addr %5 : $*Any, $String // user: %13
  store %11 to [init] %12 : $*String              // id: %13
  // function_ref _finalizeUninitializedArray<A>(_:)
  %14 = function_ref @$ss27_finalizeUninitializedArrayySayxGABnlF : $@convention(thin) <τ_0_0> (@owned Array<τ_0_0>) -> @owned Array<τ_0_0> // user: %15
  %15 = apply %14<Any>(%3) : $@convention(thin) <τ_0_0> (@owned Array<τ_0_0>) -> @owned Array<τ_0_0> // users: %24, %21
  // function_ref default argument 1 of print(_:separator:terminator:)
  %16 = function_ref @$ss5print_9separator10terminatoryypd_S2StFfA0_ : $@convention(thin) () -> @owned String // user: %17
  %17 = apply %16() : $@convention(thin) () -> @owned String // users: %23, %21
  // function_ref default argument 2 of print(_:separator:terminator:)
  %18 = function_ref @$ss5print_9separator10terminatoryypd_S2StFfA1_ : $@convention(thin) () -> @owned String // user: %19
  %19 = apply %18() : $@convention(thin) () -> @owned String // users: %22, %21
  // function_ref print(_:separator:terminator:)
  %20 = function_ref @$ss5print_9separator10terminatoryypd_S2StF : $@convention(thin) (@guaranteed Array<Any>, @guaranteed String, @guaranteed String) -> () // user: %21
  %21 = apply %20(%15, %17, %19) : $@convention(thin) (@guaranteed Array<Any>, @guaranteed String, @guaranteed String) -> ()
  destroy_value %19 : $String                     // id: %22
  destroy_value %17 : $String                     // id: %23
  destroy_value %15 : $Array<Any>                 // id: %24
  %25 = tuple ()                                  // user: %26
  return %25 : $()                                // id: %26
} // end sil function '$s4testAAyyF'

// _allocateUninitializedArray<A>(_:)
sil [serialized] [always_inline] [_semantics "array.uninitialized_intrinsic"] @$ss27_allocateUninitializedArrayySayxG_BptBwlF : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer)

// String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
sil [serialized] [always_inline] [readonly] [_semantics "string.makeUTF8"] @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String

// _finalizeUninitializedArray<A>(_:)
sil hidden_external [serialized] [_semantics "array.finalize_intrinsic"] @$ss27_finalizeUninitializedArrayySayxGABnlF : $@convention(thin) <τ_0_0> (@owned Array<τ_0_0>) -> @owned Array<τ_0_0>

// default argument 1 of print(_:separator:terminator:)
sil hidden_external [serialized] @$ss5print_9separator10terminatoryypd_S2StFfA0_ : $@convention(thin) () -> @owned String

// default argument 2 of print(_:separator:terminator:)
sil hidden_external [serialized] @$ss5print_9separator10terminatoryypd_S2StFfA1_ : $@convention(thin) () -> @owned String

// print(_:separator:terminator:)
sil @$ss5print_9separator10terminatoryypd_S2StF : $@convention(thin) (@guaranteed Array<Any>, @guaranteed String, @guaranteed String) -> ()



// Mappings from '#fileID' to '#filePath':
//   'test/test.swift' => 'test.swift'
```
