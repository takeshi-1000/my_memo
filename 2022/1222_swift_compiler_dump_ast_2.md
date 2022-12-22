-Xfrontend -debug-constraints をつけてコンパイルすると、contraintの動きが見える?

```
$ swiftc main.swift -Xfrontend -debug-constraints
---Constraint solving at [main.swift:1:11 - line:1:11]---
---Initial constraints for the given expression---
(string_literal_expr type='$T0' location=main.swift:1:11 range=[main.swift:1:11 - line:1:11] encoding=utf8 value="hello" builtin_initializer=**NULL** initializer=**NULL**)
Score: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Contextual Type: <null>
Type Variables:
  $T0 [noescape allowed] literal=3 bindings={} @ locator@0x14d851c00 [StringLiteral@main.swift:1:11]

Active Constraints:

Inactive Constraints:
  $T0 literal conforms to ExpressibleByStringLiteral [[locator@0x14d851c00 [StringLiteral@main.swift:1:11]]];
  ($T0 literal=3 bindings={})
  Initial bindings: $T0 := String
  (attempting type variable $T0 := String
    (found solution 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
  )
---Solver statistics---
Total number of scopes explored: 2
Maximum depth reached while exploring solutions: 2
Time: 1.089000e+00ms
---Solution---
Fixed score: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Type variables:
  $T0 as String @ locator@0x14d851c00 [StringLiteral@main.swift:1:11]

Overload choices:

Constraint restrictions:

Trailing closure matching:

Disjunction choices:
---Type-checked expression---
(string_literal_expr type='String' location=main.swift:1:11 range=[main.swift:1:11 - line:1:11] encoding=utf8 value="hello" builtin_initializer=Swift.(file).String extension.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:) initializer=**NULL**)
---Constraint solving at [main.swift:2:12 - line:2:12]---
  (overload set choice binding $T0 := String)
---Initial constraints for the given expression---
(declref_expr type='String' location=main.swift:2:12 range=[main.swift:2:12 - line:2:12] decl=main.(file).str@main.swift:1:5 function_ref=unapplied)
Score: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Contextual Type: <null>
Type Variables:
  $T0 [lvalue allowed] [noescape allowed] as String @ locator@0x14d874600 [DeclRef@main.swift:2:12]

Active Constraints:

Inactive Constraints:
Resolved overloads:
  selected overload set choice str: $T0 == String for locator@0x14d874600 [DeclRef@main.swift:2:12]

  (found solution 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
---Solver statistics---
Total number of scopes explored: 1
Maximum depth reached while exploring solutions: 1
Time: 2.620000e-01ms
---Solution---
Fixed score: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Type variables:
  $T0 as String @ locator@0x14d874600 [DeclRef@main.swift:2:12]

Overload choices:
  locator@0x14d874600 [DeclRef@main.swift:2:12] with main.(file).str@main.swift:1:5 as str: String


Constraint restrictions:

Trailing closure matching:

Disjunction choices:
---Type-checked expression---
(declref_expr type='String' location=main.swift:2:12 range=[main.swift:2:12 - line:2:12] decl=main.(file).str@main.swift:1:5 function_ref=unapplied)
---Constraint solving at [main.swift:3:1 - line:3:11]---
  (overload set choice binding $T1 := String)
(disabled disjunction term $T0 bound to decl Swift.(file).print(_:separator:terminator:to:) : <Target where Target : TextOutputStream> (Any..., separator: String, terminator: String, to: inout Target) -> () [[locator@0x14d875e00 [OverloadedDeclRef@main.swift:3:1]]];)
(introducing single enabled disjunction term $T0 bound to decl Swift.(file).print(_:separator:terminator:) : (Any..., String, String) -> () [[locator@0x14d875e00 [OverloadedDeclRef@main.swift:3:1]]];)
  (overload set choice binding $T0 := (Any..., String, String) -> ())
(common result type for $T0 is ())
(increasing score due to empty-existential conversion)
---Initial constraints for the given expression---
(call_expr type='()' location=main.swift:3:1 range=[main.swift:3:1 - line:3:11]
  (overloaded_decl_ref_expr type='$T0' location=main.swift:3:1 range=[main.swift:3:1 - line:3:1] name=print number_of_decls=2 function_ref=single decls=[
    Swift.(file).print(_:separator:terminator:),
    Swift.(file).print(_:separator:terminator:to:)])
  (argument_list
    (argument
      (declref_expr type='String' location=main.swift:3:7 range=[main.swift:3:7 - line:3:7] decl=main.(file).str2@main.swift:2:5 function_ref=unapplied))
  ))
Score: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
Contextual Type: <null>
Type Variables:
  $T0 [lvalue allowed] [noescape allowed] as (Any..., String, String) -> () @ locator@0x14d875e00 [OverloadedDeclRef@main.swift:3:1]
  $T1 [lvalue allowed] [noescape allowed] as String @ locator@0x14d875f98 [DeclRef@main.swift:3:7]
  $T2 [noescape allowed] as () @ locator@0x14d875ff8 [Call@main.swift:3:1 -> function result]

Active Constraints:

Inactive Constraints:
Resolved overloads:
  selected overload set choice str2: $T1 == String for locator@0x14d875f98 [DeclRef@main.swift:3:7]
  selected overload set choice print: $T0 == (Any..., String, String) -> () for locator@0x14d875e00 [OverloadedDeclRef@main.swift:3:1]

  (found solution 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0)
---Solver statistics---
Total number of scopes explored: 1
Maximum depth reached while exploring solutions: 1
Time: 9.010000e-01ms
---Solution---
Fixed score: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
Type variables:
  $T0 as (Any..., String, String) -> () @ locator@0x14d875e00 [OverloadedDeclRef@main.swift:3:1]
  $T1 as String @ locator@0x14d875f98 [DeclRef@main.swift:3:7]
  $T2 as () @ locator@0x14d875ff8 [Call@main.swift:3:1 -> function result]

Overload choices:
  locator@0x14d875e00 [OverloadedDeclRef@main.swift:3:1] with Swift.(file).print(_:separator:terminator:) as print: (Any..., String, String) -> ()

  locator@0x14d875f98 [DeclRef@main.swift:3:7] with main.(file).str2@main.swift:2:5 as str2: String


Constraint restrictions:
  String to Any is [existential]

Trailing closure matching:
  locator@0x14d8760b8 [Call@main.swift:3:1 -> apply argument]: forward

Disjunction choices:
---Type-checked expression---
(call_expr type='()' location=main.swift:3:1 range=[main.swift:3:1 - line:3:11]
  (declref_expr type='(Any..., String, String) -> ()' location=main.swift:3:1 range=[main.swift:3:1 - line:3:1] decl=Swift.(file).print(_:separator:terminator:) function_ref=single)
  (argument_list labels=_:separator:terminator:
    (argument
      (vararg_expansion_expr implicit type='Any...' location=main.swift:3:7 range=[main.swift:3:7 - line:3:7]
        (array_expr implicit type='Any...' location=main.swift:3:7 range=[main.swift:3:7 - line:3:7] initializer=**NULL**
          (erasure_expr implicit type='Any' location=main.swift:3:7 range=[main.swift:3:7 - line:3:7]
            (declref_expr type='String' location=main.swift:3:7 range=[main.swift:3:7 - line:3:7] decl=main.(file).str2@main.swift:2:5 function_ref=unapplied)))))
    (argument label=separator
      (default_argument_expr implicit type='String' location=main.swift:3:6 range=[main.swift:3:6 - line:3:6] default_args_owner=Swift.(file).print(_:separator:terminator:) param=1))
    (argument label=terminator
      (default_argument_expr implicit type='String' location=main.swift:3:6 range=[main.swift:3:6 - line:3:6] default_args_owner=Swift.(file).print(_:separator:terminator:) param=2))
  ))
```
