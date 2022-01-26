# 20220126

# git@github.com: Permission denied (publickey) 
このリポジトリをローカルで作成しpushする際に下記のようなエラー発生

```
The authenticity of host 'github.com (XX.XX.XX.XX)' can't be established.
ED25519 key fingerprint is SHA256:+*****************************.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

[こちら](https://qiita.com/shizuma/items/2b2f873a0034839e47ce)の記事を参考にpushできるようになる

## 実際に対応した手順

1. `$ cd ~/.ssh` で鍵を入れるフォルダに移動
2. `$ ssh-keygen -t rsa` で鍵を作成（何か聞かれた場合は全てEnter押せば問題なし）
3. https://github.com/settings/ssh をブラウザで開く
4. 画像右上の `New SSH Key` をクリックする

<img src="https://user-images.githubusercontent.com/16571394/151180781-e96fc5e1-a9fc-47f0-acb2-01b68a77cd9e.png" width="800">

5. 適当にタイトルをつけ、鍵を入力して`Add SSH Key` をクリックする

※鍵は `$ pbcopy < ~/.ssh/id_rsa.pub` でコピー可能

<img width="800" alt="スクリーンショット 2022-01-26 23 24 02" src="https://user-images.githubusercontent.com/16571394/151181088-4dfddc4d-73c2-4c9f-b67c-69e73abe3d00.png">

6. `ssh -T git@github.com` で、`Hi (account名)! You've successfully authenticated, but GitHub does not provide shell access.` となっていればOK


# mac os コマンドメモ

## $ {A} && {B}

Aを実行して、Bを実行する。

※ディレクトリを作成しつつ、そのディレクトリに移動したい場合があった際に、わざわざ2回打たなくて済むようになる

（例）
`mkdir test && cd test`

## touch {A}

Aという空のファイルを作成する

(例)
`touch .gitignore`

## ls -a

隠しファイル含め、ファイルを一覧表示する
