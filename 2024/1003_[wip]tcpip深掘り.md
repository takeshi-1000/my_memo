

- tcpipの自身の理解度をもう少し図に書き溜めたいので、書いてみる with ChatGPT
- tcpipが語られる時、出発地点のクライアントPCと、最終目的であるサーバーの2つ間でしか表現されてないことがほとんどなので、もう少しその間の通信機器も図示しながら、tcpipの仕組みの理解度を高める

## ケース1

有線で接続しているPCからブラウザを使用して、httpリクエスト（http://www.hoge.co.jp/）を送って表示

```mermaid
sequenceDiagram
    participant u as ユーザー
    box  rgb(241,247,252) クライアントPC
     participant p as ブラウザ<br>アプリケーション層
     participant t as トランスポート層
     participant i as インターネット層
     participant l as リンク層
     participant b as 物理層
    end

    box rgb(241,247,247) 有線LAN
     participant wb as 物理層
     participant wl as リンク層
    end

    box rgb(241,247,252) ローカルDNSサーバー
     participant db as 物理層
     participant dl as リンク層
     participant di as インターネット層
     participant dt as トランスポート層
     participant dp as DNSサーバーアプリケーション (BIND)
    end
    
    u->>p: ブラウザアプリケーションを立ち上げて、<br> http://www.hoge.co.jp/ を入力/送信
    p->>p: DNSクエリ作成 (ドメイン名含む)
    p->>t: UDPを使用してトランスポート層へ送信

    Note over t: 付加される情報:<br>・送信元ポート: ランダムに選択されたポート<br>・宛先ポート: 53（DNSのための標準ポート）<br>データ: DNSクエリ

    t->>i: DNSクエリをインターネット層へ
    Note over i: 付加される情報:<br>・送信元IP: クライアントPCのIPアドレス<br>・宛先IP: ローカルDNSサーバーのIPアドレス

    i->>l: パケットをリンク層へ
    Note over l: 付加される情報:<br>・送信元MACアドレス<br>・宛先MACアドレス

    l->>b: クライアントPCの物理層で送信開始
    b->>wb: 有線LANを介して送信 (物理層)
    wb->>wl: データをリンク層へ渡す
    wl->>db: DNSサーバーの物理層へ送信
    db->>dl: パケットをリンク層に渡す
    dl->>di: パケットをインターネット層に渡す
    di->>dt: DNSクエリをトランスポート層に渡す
    Note over dt: 受信情報:<br>・宛先ポート: 53<br>・送信元ポート: クライアントPCのランダムポート<br>・データ: DNSクエリ

    dt->>dp: DNSクエリをアプリケーション層に渡す
    dp->>dp: ローカルDNSサーバーで名前解決（キャッシュ確認・問い合わせ開始）

    Note over dp: DNSサーバーがクエリを受信し、<br>キャッシュを確認、必要なら外部問い合わせ
    Note right of dp: キャッシュに結果がない場合、最終のDNSサーバーに問い合わせる

    dp-->>dt: 解決結果をトランスポート層に返す
    dt-->>di: パケットをインターネット層に返す
    di-->>dl: パケットをリンク層に渡す
    dl-->>db: 物理層へ送信
    db-->>wl: 有線LANを介してクライアントPCへ返送 (物理層)
    wl-->>wb: データをリンク層に渡す
    wb-->>b: クライアントPCの物理層でパケット受信
    b-->>l: パケットをリンク層に渡す
    l-->>i: パケットをインターネット層に渡す
    i-->>t: パケットをトランスポート層に渡す
    t-->>p: ブラウザアプリケーションにDNS解決結果を返す

    Note over p: WebサーバーIPを取得したので、<br>HTTPリクエストを送信開始

```

## ケース2

無線でキャリア通信しているiPhoneを使用して、httpsリクエスト（https://www.google.co.jp/）を送って表示
