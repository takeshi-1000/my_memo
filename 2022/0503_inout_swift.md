## [swift] inout パラメータ

- 外部の変数を関数に入れて、その状態が呼び出し関数元に影響する感じ
- 下のサンプルコードにもあるとおり、パラメータを設定する際は`&`記号を渡して、inoutパラメータであることを明示する
- 基本的には使うのは避けた方が良さそうな感じはするが、呼び出し元と呼び出し先でどちらもマークがついていることはありがたい
- 参照渡しの場合に特別な記載があり、これを第一級の参照でないみたいな表現をする([参考](https://qiita.com/omochimetaru/items/c5f0eabde516e4713367#%E5%8F%82%E7%85%A7%E4%BB%95%E6%A7%98%E3%81%AE%E7%99%BA%E5%B1%95))

サンプルコード
```
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a // temporaryAという値型のInt変数にaを入れる（bに入れるためのコピーを作成しておく）
    a = b
    b = temporaryA
}

```

### mutating 修飾子との関係性

ある値型インスタンスのミュータブルなメンバに対しての変更を、メソッドとして定義する場合、下記のようになる。

```
struct Hoge {
  var testVal: String = ""
  
  mutating func test() { // 暗黙のself
    testVal = "called"
  }
}
```

呼び出し方は、下記のような感じ

```
var hoge = Hoge()
hoge.test()
```

関数として定義する場合は以下の感じ（呼び出し方も併記）

```
struct Hoge {
  var testVal: String = ""
}

func test(hoge: inout Hoge) {
    hoge.testVal = "called"
}

==

var hoge = Hoge()
test(hoge: &hoge)
```

上記から、mutating 修飾子は、暗黙の引数 self に inout を付けることに対応している

```
mutating func test() { // 暗黙のinout self が入っている
    testVal = "called"
}
```

参考: https://heart-of-swift.github.io/value-semantics/how-to-use-value-types#:~:text=%E3%81%8C%E3%81%A7%E3%81%8D%E3%81%BE%E3%81%99%E3%80%82-,mutating%20func,-consumePoints%20%E3%82%92%E9%96%A2%E6%95%B0

## [swift] generics

### 関数

- 中身は一緒で、型だけ違うような場合に役立つ
- 下記のサンプルでは、呼び出しによってTがなんなのか決まる。（Tは呼び出されるまで決まらない）

```
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

```
#### 型パラメータ

- 関数名の後に `<T>` と書かれる
- 複数OK
- 名前は、T, U, V などと書かれることが多いが、Dictionary<Key, Value> の Key や Value、Array<Element> の Element のような説明的な名前がついていることもあり、必要に応じて使い分ける
    
### 型
    
- クラス名の横に`<T>`と書き、クラスのスコープで関数や、プロパティの方として定義できる
- 下のElementは、class/structどちらでも良い
    
```
struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
```


