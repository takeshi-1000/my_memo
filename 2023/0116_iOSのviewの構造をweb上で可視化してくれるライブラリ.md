xcodeIDE上でできる debugging view hierarchyのweb browser版みたいなもの。

https://github.com/damian-kolakowski/iOS-Hierarchy-Viewer

確認した時点で最終コミット (https://github.com/damian-kolakowski/iOS-Hierarchy-Viewer/commit/ab872aeddcfa2640f59e035bb6617c2f14aa8bad) が4年ほど前の、みた感じ古いライブラリだったが、

勤めている会社のアプリプロジェクトに組み込めそうだったので、組み込んだ時のメモ書き
※基本的には https://github.com/damian-kolakowski/iOS-Hierarchy-Viewer#installation を参考

1. https://github.com/damian-kolakowski/iOS-Hierarchy-Viewer/releases にアクセスして、assetsの `ios_hierarchy_viewer_1.4.8.zip` をダウンロード
2. ダウンロードしたzipファイルを展開して、プロジェクトに追加
3. swiftプロジェクトであれば、bridgin-headerに、 `#import "iOSHierarchyViewer.h"` を追加する
4. xcodeのプロジェクト設定で、excluded architectureにarm64を追加しておく
5. appdelegateのlaunchoptionsで、 `iOSHierarchyViewer.start()` を追加
6. ビルド
7. ログにurlが出るのでそれにアクセス (添付では `http://127.0.0.1:9449`)するとbrowser上で確認できた

### 1についての画像

<img width="975" alt="スクリーンショット 2023-01-16 7 39 30" src="https://user-images.githubusercontent.com/16571394/212570984-a73be2d5-a605-4e2b-a544-9ea92937784a.png">

### 2についての画像

<img width="448" alt="スクリーンショット 2023-01-16 7 40 14" src="https://user-images.githubusercontent.com/16571394/212571053-209434b6-d690-449d-8382-fa8b4f0faf21.png">

### 7についての画像

<img width="754" alt="スクリーンショット 2023-01-16 7 44 37" src="https://user-images.githubusercontent.com/16571394/212571165-fb397529-f81f-416a-80f4-3b91ba3a87a6.png">

### 実際のブラウザ上での確認

<img width="1307" alt="スクリーンショット 2023-01-16 7 45 59" src="https://user-images.githubusercontent.com/16571394/212571267-da1215b8-6892-4df9-a0df-1b5f9c8d41c5.png">
