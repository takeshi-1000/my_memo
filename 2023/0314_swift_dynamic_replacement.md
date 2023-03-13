swift native の method swizzling

参考: https://github.com/apple/swift/commit/1e82ef8df778cc6f2fb02c498806082cf7a079b1#diff-43341e47555a12f90ec675c97d3172066a26a1571894cdbb933ba748398b0c4c

```
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear {
            Hoge().testHoge() // geho,geho
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Hoge {
    dynamic func testHoge() {
        print("hoge,hoge")
    }
}

extension Hoge {
    @_dynamicReplacement(for: testHoge())
    func _replacementForPrintThis() {
        print("geho,geho")
    }
}
```

==============

1. protocol定義
2. そのprotocolを上記のHogeにかます
3. Hogeのextensionでdynamic replacement をしてみる
4. できそう

```
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear {
            Hoge().testHoge()
            Hoge().testA() // geho2,geho2
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Hoge: ProtocolTest {
    dynamic func testA() {
        print("hoge2,hoge2")
    }
    
    dynamic func testHoge() {
        print("hoge,hoge")
    }
}

extension Hoge {
    @_dynamicReplacement(for: testHoge())
    func gehoGeho() {
        print("geho,geho")
    }
    
    @_dynamicReplacement(for: testA())
    func gehoGeho2() {
        print("geho2,geho2")
    }
}

protocol ProtocolTest {
    func testA()
}
```
====

protocol View の onAppearのmethod swizzlingしようとした時にコンパイラエラーが止まらなかったので、その前段として自作onAppearでやってみたやつ

```
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear {
            Hoge().testHoge()
            Hoge().testA()
            Hoge().onAppear() // geho3,geho3
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Hoge: ProtocolTest {
    dynamic func testA() {
        print("hoge2,hoge2")
    }
    
    dynamic func testHoge() {
        print("hoge,hoge")
    }
    
    dynamic func onAppear(perform action: (() -> Void)? = nil) {
        print("hoge3,hoge3")
    }
}

extension Hoge {
    @_dynamicReplacement(for: testHoge())
    func gehoGeho() {
        print("geho,geho")
    }
    
    @_dynamicReplacement(for: testA())
    func gehoGeho2() {
        print("geho2,geho2")
    }
    
    @_dynamicReplacement(for: onAppear(perform:))
    func testOnAppear(perform action: (() -> Void)? = nil) {
        print("geho3,geho3")
    }
}

protocol ProtocolTest {
    func testA()
}
```
