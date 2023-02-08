## pullrequest / push 時のbitrise/github連携メモ

### トリガーの設定

下記の順番にアクセス

1. Dashboard
2. 対象のアプリ
3. worlflows
4. triggers

下記のように設定

<img width="1285" alt="スクリーンショット 2023-02-08 8 54 14" src="https://user-images.githubusercontent.com/16571394/217393765-e8708fe9-1912-4854-a3f3-87beccc85009.png">

<img width="1277" alt="スクリーンショット 2023-02-08 8 54 21" src="https://user-images.githubusercontent.com/16571394/217393784-f8961787-0930-4a2d-808d-9d368c7157ce.png">

### Webhookの設定

下記の順番にアクセス

1. Dashboard
2. 対象のアプリ
3. 設定
4. integrations

下記の箇所を設定。（画像は設定された後）

<img width="899" alt="スクリーンショット 2023-02-08 8 58 08" src="https://user-images.githubusercontent.com/16571394/217394256-817be528-5b1f-41af-b6d1-028ebaa0d67c.png">

githubのアプリのSettingsからWebhookの設定見ると、作成されていることがわかる。（automatically で作成した）

<img width="834" alt="スクリーンショット 2023-02-08 9 02 14" src="https://user-images.githubusercontent.com/16571394/217394743-8839c1e6-087a-4358-a5c3-9402b4a2074c.png">

### 結果 

こんな感じになる。

<img width="885" alt="スクリーンショット 2023-02-08 8 58 48" src="https://user-images.githubusercontent.com/16571394/217394357-e061c154-f54f-439e-90e1-9b543d5e1f1e.png">

<img width="971" alt="スクリーンショット 2023-02-08 9 00 51" src="https://user-images.githubusercontent.com/16571394/217394558-c2cc1058-2e81-4264-b7eb-aa4f37fc678e.png">


