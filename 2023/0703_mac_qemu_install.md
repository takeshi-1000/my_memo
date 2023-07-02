```
$ brew install qemu

// install後、使っているshellのプロファイルに、下記記載（versionは適宜変更）
$ export PATH="/usr/local/Cellar/qemu/8.0.2/bin:$PATH"

```

```
$ ls /usr/local/Cellar/qemu/8.0.2/bin/

elf2dmp                   qemu-system-alpha         qemu-system-m68k          qemu-system-nios2         qemu-system-s390x         qemu-system-xtensa
qemu-edid                 qemu-system-arm           qemu-system-microblaze    qemu-system-or1k          qemu-system-sh4           qemu-system-xtensaeb
qemu-img                  qemu-system-avr           qemu-system-microblazeel  qemu-system-ppc           qemu-system-sh4eb         
qemu-io                   qemu-system-cris          qemu-system-mips          qemu-system-ppc64         qemu-system-sparc         
qemu-nbd                  qemu-system-hppa          qemu-system-mips64        qemu-system-riscv32       qemu-system-sparc64       
qemu-storage-daemon       qemu-system-i386          qemu-system-mips64el      qemu-system-riscv64       qemu-system-tricore       
qemu-system-aarch64       qemu-system-loongarch64   qemu-system-mipsel        qemu-system-rx            qemu-system-x86_64  

$ qemu-system-x86_64 --version
QEMU emulator version 8.0.2
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers

$ qemu-system-arm --version
QEMU emulator version 8.0.2
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers

$ qemu-system-riscv64 --version
QEMU emulator version 8.0.2
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
```

参考: https://qemu.hateblo.jp/entry/2020/12/30/101221
