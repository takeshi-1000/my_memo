# 20220126

## git@github.com: Permission denied (publickey) 
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

[こちら](https://qiita.com/shizuma/items/2b2f873a0034839e47ce)の記事を参考にpushできるようになりました。
