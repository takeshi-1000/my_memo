※ここで書くのは、俺俺clean architectureの可能性があり、厳密な一次情報を踏まえたものでもないですが、<br>
経験上それに近しいものなのでclean archtectureと指しています

自分が参画しているプロジェクトで下記のような設計上の問題があった

- ドメイン層をシングルトンで管理しており、ドメインのインターフェースでその内部のメンバ変数のCRUD処理を行う
  - ドメイン層は複数画面で共有する場合があり、ステートフルなアプリの特性上、複数画面が同じドメインを共有するとドメイン層の変更がVM/Viewに通知されかねない
- UserDefaultやKeyChainStoreのCRUD処理が、Entity内部で定義されていたり、utilityな曖昧な命名であった

## 改善した内容

`UserDefaultやKeyChainStoreのCRUD処理が、Entity内部で定義されていたり、utilityな曖昧な命名であった` 件の解決方法

APIリクエストはドメイン層から、リポジトリ層をかましたCRUD処理のような立て付けになっていたので、それをUserDefault, KeyChainStoreでも真似する形で対応してみた。<br>
イメージとして下記の図のような形

<img width="491" alt="スクリーンショット 2023-02-28 9 36 02" src="https://user-images.githubusercontent.com/16571394/221721666-e19f8f42-9b9a-4aeb-8c72-6b5977aad0e7.png">


### UserDefaultのコード

工夫したところは、apiのendpointのような位置付けで `UserDefaultRepositoryKey` を追加し、<br>それをドメインからCRUDしていくような形でプログラムしやすいようにしてみたこと

```
enum UserDefaultRepositoryKey: String {
    case hogehoge = "hogehoge"
}

protocol UserDefaultRepositoryInput {
    func saveInt(_ value: Int, key: UserDefaultRepositoryKey)
    func getInt(key: CommonUserDefaultRepositoryKey) -> Int?
}

class UserDefaultRepository: UserDefaultRepositoryInput {
    private let standard: UserDefaults
    
    init(standard: UserDefaults = .standard) {
        self.standard = standard
    }
    
    func saveInt(_ value: Int, key: CommonUserDefaultRepositoryKey) {
        standard.set(value, forKey: key.rawValue)
    }
    
    func getInt(key: CommonUserDefaultRepositoryKey) -> Int? {
        return standard.integer(forKey: key.rawValue)
    }
}
```

### KeychainStore

工夫したところは、apiのendpointのような位置付けで `KeyChainStoreRepositoryKey` を追加し、<br>それをドメインからCRUDしていくような形でプログラムしやすいようにしてみたこと

```
import UICKeyChainStore

enum KeyChainStoreRepositoryKey: String {
    case hogehoge = "hogehoge"
}

protocol KeyChainStoreRepositoryInput {
    func saveStr(_ value: String, forKey key: KeyChainStoreRepositoryKey) -> Bool
    func getStr(forKey key: KeyChainStoreRepositoryKey) -> String?
    func removeItem(forKey key: KeyChainStoreRepositoryKey) -> Bool
}

class CommonKeyChainStoreRepository: KeyChainStoreRepositoryInput {
    private let keychaninStore: UICKeyChainStore
    
    init(service: String? = Bundle.main.bundleIdentifier) {
        keychaninStore = UICKeyChainStore(service: service)
    }
    
    func saveStr(_ value: String, forKey key: CommonKeyChainStoreRepositoryKey) -> Bool {
        keychaninStore.setString(value, forKey: key.rawValue)
    }
    
    func getStr(forKey key: CommonKeyChainStoreRepositoryKey) -> String? {
        keychaninStore.string(forKey: key.rawValue)
    }
    
    func removeItem(forKey key: CommonKeyChainStoreRepositoryKey) -> Bool {
        keychaninStore.removeItem(forKey: key.rawValue)
    }
}
```

## 今後取り入れてみたい内容

`ドメイン層をシングルトンで管理しており、ドメインのインターフェースでその内部のメンバ変数のCRUD処理を行う` 件の解決

<img width="496" alt="スクリーンショット 2023-02-28 9 40 30" src="https://user-images.githubusercontent.com/16571394/221722241-472ccd9a-5494-48eb-bf40-1327761c22d3.png">

### コード

工夫したところは、<br>
命名を `ProcessMemory` としてみたところ。UserDefaultと比べてみた時に、シングルトンの実態はストレージではなくアプリプロセスに割り当てられてメモリの話。もしかしたらMemoryでもいいかもだけど、
<br>Memoryだとハードウェアをイメージするので、アプリプロセスに紐づくMemoryみたいな感じにしてみて、アプリプロセスが終了したときに解放される（メモリがクリアされる）ようなことをイメージしてもらえたら嬉しいなと思ったので
<br>そんな命名にしてみた。

UserDefaultやKeyChainと違って、CRUD処理を行うためのインターフェースが（ユーザーグラウンドでかけるコードの話）最終的にはメンバ変数そのものなので、<br>
メンバ変数ごとにインターフェースを追加してあげて、内部のshared変数を使ってメンバ変数を特定し、CRUD処理を行う

```
protocol ProcessMemoryRepositorrHogeInput {
    func getHoge() -> Hoge
    func updateHoge(hoge: Hoge)
}

class ProcessMemoryRepository {
    private var _shared: ProcessMemoryRepository = .init() 
    private var _hoge: Hoge = .init()
}

extension ProcessMemoryRepository: ProcessMemoryRepositoryDoorInput {

    func getHoge() -> Hoge {
        _shared._hoge
    }

    func updateHoge(hoge: Hoge) {
        _shared._hoge = hoge
    }
}
```

