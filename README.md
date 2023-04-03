# 要件

 - 何かしらのキーワードを入力できる
 - 入力したキーワードで GitHub のリポジトリを検索できる
 - GitHub のリポジトリを検索する際、GitHub API（search/repositories）を利用する
 - github | Dart Package のようなパッケージは利用せず、API を呼ぶ処理を自分で実装する。
 - 検索結果は一覧で概要（リポジトリ名）を表示する
 - 検索結果のアイテムをタップしたら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示する。
 - ダークモードに切り替えできる。
 - 多言語化（英語、日本語）に対応している。

## 主要ライブラリ

|ライブラリ| バージョン |
|--|--|
| FlutterSDK | 3.7.5 |
| Dart | 2.19.2 |
| flutter_riverpod | 2.3.0 |
| freezed | 2.3.2 |
| json_annotation | 4.8.0 |
| url_launcher | 6.1.10 |
| intl | 0.17.0 |

## フォルダ構成

```lib配下
lib
├ compornents	// 画面構成要素の部品
├ entity		// ユーザー情報等の実体
├ l10n  		// 多言語設定ファイル
├ notifier		// 状態管理に係るクラス
├ page			// 各画面
├ repository	// データ制御クラス
├ service   	// APIコール
├ theme     	// テーマ
main.dart		// アプリケーションのルート
```

## 保守性の考慮

 - 責務ごとのフォルダ・ファイル構成を持たせること
 - 共通的なロジックで切り出し可能な場合は、共通化させること
 - flutter_lintsを使う等によるEffective Dartに準拠したこと
 - Stateクラスを画面毎に作成することで、画面毎の柔軟性を高めたこと
 - UnitTest及びWidgetTestの実施