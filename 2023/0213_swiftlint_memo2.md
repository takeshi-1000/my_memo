## swiftlint適用ルールメモ

- lintコマンド(`$ swiftlint`)を打ったディレクトリ内に.ymlファイルがないと、デフォルトのruleが採用されそう

下記のようなディレクトリがあった場合に、 `testBitriseApp` 直下でswiftlintを実行すると、親の `.swiftlint.yml` が適用されるわけではなかった。 (version `0.50.3`)

※この辺りで制御できるかも? > https://github.com/realm/SwiftLint#child--parent-configs-locally

```
$ tree -a
.
├── .swiftlint.yml
├── testBitriseApp
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── ContentView.swift
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   │       └── Contents.json
│   └── testBitriseAppApp.swift
├── testBitriseApp.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   ├── IDEWorkspaceChecks.plist
│   │   │   └── swiftpm
│   │   │       └── configuration
│   │   └── xcuserdata
│   │       └── takeshikomori.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── xcuserdata
│       └── takeshikomori.xcuserdatad
│           └── xcschemes
│               └── xcschememanagement.plist
├── testBitriseAppTests
│   ├── HogeTest.swift
│   └── testBitriseAppTests.swift
└── testBitriseAppUITests
    ├── testBitriseAppUITests.swift
    └── testBitriseAppUITestsLaunchTests.swift

// 全量
$ tree -a          
.
├── .DS_Store
├── .git
│   ├── COMMIT_EDITMSG
│   ├── FETCH_HEAD
│   ├── HEAD
│   ├── ORIG_HEAD
│   ├── config
│   ├── description
│   ├── hooks
│   │   ├── applypatch-msg.sample
│   │   ├── commit-msg.sample
│   │   ├── fsmonitor-watchman.sample
│   │   ├── post-update.sample
│   │   ├── pre-applypatch.sample
│   │   ├── pre-commit.sample
│   │   ├── pre-merge-commit.sample
│   │   ├── pre-push.sample
│   │   ├── pre-rebase.sample
│   │   ├── pre-receive.sample
│   │   ├── prepare-commit-msg.sample
│   │   ├── push-to-checkout.sample
│   │   └── update.sample
│   ├── index
│   ├── info
│   │   └── exclude
│   ├── logs
│   │   ├── HEAD
│   │   └── refs
│   │       ├── heads
│   │       │   ├── feature
│   │       │   │   ├── fail_test2
│   │       │   │   └── hoge2
│   │       │   └── main
│   │       ├── remotes
│   │       │   └── origin
│   │       │       ├── feature
│   │       │       │   ├── fail_test
│   │       │       │   ├── fail_test2
│   │       │       │   ├── hoge
│   │       │       │   └── hoge2
│   │       │       └── main
│   │       └── stash
│   ├── objects
│   │   ├── 05
│   │   │   └── 85e2c3ba9a00379b343fdf522a39ad1921095c
│   │   ├── 08
│   │   │   ├── 63fdb9243bf6f9285b7175aaa28dcfc74d8e44
│   │   │   └── d5bb48eed98040cb585570e6816491bc420440
│   │   ├── 0b
│   │   │   └── a8753a3b2743420ea3b27da089d6dff7b97696
│   │   ├── 0f
│   │   │   └── ca0ca2be3b4f360d74b8340f229cec2e9dc1c9
│   │   ├── 10
│   │   │   └── fff2709024f8d0aa144a2c3dc32a00dd664eed
│   │   ├── 12
│   │   │   ├── 239917e4169cc0297864bf95ef3ec66c461042
│   │   │   └── f379b7d69b259239d59ae4dfa22f8b800d3ab4
│   │   ├── 13
│   │   │   └── 613e3ee1a9348462a11a77a619faa808a346eb
│   │   ├── 14
│   │   │   └── d1759e96c8bcf480eb277c4c75fac6a737fbe0
│   │   ├── 18
│   │   │   ├── 8b52901d2ed0e82475b0992d4c8198f6573715
│   │   │   └── d981003d68d0546c4804ac2ff47dd97c6e7921
│   │   ├── 1b
│   │   │   └── b51110531a22349f90cc9b4207ef23d7e2c20d
│   │   ├── 21
│   │   │   └── f4649d2859355d56b7d2a18344b6b5e48f15d2
│   │   ├── 28
│   │   │   └── fa73094814d05c8c83ef23d48a708696bc0273
│   │   ├── 2b
│   │   │   └── 283b829b0915ee465d561d871eec953e05ebfb
│   │   ├── 2d
│   │   │   └── 4f84255bfa24da745f59456e00ed0a121ec15f
│   │   ├── 35
│   │   │   └── 74c7064cae17995d40854062afb7411305d1cd
│   │   ├── 44
│   │   │   └── f269a644e3757c3ebcf8fbcbf38e05dab7b8dd
│   │   ├── 47
│   │   │   └── b85e8ef7462bc53cb42ecd64f2d4faccf4c6c0
│   │   ├── 49
│   │   │   └── fc87481c282ae140e04c852ca6e4c00cb1877c
│   │   ├── 4a
│   │   │   └── caef6b8f49efcb86ff92b337d4333219b4b5d3
│   │   ├── 4b
│   │   │   └── 099b05f49e7385f15a2d299ddc4a99c8e935eb
│   │   ├── 4f
│   │   │   ├── a8b79c14f42add8ab55f68b2f35c2608053866
│   │   │   ├── be2dc81d1f3bec96c47bcc8f927f0a63b605df
│   │   │   └── f8114d79e1c521b6c0b2ee827d87018eeb898c
│   │   ├── 53
│   │   │   └── 0b41a9313bb9f0628fdacf78f54b49e67ede61
│   │   ├── 54
│   │   │   └── e878d9eefc23fc889d29866f001ed3d3793306
│   │   ├── 57
│   │   │   └── d0a4eeded40f1e7b86db3c28ac5fcf2d05b513
│   │   ├── 5f
│   │   │   └── 9f5f6a1962b2718ddbb2825eb65b3bb86d91a4
│   │   ├── 62
│   │   │   └── cdbafc8b45291bf80fe22a2550934c91a39691
│   │   ├── 63
│   │   │   └── 97ac93f8d9b8827ffed4ef53a24c5f2500c13c
│   │   ├── 69
│   │   │   └── c183da26e6528ddfae8fe04d1995cb0e1e0a95
│   │   ├── 70
│   │   │   └── 4ed76017d3ea1f073662181e80e867bcb42e7c
│   │   ├── 71
│   │   │   └── e26cdda4239f8516f7db7db6309c9e34a38999
│   │   ├── 73
│   │   │   └── c00596a7fca3f3d4bdd64053b69d86745f9e10
│   │   ├── 75
│   │   │   └── 038f1fb61e4aa4969afd0974f90743bbbcf3ef
│   │   ├── 78
│   │   │   ├── 3789449786ebb92e5dc4fa8dfcd8f9dd632462
│   │   │   └── 398bb5978600278478a1ae39c3b7eb613fd59b
│   │   ├── 7a
│   │   │   └── 2fafad342b177dcbef34b46d4b0c695c4e059b
│   │   ├── 7b
│   │   │   └── fabcfdc85104be0ffd62e233209b304e93ac4f
│   │   ├── 7d
│   │   │   └── ab4c17e2ee8f7c4e52b3c704d4c3b74542b360
│   │   ├── 7e
│   │   │   └── 0df99bd7a819d184beca3c06db266d033cc025
│   │   ├── 84
│   │   │   └── f4e849ec331f818997f198eb6177eab37d5b5b
│   │   ├── 8a
│   │   │   └── e19b55d38ac48ba3c7258f859c7dc561ac73e4
│   │   ├── 8d
│   │   │   └── d3803ad23be3681e1367ebbee5182799ff49e3
│   │   ├── 8e
│   │   │   └── bca2fd945df4eb932d3fec4f7e39dc87c00911
│   │   ├── 91
│   │   │   └── 9434a6254f0e9651f402737811be6634a03e9c
│   │   ├── 92
│   │   │   └── ddf817445df792d2cc1c91f44b19c4df5e37f7
│   │   ├── 94
│   │   │   └── 7891c32480a100b723257b6431ff3553847eaf
│   │   ├── 97
│   │   │   └── 8d72eb5c5a18691285c6b91d7a62b5a8e50438
│   │   ├── 98
│   │   │   ├── 6bd324c26d854187559f27f8194c8afd1795ac
│   │   │   └── 8cbce48eb115fe589ddb88d5a2ac0057d5f958
│   │   ├── 99
│   │   │   └── 307618739c895dbb2be5a3e93c521f8732a9a4
│   │   ├── 9e
│   │   │   └── 8f93699df684e1be3f9f0e8ac54286d7a75685
│   │   ├── a3
│   │   │   └── 948b61f9492243e718bdbd939d5ddacc041272
│   │   ├── a5
│   │   │   └── 8907e8dca108d67b459cc320b9b3f526742e32
│   │   ├── a8
│   │   │   └── 8debcf5bacd7382a7b0117916dbd0319134f30
│   │   ├── ac
│   │   │   └── 47d9750fc46a4aa400702ceb218af98b0fb0c2
│   │   ├── ae
│   │   │   └── 62d739aa9c766f9f2543d492d52e0498a52c1e
│   │   ├── af
│   │   │   └── 308fec28c7ab85c6510ae8b643f92bf0bd5346
│   │   ├── b2
│   │   │   └── 72429bc908442799a6cd64e45ed762ec016daa
│   │   ├── b7
│   │   │   └── 11758b742ef423fee7c713c3b4c807cb6df25c
│   │   ├── bd
│   │   │   └── 84f60ee0d95c4ab251fe2fb08fab1b9ede2e97
│   │   ├── c4
│   │   │   ├── 3cc9b8ba4e4ae5c6df5ed5e3f199668b7fead0
│   │   │   └── dd9e1a210dfe97506293b6a659bc8048bade3b
│   │   ├── ca
│   │   │   └── 2dc02e04938b54b95001b076e66db73e8fdac4
│   │   ├── cd
│   │   │   └── 85c3365c7a25072e7559fada5d6cb7ed0a7d8b
│   │   ├── d3
│   │   │   └── 7382d55ef7710785f1f21a82c809dd59ec6c3f
│   │   ├── d4
│   │   │   └── 481c5ec6bd5a336c24cf4ec5790c90f612cdcc
│   │   ├── d6
│   │   │   └── 3aa984b32daba4dfa6c08368cd8c59266accf5
│   │   ├── e7
│   │   │   └── 94e8b52d2978aed7158983975335ea0911fed5
│   │   ├── e8
│   │   │   └── 6940c87b56a802a2675c16c25c6d57ef5a467f
│   │   ├── eb
│   │   │   ├── 8789700816459c1e1480e0b34781d9fb78a1ca
│   │   │   └── fb032c57eb3dad8cf1d9c1e850285d62771d84
│   │   ├── ed
│   │   │   └── 14643203430c48c52401583dcca0a3b40a19d7
│   │   ├── fb
│   │   │   └── 97b20858506c47adc4036753b7b79c1c759e95
│   │   ├── fc
│   │   │   └── e0f4bb297a2fc7f01c0a635d3e669be8972a4a
│   │   ├── fe
│   │   │   └── 5a1d00d3ad9cba0db7f147a718b8f686aa17c1
│   │   ├── info
│   │   └── pack
│   └── refs
│       ├── heads
│       │   ├── feature
│       │   │   ├── fail_test2
│       │   │   └── hoge2
│       │   └── main
│       ├── remotes
│       │   └── origin
│       │       ├── feature
│       │       │   ├── fail_test
│       │       │   ├── fail_test2
│       │       │   ├── hoge
│       │       │   └── hoge2
│       │       └── main
│       ├── stash
│       └── tags
├── .swiftlint.yml
├── testBitriseApp
│   ├── .DS_Store
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── ContentView.swift
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   │       └── Contents.json
│   └── testBitriseAppApp.swift
├── testBitriseApp.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   ├── IDEWorkspaceChecks.plist
│   │   │   └── swiftpm
│   │   │       └── configuration
│   │   └── xcuserdata
│   │       └── takeshikomori.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── xcuserdata
│       └── takeshikomori.xcuserdatad
│           └── xcschemes
│               └── xcschememanagement.plist
├── testBitriseAppTests
│   ├── HogeTest.swift
│   └── testBitriseAppTests.swift
└── testBitriseAppUITests
    ├── testBitriseAppUITests.swift
    └── testBitriseAppUITestsLaunchTests.swift
```
