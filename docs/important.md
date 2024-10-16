# プログラムの実行

- PCにプログラムを実行させるには、メモリとCPU、また実行させたい機械語が必要
- ざっくり書くとCPUは演算をし、メモリはその演算結果を格納したり、演算するための情報/CPUが実行したい命令を持っていたりする。
- CPU自身もレジスタなる、メモリに変わるような記憶領域があり、それらも駆使して機械語を実行している。

<img width="616" alt="スクリーンショット 2022-08-23 6 47 31" src="https://user-images.githubusercontent.com/16571394/186024647-ebe1af85-e835-4abd-a2d7-a6b79b1197b7.png">


## コンパイルやインタプリタについて

- 中央演算装置（CPU/メモリ等）に機械語を入力させることが最終的にできていればよく、その機械語の入力へ変換する工程が大きく二つある
- 一つはコンパイルで、中央演算装置に読み出してもらいたい機械語の生成を実行時とは別に作成しておき、それを実行させたい際に入力として渡す。
- もう一つはインタプリタで、中央演算装置に読み出してもらいたい機械語の生成を、実行時にまとめて行うこと。
- Javaにおけるインタプリタとコンパイルのいいとこ取りみたいな、JITコンパイル/AOTコンパイルみたいな話もある

<img width="809" alt="スクリーンショット 2022-08-23 6 49 01" src="https://user-images.githubusercontent.com/16571394/186024841-97cc8b27-252f-4041-b3b9-0c83344b8328.png">

<img width="800" alt="スクリーンショット 2022-08-23 6 49 07" src="https://user-images.githubusercontent.com/16571394/186024857-a528ff4d-4b46-4a72-9468-dac7cd23bb59.png">

> JVM内にはインタプリタと(JIT)コンパイラが同居しており、1行1行読んでマシン語に変換するのか、まとまった単位で「コンパイル」するのか、の2つの機能の組み合わせによってJavaプログラムが実行されている

らしい

参考: https://qiita.com/zd6ir7/items/20755a3d33480aa7a6c7

# プログラミング

## ソースコードがCPUが実行できる実行形式に変換されるまでの流れ

<img width="741" alt="スクリーンショット 2022-05-27 8 48 46" src="https://user-images.githubusercontent.com/16571394/170601940-2d2b1bd9-d7c5-40fa-b1d6-5ba3747fe57d.png">

- プリプロセスとは、C言語のソースコードをコンパイラが解釈できるレベルのプリミティブなC言語にするための、工程 ( `gcc -E test.c` )
- コンパイルとは、プリプロセス処理を通じて吐き出されたプリミティブなC言語のコードを、アセンブリコードにするための工程
- アセンブルとは、コンパイルを通じて作成されたアセンブリコードを、機械語を含むオブジェクトファイルにするための工程
- リンクとは、アセンブルによって作成された多くのオブジェクトファイルを一つの実行形式に、結合して完全な機械語にするための工程

### C言語で各工程をやってみる

```
gcc -E main.c （プリプロセスコード出力）
gcc -S main.c (アセンブリコード出力)
gcc -c main.c （アセンブルコード出力）
gcc ファイル名.o ファイル名.o -o 実行ファイル名 (実行形式出力)

```
参考: https://daeudaeu.com/exe/#i-2
