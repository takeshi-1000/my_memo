## 背景

現在参画中のプロジェクトで、下記のような現象が起こった

- あるwaonのidm(felica)について、iOSでは `11XXXX` であり、 Android/Firmwareでは `01XXXX` であること（XXXXは同じ）
  - またiOSが上記idmを読み取った際のシステムコードは `0xFE00`

なぜidmが変わってしまうのか、idmの定義を深掘りし、その時分かったことをまとめます。
なお違ってしまった原因はまだ特定できず現在も調査中ですが、その原因の有力な説として、本ページに記載された内容もあります。

### 補足
- iOSで取得した際のidmは https://developer.apple.com/documentation/corenfc/nfcfelicatag/3043776-currentidm で取得したもの
  - システムコードは、  https://developer.apple.com/documentation/corenfc/nfcfelicatag/3043777-currentsystemcode で取得したもの

## idmとは

- リーダ、ライタが相手のカードを特定するために使う識別子である
- idmの上位2バイトを製造者コード、それに続く6バイトをカード識別番号と呼ぶ
  - 製造者コードの上位4ビットは、カード内システム番号を表す

https://www.sony.co.jp/Products/felica/business/tech-support/data/M619_FeliCaTechnologyCodeDescriptions_1.51j.pdf P.5あたり

<img width="595" alt="スクリーンショット 2023-03-07 5 00 17" src="https://user-images.githubusercontent.com/16571394/223217695-9d273993-9210-463d-a239-26fceaf90619.png">

## システム

システムとは論理的なカードの単位を表す

https://www.sony.co.jp/Products/felica/business/tech-support/data/card_usersmanual_2.11j.pdf P.30

### システムコード

- システムコードは、リーダ・ライタがカード(システム)を特定するために用いられる
- 1枚のカードがシステム分割されている状態でも、リーダ・ライタからは各システムが一枚のカードとして認識されるので、システム0~Nのシステムコードを指定することで、リーダ・ライタは目的のシステムを捕捉することが可能

https://www.sony.co.jp/Products/felica/business/tech-support/data/card_usersmanual_2.11j.pdf P.30

### システム分割

- カード製造時にはシステムは0しか存在しないが、システム分割により、システム1, システム２... システムN と言う感じで増やすことが可能

https://www.sony.co.jp/Products/felica/business/tech-support/data/card_usersmanual_2.11j.pdf P.31

- システム分割によって、カード内製造番号のシステム番号が変わってくる
  - システム0の上位4bitは、0000bとなり、システム1の上位4bitは、0001となる。
  - したがって製造者コード内のカード内システム番号は、下記のように変わってくる

|システム分割回数|カード内システム番号|
|---|---|
|0|0000b, 0x0|
|1|0001b, 0x1|
|2|0010b, 0x2|
|3|0011b, 0x3|

## 以上より予想できること

- iOSで読み取ったidmは1回目の分割時に生成されたシステム1のシステムであり、そのidmを取得したのではないかということ 
- Android, Firmwareで読み取ったidmは、一番最初にあったシステム0のシステムであり、そのidmを取得したのではないかということ 
  - [参考](http://www.kokozo.net/AndroidNFC_FeliCa/#:~:text=0xFFFF%E3%81%A7polling%E3%81%97%E3%81%9F%E7%B5%90%E6%9E%9C%E3%81%AA%E3%82%93%E3%81%A7%E3%81%99%E3%81%AD%EF%BC%8E%EF%BC%8E) ( `FeliCaカードなどでも試してみたところ，NfcAdapter.EXTRA_IDでとれるIDmやNfcF.getSystemCode()で取れるシステムコードは，システム分割の１番めのシステムのもののようです．ということは，0xFFFFでpollingした結果なんですね．．．` )

### 他参考記事

https://qiita.com/treastrain/items/04f50a91f70fd6480fc0




