※環境m1

- otool -L file名 オブジェクトファイルが使用している共有ライブラリの名前とバージョンを表示する

```
$ otool -L ~/Library/Developer/Xcode/DerivedData/testCarthage-axdeegilbhjuachdprsmvogvkdvj/Build/Products/Debug-iphonesimulator/testCarthage.app/testCarthage 
/Users/takeshikomori/Library/Developer/Xcode/DerivedData/testCarthage-axdeegilbhjuachdprsmvogvkdvj/Build/Products/Debug-iphonesimulator/testCarthage.app/testCarthage:
	@rpath/Lottie.framework/Lottie (compatibility version 1.0.0, current version 1.0.0)
	/System/Library/Frameworks/Foundation.framework/Foundation (compatibility version 300.0.0, current version 1860.0.0)
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1311.120.1)
	/System/Library/Frameworks/SwiftUI.framework/SwiftUI (compatibility version 0.0.0, current version 0.0.0)
	/usr/lib/swift/libswiftCore.dylib (compatibility version 1.0.0, current version 5.6.0)
	/usr/lib/swift/libswiftCoreData.dylib (compatibility version 1.0.0, current version 19.0.0, weak)
	/usr/lib/swift/libswiftCoreFoundation.dylib (compatibility version 1.0.0, current version 14.0.0, weak)
	/usr/lib/swift/libswiftCoreGraphics.dylib (compatibility version 1.0.0, current version 3.0.0, weak)
	/usr/lib/swift/libswiftCoreImage.dylib (compatibility version 1.0.0, current version 2.0.0, weak)
	/usr/lib/swift/libswiftDarwin.dylib (compatibility version 1.0.0, current version 0.0.0, weak)
	/usr/lib/swift/libswiftDataDetection.dylib (compatibility version 1.0.0, current version 697.2.0, weak)
	/usr/lib/swift/libswiftDispatch.dylib (compatibility version 1.0.0, current version 11.0.0, weak)
	/usr/lib/swift/libswiftFileProvider.dylib (compatibility version 1.0.0, current version 399.120.29, weak)
	/usr/lib/swift/libswiftFoundation.dylib (compatibility version 1.0.0, current version 73.100.0, weak)
	/usr/lib/swift/libswiftMetal.dylib (compatibility version 1.0.0, current version 261.13.3, weak)
	/usr/lib/swift/libswiftObjectiveC.dylib (compatibility version 1.0.0, current version 2.0.0, weak)
	/usr/lib/swift/libswiftQuartzCore.dylib (compatibility version 1.0.0, current version 3.0.0, weak)
	/usr/lib/swift/libswiftUIKit.dylib (compatibility version 1.0.0, current version 5504.0.0, weak)
	/usr/lib/swift/libswiftUniformTypeIdentifiers.dylib (compatibility version 1.0.0, current version 722.5.0, weak)
	/usr/lib/swift/libswiftos.dylib (compatibility version 1.0.0, current version 1023.0.0, weak)

```

- otool -f /bin/ls ファットバイナリの詳細を見る

```
Fat headers
fat_magic 0xcafebabe
nfat_arch 2
architecture 0
    cputype 16777223
    cpusubtype 3
    capabilities 0x0
    offset 16384
    size 72800
    align 2^14 (16384)
architecture 1
    cputype 16777228
    cpusubtype 2
    capabilities 0x80
    offset 98304
    size 88736
    align 2^14 (16384)
```

- hexdump -n 40 /bin/ls ファイルの中身を16進数表示。 -n　でバイト数指定

```
$ hexdump -n 20 /bin/ls
0000000 ca fe ba be 00 00 00 02 01 00 00 07 00 00 00 03
0000010 00 00 40 00                                    
0000014
```

- lipo -archs /Applications/Xcode.app/Contents/MacOS/Xcode 実行バイナリに対応するcpuアーキテクチャの出力

```
$ lipo -archs /Applications/Xcode.app/Contents/MacOS/Xcode  
x86_64 arm64

[takeshikomori@MacBook-Pro-2:~/me/private]
$ lipo -archs /bin/ls
x86_64 arm64e
```

$ otool -l hello Loadコマンド見る
```
hello:
Load command 0
      cmd LC_SEGMENT_64
  cmdsize 72
  segname __PAGEZERO
   vmaddr 0x0000000000000000
   vmsize 0x0000000100000000
  fileoff 0
 filesize 0
  maxprot 0x00000000
 initprot 0x00000000
   nsects 0
    flags 0x0
Load command 1
      cmd LC_SEGMENT_64
  cmdsize 392
  segname __TEXT
   vmaddr 0x0000000100000000
   vmsize 0x0000000000004000
  fileoff 0
 filesize 16384
  maxprot 0x00000005
 initprot 0x00000005
   nsects 4
    flags 0x0
Section
  sectname __text
   segname __TEXT
      addr 0x0000000100003f7c
      size 0x0000000000000020
    offset 16252
     align 2^2 (4)
    reloff 0
    nreloc 0
     flags 0x80000400
 reserved1 0
 reserved2 0
Section
  sectname __stubs
   segname __TEXT
      addr 0x0000000100003f9c
      size 0x000000000000000c
    offset 16284
     align 2^2 (4)
    reloff 0
    nreloc 0
     flags 0x80000408
 reserved1 0 (index into indirect symbol table)
 reserved2 12 (size of stubs)
Section
  sectname __cstring
   segname __TEXT
      addr 0x0000000100003fa8
      size 0x000000000000000d
    offset 16296
     align 2^0 (1)
    reloff 0
    nreloc 0
     flags 0x00000002
 reserved1 0
 reserved2 0
Section
  sectname __unwind_info
   segname __TEXT
      addr 0x0000000100003fb8
      size 0x0000000000000048
    offset 16312
     align 2^2 (4)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Load command 2
      cmd LC_SEGMENT_64
  cmdsize 152
  segname __DATA_CONST
   vmaddr 0x0000000100004000
   vmsize 0x0000000000004000
  fileoff 16384
 filesize 16384
  maxprot 0x00000003
 initprot 0x00000003
   nsects 1
    flags 0x10
Section
  sectname __got
   segname __DATA_CONST
      addr 0x0000000100004000
      size 0x0000000000000008
    offset 16384
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x00000006
 reserved1 1 (index into indirect symbol table)
 reserved2 0
Load command 3
      cmd LC_SEGMENT_64
  cmdsize 72
  segname __LINKEDIT
   vmaddr 0x0000000100008000
   vmsize 0x0000000000004000
  fileoff 32768
 filesize 658
  maxprot 0x00000001
 initprot 0x00000001
   nsects 0
    flags 0x0
Load command 4
      cmd LC_DYLD_CHAINED_FIXUPS
  cmdsize 16
  dataoff 32768
 datasize 96
Load command 5
      cmd LC_DYLD_EXPORTS_TRIE
  cmdsize 16
  dataoff 32864
 datasize 48
Load command 6
     cmd LC_SYMTAB
 cmdsize 24
  symoff 32920
   nsyms 3
  stroff 32976
 strsize 40
Load command 7
            cmd LC_DYSYMTAB
        cmdsize 80
      ilocalsym 0
      nlocalsym 0
     iextdefsym 0
     nextdefsym 2
      iundefsym 2
      nundefsym 1
         tocoff 0
           ntoc 0
      modtaboff 0
        nmodtab 0
   extrefsymoff 0
    nextrefsyms 0
 indirectsymoff 32968
  nindirectsyms 2
      extreloff 0
        nextrel 0
      locreloff 0
        nlocrel 0
Load command 8
          cmd LC_LOAD_DYLINKER
      cmdsize 32
         name /usr/lib/dyld (offset 12)
Load command 9
     cmd LC_UUID
 cmdsize 24
    uuid DBD3FC09-EC25-36D3-BFC2-0E3F51E3E6B4
Load command 10
      cmd LC_BUILD_VERSION
  cmdsize 32
 platform 1
    minos 12.0
      sdk 12.3
   ntools 1
     tool 3
  version 764.0
Load command 11
      cmd LC_SOURCE_VERSION
  cmdsize 16
  version 0.0
Load command 12
       cmd LC_MAIN
   cmdsize 24
  entryoff 16252
 stacksize 0
Load command 13
          cmd LC_LOAD_DYLIB
      cmdsize 56
         name /usr/lib/libSystem.B.dylib (offset 24)
   time stamp 2 Thu Jan  1 09:00:02 1970
      current version 1311.100.3
compatibility version 1.0.0
Load command 14
      cmd LC_FUNCTION_STARTS
  cmdsize 16
  dataoff 32912
 datasize 8
Load command 15
      cmd LC_DATA_IN_CODE
  cmdsize 16
  dataoff 32920
 datasize 0
Load command 16
      cmd LC_CODE_SIGNATURE
  cmdsize 16
  dataoff 33024
 datasize 402
```

$ xcrun size -x -l -m hello

```
Segment __PAGEZERO: 0x100000000 (zero fill)  (vmaddr 0x0 fileoff 0)
Segment __TEXT: 0x4000 (vmaddr 0x100000000 fileoff 0)
	Section __text: 0x20 (addr 0x100003f7c offset 16252)
	Section __stubs: 0xc (addr 0x100003f9c offset 16284)
	Section __cstring: 0xd (addr 0x100003fa8 offset 16296)
	Section __unwind_info: 0x48 (addr 0x100003fb8 offset 16312)
	total 0x81
Segment __DATA_CONST: 0x4000 (vmaddr 0x100004000 fileoff 16384)
	Section __got: 0x8 (addr 0x100004000 offset 16384)
	total 0x8
Segment __LINKEDIT: 0x4000 (vmaddr 0x100008000 fileoff 32768)
total 0x10000c000
```

Mach-oのExecutableのTEXTセグメントのtextセクションの機械語と逆アセンブル

- $ xcrun otool -s __TEXT __text a.out

```
$ xcrun otool -s __TEXT __text a.out
a.out:
(__TEXT,__text) section
0000000100003f70 d10083ff a9017bfd 910043fd 52800008 
0000000100003f80 b9000be8 b81fc3bf 90000000 913ec000 
0000000100003f90 94000005 b9400be0 a9417bfd 910083ff 
0000000100003fa0 d65f03c0 
```

(ファイルフォーマットがELFでもできる)
- $ xcrun otool -v -t a.out

```
$ xcrun otool -v -t a.out
a.out:
(__TEXT,__text) section
_main:
0000000100003f70	sub	sp, sp, #0x20
0000000100003f74	stp	x29, x30, [sp, #0x10]
0000000100003f78	add	x29, sp, #0x10
0000000100003f7c	mov	w8, #0x0
0000000100003f80	str	w8, [sp, #0x8]
0000000100003f84	stur	wzr, [x29, #-0x4]
0000000100003f88	adrp	x0, 0 ; 0x100003000
0000000100003f8c	add	x0, x0, #0xfb0 ; literal pool for: "Hello\n"
0000000100003f90	bl	0x100003fa4 ; symbol stub for: _printf
0000000100003f94	ldr	w0, [sp, #0x8]
0000000100003f98	ldp	x29, x30, [sp, #0x10]
0000000100003f9c	add	sp, sp, #0x20
0000000100003fa0	ret
```

- objdump -d a.out

```
$ objdump -d a.out 

a.out:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100003f70 <_main>:
100003f70: ff 83 00 d1 	sub	sp, sp, #32
100003f74: fd 7b 01 a9 	stp	x29, x30, [sp, #16]
100003f78: fd 43 00 91 	add	x29, sp, #16
100003f7c: 08 00 80 52 	mov	w8, #0
100003f80: e8 0b 00 b9 	str	w8, [sp, #8]
100003f84: bf c3 1f b8 	stur	wzr, [x29, #-4]
100003f88: 00 00 00 90 	adrp	x0, 0x100003000 <_main+0x18>
100003f8c: 00 c0 3e 91 	add	x0, x0, #4016
100003f90: 05 00 00 94 	bl	0x100003fa4 <_printf+0x100003fa4>
100003f94: e0 0b 40 b9 	ldr	w0, [sp, #8]
100003f98: fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
100003f9c: ff 83 00 91 	add	sp, sp, #32
100003fa0: c0 03 5f d6 	ret

Disassembly of section __TEXT,__stubs:

0000000100003fa4 <__stubs>:
100003fa4: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x4>
100003fa8: 10 02 40 f9 	ldr	x16, [x16]
100003fac: 00 02 1f d6 	br	x16
```

