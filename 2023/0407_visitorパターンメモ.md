あるオブジェクトの要素から何かの値を算出したい場合に、<br>
そのオブジェクトを直接扱うのではなく<br>
Visitorオブジェクトを経由して、算出する方法

```
protocol BoolElement {
  func accept(vistor: BookVisitor)
}

class Book: BookElement {
   var title: String
   var price: Int
  func accept(vistor: BookVisitor) {
    visitor.visit(self)
  }
}

protocol BookVisitor {
  func visit(_ book: Bool)
}

class DiscountCalculator: BookVisitor {
  private var discountPrice: Int = 0
 
  func visit(_ book: Bool) {
    if book.title == "hogeHoge" {
       discountPrice = 1000
    }
  }
  
  func getDiscountPrice() -> Int {
     return discountPrice
  }
}

// 使う側

let book = Book()
let bookVistorOfDiscount = DiscountCalculator()
book.accept(bookVisitor)
let discountPrice = bookVistorOfDiscount.getDiscountPrice()

// あらたにVisitorが増える場合

let book = Book()
let bookVistorOfDiscount = DiscountCalculator()
let bookVistorOfHoge = HogeCalculator()
let bookVistorOfHoge2 = Hoge2Calculator()
let bookVistorOfHoge3 = Hoge3Calculator()

book.accept(bookVisitor)
book.accept(bookVistorOfHoge)
book.accept(bookVistorOfHoge2)
book.accept(bookVistorOfHoge3)

let discountPrice = bookVistorOfDiscount.getDiscountPrice()
let hoge = bookVistorOfHoge.getHoge()
let hoge2 = bookVistorOfHoge2.getHoge2()
let hoge3 = bookVistorOfHoge3.getHog3()

// Visitorパターンを用いない場合
let book = Book()
let discountPrice: Int
if book.title {
  disCountPrice = 1000
} 

```

- 多少冗長な気もするが、値の算出箇所したい箇所で、その算出に必要なオブジェクトの構造に依存しないのは良さそう。
- Visitor自身はもちろんオブジェクトの構造に依存はする
  - なので、上記の例だと、 `title` の変数名が変わる or 削除されるなどした場合は、Visitorに修正が入りつつも、呼び出し側ではその算出コード自体がなくならない限りは特に影響しないので、Visitorパターンを使ってない場合に比べてより疎結合な状態になり運用しやすそう
