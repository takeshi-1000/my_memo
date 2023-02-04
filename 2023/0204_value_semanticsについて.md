## swiftにおけるvalue semantics について

Swift における Value Semantics の定義は、ある型が Value Semantics を持つとき、その型の値が変更に対して独立であるということらしい。

下記のようなstructを考えたとき

```
struct Test {
  var value: Int = 0
}
```

下記のようなプログラムを実装すると、
```
let test = Test()
test.value = 5

let test2 = test
test2.value = 20
```

test2.value = 20実行後の、test,test2はそれぞれ下記の値となり

- test.value -> 5
- test2.value -> 20

test,test2はそれぞれ独立して変更できる。こういう性質を持つことをvalue semantics を持つと表現し、
上記の例では、struct Test は value semantics を持つといえる。

### reference semantics

下記のようなclassを考えた時

```
class TestClass {
  var value: Int = 0
}
```

下記のようなプログラムを実装すると、
```
let test = TestClass()
test.value = 5

let test2 = test
test2.value = 20
```

test2.value = 20実行後の、test,test2はそれぞれ下記の値となり

- test.value -> 20
- test2.value -> 20

test,test2はそれぞれ同じポインタの指す値を参照するので、独立しない。
こういう性質を持つことを、Reference Semantics を持つ と表現する。


参考: https://heart-of-swift.github.io/value-semantics/
