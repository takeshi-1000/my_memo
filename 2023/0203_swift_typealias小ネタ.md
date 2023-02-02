メソッド内部でtypealias定義することもできるみたい。

```
func test() {
  typealias Hoge = String
  let str: Hoge = "test" // compile OK
}
```
