## [Swift/UIKit] 透明度が1以下のものを重ねた場合の挙動

### 背景

<img width="199" alt="スクリーンショット 2022-10-28 18 12 04" src="https://user-images.githubusercontent.com/16571394/198550997-b0a26808-bf9f-4bf3-9daf-1fdfe6df8ab6.png">

添付のようなUIButtonを作る時があった。
タイトルも、背景色も同じなのに、なぜかタイトルが浮き出てしまう。

感覚的には以下の添付のように、塗りつぶされてもいいような気がしており、
ここの疑問を払拭するのに時間がかかった。

<img width="231" alt="スクリーンショット 2022-10-28 18 14 06" src="https://user-images.githubusercontent.com/16571394/198551314-67997202-445c-4a92-ae4e-3b09e62a7896.png">

おそらく、下のViewがタイトルの色と合わさって、それが重なった結果であると思われる。もう少し言語化できないかなあという感じ、CALayer的なやつとか
