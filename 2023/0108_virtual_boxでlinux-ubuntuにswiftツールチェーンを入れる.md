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
