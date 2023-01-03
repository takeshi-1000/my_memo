wip

この記事は、swiftにコントリビュートした際のポエムです

https://github.com/apple/swift/pull/62777

## 背景

自身が参画するプロジェクトにおいて、Xcode13.4.1からXcode14にした際に、closure内部のenum文のcaseの展開ができなくなったので、その修正を試みた
（発生するサンプルコードは、PR内に添付）

closure内の、enumのcase文の展開する際に、type checking（型検査）に失敗してしまったので、
失敗しないようなロジックにならないか、
