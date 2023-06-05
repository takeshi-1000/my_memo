develop 

- <- feature/test3
- <- feature/test4
- <- feature/test5

のような感じで既にマージされているとする

```
$ git log --oneline -30
4a50ca8 (HEAD -> develop) Merge branch 'feature/test5' into develop // ⭐️ feature/test5 merge
3163b43 (feature/test5) test5_4追加
0c3bf09 test5_3追加
8cdf4bd test5_2追加
ef8d242 test5追加
113114f Merge branch 'feature/test4' into develop // ⭐️ feature/test4 merge
a09bdea (feature/test4) test4_3追加
2c21c58 test4_2追加
ad797fe test4追加
0ec7a29 (origin/develop) Merge branch 'feature/test3' into develop // ⭐️ feature/test3 merge
1f4f1cc (origin/feature/test3, feature/test3) test3追加
c13e8fc (feature/test2) test2テキスト追加 // ⭐️ ここまで戻したい
8d02034 (master, feature/test1) test
fa26d9c first init
```

上記のようなログで、現在の `HEAD` から `c13e8fc`までrevertしたい時

元々[こちら](https://hiro8blog.com/revert-commits-all-at-once/)を参考に `git revert HEAD...HEAD~100 --no-edit` みたいな方法を考えていたが、
マージコミットの場合、後でも出るが、マージコミット一つ一つに対してメインラインの親番号を指定する必要があるので、まとめてやる感じにはできなそうだった

下記のgit show コマンドで、feature/test5 のマージコミットを見ると、2つのハッシュ値、 `113114f 3163b43`があり、 

```
$ git show 4a50ca8
commit 4a50ca85989247fccd68f8683286667278b4f422 (HEAD -> develop)
Merge: 113114f 3163b43
Author: takeshi-1000 <xxxxx@gmail.com>
Date:   Tue Jun 6 07:48:55 2023 +0900

    Merge branch 'feature/test5' into develop
```

それぞれマージコミットの親コミットという表現をするみたい。

詳しい説明は https://git-scm.com/docs/git-revert#Documentation/git-revert.txt---mainlineparent-number 参考

> revert to reverse the change relative to the specified parent.

-m 2　の場合がちょっとよくわからないので完全に理解できてない

ひとまず下記のようにマージコミットをrevertしていくでよさそう

```
$ git revert -m 1 4a50ca8
$ git revert -m 1 113114f --no-edit
$ git revert -m 1 0ec7a29 --no-edit
```
