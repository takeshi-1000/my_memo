ここではactorの挙動についてちょっとメモしておく

View
```
struct HogeContentView: View {
    @StateObject var vm: HogeVM
    @StateObject var fugaVm: FugaVM
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            vm.foo()
            
            Task {
                print("3. Thread.isMainThread :: \(Thread.isMainThread)")
            }
            
            fugaVm.foo()
        }
        .task {
            await vm.bar()
        }
//        .modifier(TestViewModifier(str: String(describing: type(of: self))))
    }
}
```

VM
```
class HogeVM: ObservableObject {
    
    func foo() {
        print("Thread.isMainThread :: \(Thread.isMainThread)") // メインスレッドから呼ばれたので、true
        
        Task {
            print("Thread.isMainThread :: \(Thread.isMainThread)")  // ここはfalse
        }
    }
    
    @MyActor
    func bar() async {
        print("Thread.isMainThread :: \(Thread.isMainThread)") // 明示的にカスタムのアクターが指定されているので、false
        
        Task { @MainActor in
            print("Thread.isMainThread :: \(Thread.isMainThread)") // 明示的にメインアクターが指定されているので、true
        }
    }
}

@MainActor
class FugaVM: ObservableObject {
    
    func foo() {
        print("Thread.isMainThread :: \(Thread.isMainThread)") // メインアクターがVM自体に指定されているので、true
        
        Task {
            print("Thread.isMainThread :: \(Thread.isMainThread)") // メインアクターがVM自体に指定されているので、true
        }
    }
    
    @MyActor
    func bar() async {
        print("Thread.isMainThread :: \(Thread.isMainThread)") // カスタムのアクターがVM自体に指定されているので、false
    }
}

@MyActor // 多分やめといた方がいい？
class FooVM: ObservableObject {
    
    func foo() {
        print("4. Thread.isMainThread :: \(Thread.isMainThread)")
        
        Task {
            print("5. Thread.isMainThread :: \(Thread.isMainThread)")
        }
    }

    @MainActor
    func bar() async {
        print("9. Thread.isMainThread :: \(Thread.isMainThread)")
        
        Task { @MyActor in
            print("10. Thread.isMainThread :: \(Thread.isMainThread)")
        }
    }
}

```

- globalActorはvm全体につけるべきではなさそう。（vmがviewの状態管理オブジェクト操作するものだとしたら。下記にvmに無理矢理globalActor指定した場合にエラー表示示してみた）
- アクターの優先順位は、Taskの関数内部 > メソッドのアクター指定 > オブジェクトのアクター指定の順に優先度が低くなる
- vm全体にMainActor指定しておいて、ドメイン側は特に指定しなければワーカースレッドになって、値の結果がVMに戻された時にメインスレッド保証になるのでよさそう?
- グローバルアクター(カスタムのアクター)はUIに近い層で行うとかえって、メインスレッドで行いたい処理でぶつかりそうな感じがするので、ドメインに降下させるか、別のオブジェクトを作っておいた方がいいのかも

参考: https://qiita.com/yimajo/items/90b298d2e457a308a7a8

<img width="1092" alt="スクリーンショット 2023-02-06 9 57 52" src="https://user-images.githubusercontent.com/16571394/216859504-e84c56bd-5404-4182-bc16-40de65917ca4.png">

<img width="1084" alt="スクリーンショット 2023-02-06 10 10 16" src="https://user-images.githubusercontent.com/16571394/216859612-f4f906da-9d48-4a64-84bf-62a9cb13f553.png">
