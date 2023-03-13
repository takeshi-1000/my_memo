実行時に、メソッドの処理内容を入れ替えたい場合に使う

```
import Foundation
import UIKit

class SwizzleExecutor {
    // https://developer.apple.com/documentation/objectivec/1418769-method_exchangeimplementations
    // https://qiita.com/ShingoFukuyama/items/7aa9fe2a2218d4d42d88
    
    func test() {
        let originalMethod = class_getInstanceMethod(UIViewController.self, #selector(ViewController.viewDidLoad))
        let swizzledMethod = class_getInstanceMethod(SwizzleExecutor.self, #selector(SwizzleExecutor.test_viewDidLoad))
        
        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            // switch implementation..
            print("Swizzle!!")
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    @objc private func test_viewDidLoad() {
        print("@@@ testViewDidLoad :: \(ProcessInfo.processInfo.arguments.joined(separator: ","))")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            print("hoge :: \(UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController)")
            
//            UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.present(ViewController2(), animated: true)
//            print("@@@ 5 \(UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController)")
            (UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController as! UINavigationController)
                .pushViewController(ViewController2(), animated: true)
        }
    }
}
```
