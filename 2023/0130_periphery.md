不要なコードを検出してくれるツール

https://github.com/peripheryapp/periphery

下記のようなswiftコードを書いたときのログ → https://github.com/takeshi-1000/my_memo/blob/main/log/2023/0130_periphery_log.txt

```
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func testHoge() {
        print("@@@")
    }

}
```
