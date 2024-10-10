## あるバム

## アプリ概要

モバイル開発に興味があり Flutter を採用しました。記録をテーマに自分自身の思い出を残したいと思い作成したおもいでアプリです。

使用技術とアーキテクチャ
* 開発言語：Dart
* フレームワーク：Flutter
* ローカルDB: sqflite
* バージョン管理ツール: fvm
* アーキテクチャ: MVVM、ドメイン駆動
* 状態管理: Riverbed
* クラスの生成: freezed
* ルーティング:go_router

主な機能
* ユーザーの投稿リスト表示: ユーザーが投稿した内容をリスト形式で表示します。
* ユーザーの投稿検索機能: 投稿のタイトルを検索することができます。
* カレンダー機能: カレンダーの日付を選択すると、その日に関連する投稿を表示します。
* 投稿の作成、編集、削除: ユーザーは新しい投稿を作成したり、既存の投稿を編集・削除することができます。
* 全データ削除機能: ユーザーは全てのデータを一括で削除することができます。

作ったものについての説明

狙い
「あるバム」アプリの主な狙いは、ユーザーが日々の思い出や出来事を簡単に記録し、後で振り返ることができるようにすることです。これにより、ユーザーは自分の生活の中で重要な瞬間を保存し、いつでもアクセスできるようになります。

設計
アプリの設計は以下のようなアーキテクチャと技術を採用しています：
* アーキテクチャ: ドメイン駆動設計 (DDD) とMVVM（モデル-ビュー-ビューモデル）パターンを採用しています。これにより、コードの可読性と保守性が向上し、機能の追加や変更が容易になります。
* 状態管理: hooks_riverpod と flutter_hooks を使用して、アプリの状態管理を行っています。
* データベース: sqflite を使用して、ローカルデータベースにユーザーの投稿を保存しています。SQLiteデータベースを利用することで、オフラインでもデータの保存とアクセスが可能です。
* ルーティング: go_router を使用して、アプリ内の画面遷移を管理しています。これにより、ルーティングの設定が簡単になり、コードの可読性が向上します。

達成できたこと
* ユーザーエクスペリエンスの向上: ユーザーは簡単に日々の出来事を記録し、カレンダー機能を使って特定の日付の投稿を振り返ることができます。
* 効率的な開発: Flutterを使用することで、iOSとAndroidの両方のプラットフォーム向けに同時に開発ができ、開発時間とコストを削減することができました。

