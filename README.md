# photo_pc_app

flutterを使い、画像、動画、音声ファイルなどを閲覧、編集できるようにする予定のデスクトップアプリです。windows、macなど複数のOSに対応した使いやすいメディアビューアが見つからないので開発を始めました。

現時点ではまだ数時間しか開発していないので、画像ファイルの閲覧、編集しかできません。

### 使用技術

- provider # グローバルな状態管理
- hive # フォルダのパスや設定の永続化用のNoSQLDB
- hive_flutter # hiveのflutterSDK
- go_router # 効率的なルーティング
- file_picker # ファイル選択
- desktop_drop # ドラッグドロップでのファイルの読み込み
- crop_your_image # 画像編集

### セットアップ手順

1. ライブラリをインストール
```bash
flutter pub get
```

2. Flutterの起動

```bash
flutter run
```