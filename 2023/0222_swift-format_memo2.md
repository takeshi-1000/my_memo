## swift-format configuration

https://github.com/apple/swift-format/blob/fc5a3da1d5d03143d7a31b12514349e2bf1aba8f/Documentation/Configuration.md

<img width="608" alt="スクリーンショット 2023-02-22 6 42 36" src="https://user-images.githubusercontent.com/16571394/220465382-4cf41105-b50c-4e31-afb0-dd9c2f9f5f4d.png">

## swift-format formattingを無視する

`// swift-format-ignore` を入れる

https://github.com/apple/swift-format/blob/main/Documentation/IgnoringSource.md#ignoring-formatting-aka-indentation-line-breaks-line-length-etc

https://user-images.githubusercontent.com/16571394/220466232-1d3a23f0-f019-4a3c-8fdb-49dd4b82f73c.mov

## swift-format directoryを指定して、lintしてみる

```
[takeshikomori@mac334-komori:~/me/takeshi-1000/testBitriseApp]!+[feature/fail_test2]
$ ls testBitriseApp/
Assets.xcassets		ContentView.swift	Preview Content		Test.swift		testBitriseAppApp.swift

[takeshikomori@mac334-komori:~/me/takeshi-1000/testBitriseApp]!+[feature/fail_test2]
$ swift-format lint -r testBitriseApp           
testBitriseApp/Test.swift:9:18: warning: [RemoveLine] remove line break
testBitriseApp/Test.swift:14:18: warning: [RemoveLine] remove line break
testBitriseApp/Test.swift:15:22: warning: [RemoveLine] remove line break
testBitriseApp/testBitriseAppApp.swift:10:6: warning: [RemoveLine] remove line break
testBitriseApp/testBitriseAppApp.swift:11:32: warning: [RemoveLine] remove line break
testBitriseApp/testBitriseAppApp.swift:15:22: warning: [RemoveLine] remove line break
testBitriseApp/testBitriseAppApp.swift:16:26: warning: [RemoveLine] remove line break
testBitriseApp/testBitriseAppApp.swift:24:25: warning: [RemoveLine] remove line break
testBitriseApp/testBitriseAppApp.swift:25:25: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:13:39: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:14:36: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:17:10: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:18:19: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:19:20: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:20:26: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:25:47: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:26:37: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:27:22: warning: [RemoveLine] remove line break
testBitriseApp/ContentView.swift:28:6: warning: [RemoveLine] remove line break
```

## swift api 設計ガイドライン

https://www.swift.org/documentation/api-design-guidelines/
