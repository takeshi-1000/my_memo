ASTを出力したい時は、 -dump-ast オプションをつける。

main.swift
```
print("hello")
print("hoge")
```

```
$ swiftc -dump-ast main.swift 
(source_file "main.swift"
  (top_level_code_decl range=[main.swift:1:1 - line:1:14]
    (brace_stmt implicit range=[main.swift:1:1 - line:1:14]
      (call_expr type='()' location=main.swift:1:1 range=[main.swift:1:1 - line:1:14] nothrow
        (declref_expr type='(Any..., String, String) -> ()' location=main.swift:1:1 range=[main.swift:1:1 - line:1:1] decl=Swift.(file).print(_:separator:terminator:) function_ref=single)
        (argument_list labels=_:separator:terminator:
          (argument
            (vararg_expansion_expr implicit type='Any...' location=main.swift:1:7 range=[main.swift:1:7 - line:1:7]
              (array_expr implicit type='Any...' location=main.swift:1:7 range=[main.swift:1:7 - line:1:7] initializer=**NULL**
                (erasure_expr implicit type='Any' location=main.swift:1:7 range=[main.swift:1:7 - line:1:7]
                  (string_literal_expr type='String' location=main.swift:1:7 range=[main.swift:1:7 - line:1:7] encoding=utf8 value="hello" builtin_initializer=Swift.(file).String extension.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:) initializer=**NULL**)))))
          (argument label=separator
            (default_argument_expr implicit type='String' location=main.swift:1:6 range=[main.swift:1:6 - line:1:6] default_args_owner=Swift.(file).print(_:separator:terminator:) param=1))
          (argument label=terminator
            (default_argument_expr implicit type='String' location=main.swift:1:6 range=[main.swift:1:6 - line:1:6] default_args_owner=Swift.(file).print(_:separator:terminator:) param=2))
        ))))
  (top_level_code_decl range=[main.swift:2:1 - line:2:13]
    (brace_stmt implicit range=[main.swift:2:1 - line:2:13]
      (call_expr type='()' location=main.swift:2:1 range=[main.swift:2:1 - line:2:13] nothrow
        (declref_expr type='(Any..., String, String) -> ()' location=main.swift:2:1 range=[main.swift:2:1 - line:2:1] decl=Swift.(file).print(_:separator:terminator:) function_ref=single)
        (argument_list labels=_:separator:terminator:
          (argument
            (vararg_expansion_expr implicit type='Any...' location=main.swift:2:7 range=[main.swift:2:7 - line:2:7]
              (array_expr implicit type='Any...' location=main.swift:2:7 range=[main.swift:2:7 - line:2:7] initializer=**NULL**
                (erasure_expr implicit type='Any' location=main.swift:2:7 range=[main.swift:2:7 - line:2:7]
                  (string_literal_expr type='String' location=main.swift:2:7 range=[main.swift:2:7 - line:2:7] encoding=utf8 value="hoge" builtin_initializer=Swift.(file).String extension.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:) initializer=**NULL**)))))
          (argument label=separator
            (default_argument_expr implicit type='String' location=main.swift:2:6 range=[main.swift:2:6 - line:2:6] default_args_owner=Swift.(file).print(_:separator:terminator:) param=1))
          (argument label=terminator
            (default_argument_expr implicit type='String' location=main.swift:2:6 range=[main.swift:2:6 - line:2:6] default_args_owner=Swift.(file).print(_:separator:terminator:) param=2))
        )))))
```

<img width="1117" alt="スクリーンショット 2022-12-17 12 08 59" src="https://user-images.githubusercontent.com/16571394/208221119-86d93555-540a-4f18-ab0f-85144fa48969.png">


