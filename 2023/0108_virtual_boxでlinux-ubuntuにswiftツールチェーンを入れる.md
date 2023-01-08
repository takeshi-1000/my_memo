https://zenn.dev/seshat/articles/3151c5643785dd を元にできた

virtual box にubuntuの仮想環境入れたもので試した

ログ https://github.com/takeshi-1000/my_memo/blob/main/log/linux_ubuntu_swifttoolchain_install.log

## mac, linux-ubuntuで実行バイナリを作ってみる

swift ファイル

```
print("hello")
```

### mac

- OS: Catalina, 10.15.4
- swift: 5.1.3
- cpu: intel

```
$ swiftc test.swift -emit-executable -v 
Apple Swift version 5.1.3 (swiftlang-1100.0.282.1 clang-1100.0.33.15)
Target: x86_64-apple-darwin19.4.0
"/Applications/Xcode 11.3.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift" -frontend -c -primary-file test.swift -target x86_64-apple-darwin19.4.0 -enable-objc-interop -sdk "/Applications/Xcode 11.3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk" -color-diagnostics -module-name test -o /var/folders/vy/byx36ckn2qvd4mdwkmv2njch0000gn/T/test-fead97.o
"/Applications/Xcode 11.3.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld" /var/folders/vy/byx36ckn2qvd4mdwkmv2njch0000gn/T/test-fead97.o "/Applications/Xcode 11.3.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/clang/lib/darwin/libclang_rt.osx.a" -syslibroot "/Applications/Xcode 11.3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk" -lobjc -lSystem -arch x86_64 -L "/Applications/Xcode 11.3.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx" -L "/Applications/Xcode 11.3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/usr/lib/swift" -macosx_version_min 10.15.0 -no_objc_category_merging -o test
```

#### 動的ライブラリ見てみる

```
$ otool -L test
test:
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1281.0.0)
	/usr/lib/swift/libswiftCore.dylib (compatibility version 1.0.0, current version 1100.8.255)
```

### linux-ubuntu

- OS: Ubuntu 18.0.4
- swift: 5.7.2
- cpu: intel

```
binaryanalysis@ubuntu:~/Desktop/swift-test$ swiftc test.swift -emit-executable -v
Swift version 5.7.2 (swift-5.7.2-RELEASE)
Target: x86_64-unknown-linux-gnu
/home/binaryanalysis/usr/bin/swift-frontend -frontend -c -primary-file test.swift -target x86_64-unknown-linux-gnu -disable-objc-interop -color-diagnostics -new-driver-path /home/binaryanalysis/usr/bin/swift-driver -empty-abi-descriptor -resource-dir /home/binaryanalysis/usr/lib/swift -module-name test -o /tmp/TemporaryDirectory.jQ084Z/test-1.o
/home/binaryanalysis/usr/bin/swift-autolink-extract /tmp/TemporaryDirectory.jQ084Z/test-1.o -o /tmp/TemporaryDirectory.jQ084Z/test-2.autolink
/home/binaryanalysis/usr/bin/clang -fuse-ld=gold -pie -Xlinker -rpath -Xlinker /home/binaryanalysis/usr/lib/swift/linux /home/binaryanalysis/usr/lib/swift/linux/x86_64/swiftrt.o /tmp/TemporaryDirectory.jQ084Z/test-1.o @/tmp/TemporaryDirectory.jQ084Z/test-2.autolink -L /home/binaryanalysis/usr/lib/swift/linux -lswiftCore --target=x86_64-unknown-linux-gnu -v -o test
clang version 13.0.0 (https://github.com/apple/llvm-project.git c41f13252ed4b49f246729b4d91ff521d5a6bf9d)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /home/binaryanalysis/usr/bin
Found candidate GCC installation: /usr/lib/gcc/i686-linux-gnu/8
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/7
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/7.5.0
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
Selected GCC installation: /usr/lib/gcc/x86_64-linux-gnu/7.5.0
Candidate multilib: .;@m64
Candidate multilib: 32;@m32
Candidate multilib: x32;@mx32
Selected multilib: .;@m64
 "/usr/bin/ld.gold" -pie -z relro --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o test /usr/lib/x86_64-linux-gnu/Scrt1.o /usr/lib/x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/7.5.0/crtbeginS.o -L/home/binaryanalysis/usr/lib/swift/linux -L/usr/lib/gcc/x86_64-linux-gnu/7.5.0 -L/lib/x86_64-linux-gnu -L/lib/../lib64 -L/usr/lib/x86_64-linux-gnu -L/home/binaryanalysis/usr/bin/../lib -L/lib -L/usr/lib -rpath /home/binaryanalysis/usr/lib/swift/linux /home/binaryanalysis/usr/lib/swift/linux/x86_64/swiftrt.o /tmp/TemporaryDirectory.jQ084Z/test-1.o -lswift_StringProcessing -lswift_Concurrency -lswiftCore -lswiftSwiftOnoneSupport -lswiftCore -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /usr/lib/gcc/x86_64-linux-gnu/7.5.0/crtendS.o /usr/lib/x86_64-linux-gnu/crtn.o

```

#### 動的ライブラリ見てみる

````
binaryanalysis@ubuntu:~/Desktop/swift-test$ objdump -p test

test:     ファイル形式 elf64-x86-64

プログラムヘッダ:
    PHDR off    0x0000000000000040 vaddr 0x0000000000000040 paddr 0x0000000000000040 align 2**3
         filesz 0x0000000000000230 memsz 0x0000000000000230 flags r--
  INTERP off    0x0000000000000270 vaddr 0x0000000000000270 paddr 0x0000000000000270 align 2**0
         filesz 0x000000000000001c memsz 0x000000000000001c flags r--
    LOAD off    0x0000000000000000 vaddr 0x0000000000000000 paddr 0x0000000000000000 align 2**12
         filesz 0x0000000000001100 memsz 0x0000000000001100 flags r-x
    LOAD off    0x0000000000001d68 vaddr 0x0000000000002d68 paddr 0x0000000000002d68 align 2**12
         filesz 0x000000000000031f memsz 0x0000000000000418 flags rw-
 DYNAMIC off    0x0000000000001d80 vaddr 0x0000000000002d80 paddr 0x0000000000002d80 align 2**3
         filesz 0x0000000000000230 memsz 0x0000000000000230 flags rw-
    NOTE off    0x000000000000028c vaddr 0x000000000000028c paddr 0x000000000000028c align 2**2
         filesz 0x0000000000000020 memsz 0x0000000000000020 flags r--
    NOTE off    0x0000000000002058 vaddr 0x0000000000003058 paddr 0x0000000000003058 align 2**0
         filesz 0x000000000000002f memsz 0x000000000000002f flags rw-
EH_FRAME off    0x00000000000010a4 vaddr 0x00000000000010a4 paddr 0x00000000000010a4 align 2**2
         filesz 0x000000000000005c memsz 0x000000000000005c flags r--
   STACK off    0x0000000000000000 vaddr 0x0000000000000000 paddr 0x0000000000000000 align 2**4
         filesz 0x0000000000000000 memsz 0x0000000000000000 flags rw-
   RELRO off    0x0000000000001d68 vaddr 0x0000000000002d68 paddr 0x0000000000002d68 align 2**3
         filesz 0x0000000000000298 memsz 0x0000000000000298 flags rw-

動的セクション:
  PLTGOT               0x0000000000002fe8
  PLTRELSZ             0x00000000000000d8
  JMPREL               0x0000000000000880
  PLTREL               0x0000000000000007
  RELA                 0x0000000000000760
  RELASZ               0x0000000000000120
  RELAENT              0x0000000000000018
  RELACOUNT            0x0000000000000005
  DEBUG                0x0000000000000000
  SYMTAB               0x00000000000002b0
  SYMENT               0x0000000000000018
  STRTAB               0x00000000000004a8
  STRSZ                0x000000000000022f
  GNU_HASH             0x00000000000006d8
  NEEDED               libswift_StringProcessing.so → ❗️この辺だと思う
  NEEDED               libswift_Concurrency.so → ❗️この辺だと思う
  NEEDED               libswiftCore.so → ❗️この辺だと思う
  NEEDED               libswiftSwiftOnoneSupport.so → ❗️この辺だと思う
  NEEDED               libc.so.6 → ❗️この辺だと思う
  INIT                 0x0000000000000958
  FINI                 0x0000000000000ed4
  FINI_ARRAY           0x0000000000002d68
  FINI_ARRAYSZ         0x0000000000000008
  INIT_ARRAY           0x0000000000002d70
  INIT_ARRAYSZ         0x0000000000000010
  RUNPATH              /home/binaryanalysis/usr/lib/swift/linux
  VERSYM               0x0000000000000710
  VERNEED              0x000000000000073c
  VERNEEDNUM           0x0000000000000001

````

## 感想

上記を試してみてなんとなく下記が理解できてきたように思う

- 機械語はcpuに依存している
- バイナリフォーマットはOSに依存していそう

![スクリーンショット 2023-01-08 8 09 38](https://user-images.githubusercontent.com/16571394/211173552-a8ae9afa-eed4-4a2a-96b8-82f7ca07e4ce.png)

https://github.com/takeshi-1000/my_memo/blob/main/2023/0107_llvm%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E3%81%A1%E3%82%87%E3%81%A3%E3%81%A8%E3%81%97%E3%81%9F%E4%BB%8A%E3%81%AE%E7%96%91%E5%95%8F.md#%E7%96%91%E5%95%8F%E7%90%86%E8%A7%A3%E3%81%8C%E6%AD%A3%E3%81%97%E3%81%84%E3%81%8B%E3%82%8F%E3%81%8B%E3%82%89%E3%81%AA%E3%81%84%E3%81%A8%E3%81%93%E3%82%8D

ここで話していたLLVMの理解が追いついてない部分について、
単純にバイナリフォーマットにおける差分をどこでカーバーしているか(llvmなのか)を確認すると良さそう 
wikipediaによると https://ja.wikipedia.org/wiki/LLVM 実行時の最適化も行ってくれるということで、Operating systemの差分も吸収してくれる、すなわちバイナリフォーマットにおける差分も面倒見てくれているのではないかと推測している

llvmがいい感じになってくれてそう
https://github.com/llvm/llvm-project/tree/main/llvm/include/llvm/BinaryFormat/ELFRelocs

ランタイムはどうなるのか、swiftをもとにもう少し概念整理したい

llvmとランタイム云々の話は、自分の中で整理がついた。

<img width="882" alt="スクリーンショット 2023-01-08 17 47 28" src="https://user-images.githubusercontent.com/16571394/211187829-e801b834-bdbb-4dcb-ad91-aa2eeec17789.png">

- llvmは単純にバイナリを出力させるための基盤にしかすぎないこと
- ランタイムはコンパイラにソースで埋め込むこともできそうであるが、`libswiftCore.dylib`として切り分け、実行時に共有ライブラリとしてリンクする。
  - dylibを出力する際にllvmを使っているかもしれない。（キャプチャの赤枠の部分）

やりたいこと: ランタイムライブラリのソースコードをビルドしてリンクすることは可能か
