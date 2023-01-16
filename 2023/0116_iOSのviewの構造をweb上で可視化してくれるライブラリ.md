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

※ https://github.com/takeshi-1000/testViewerViewHierarchy で一旦組み込んでみたもの作成

### 1についての画像

<img width="975" alt="スクリーンショット 2023-01-16 7 39 30" src="https://user-images.githubusercontent.com/16571394/212570984-a73be2d5-a605-4e2b-a544-9ea92937784a.png">

### 2についての画像

<img width="448" alt="スクリーンショット 2023-01-16 7 40 14" src="https://user-images.githubusercontent.com/16571394/212571053-209434b6-d690-449d-8382-fa8b4f0faf21.png">

### 7についての画像

<img width="754" alt="スクリーンショット 2023-01-16 7 44 37" src="https://user-images.githubusercontent.com/16571394/212579022-65f90f61-fcdf-462f-a06d-56e8bfb98d71.png">

### 実際のブラウザ上での確認

<img width="1334" alt="スクリーンショット 2023-01-16 8 28 00" src="https://user-images.githubusercontent.com/16571394/212573381-1fb5b3c8-1786-4e8f-a42f-81d768ac4f90.png">

#### simulatorでの見え方

<img width="386" alt="スクリーンショット 2023-01-16 8 29 01" src="https://user-images.githubusercontent.com/16571394/212573391-9b586328-6ef7-4747-a95e-2e34958c58da.png">

