# WhisperKit の機能

このドキュメントでは、WhisperKit の主要機能とそれらをアプリケーションで活用する方法について詳細な情報を提供します。

## 主要機能

### デバイス上での音声テキスト変換

WhisperKit は、完全にデバイス上で動作する高品質な音声テキスト変換を提供し、プライバシーとオフライン機能を確保します。文字起こしは Apple の CoreML フレームワークを使用して実行され、Apple デバイス上でのパフォーマンスに最適化されています。

### リアルタイムストリーミング

WhisperKit はリアルタイムストリーミング文字起こしをサポートし、音声がキャプチャされるとすぐに処理できます。この機能は、音声アシスタント、ライブキャプション、インタラクティブな音声体験など、即時フィードバックが必要なアプリケーションに不可欠です。

### 単語タイムスタンプ

WhisperKit は文字起こしの各単語にタイムスタンプを生成でき、音声とテキストの正確な位置合わせを可能にします。この機能は以下のようなアプリケーションに価値があります：

- 字幕生成
- オーディオ/ビデオ編集ツール
- 教育アプリケーション
- アクセシビリティ機能

### 音声アクティビティ検出（VAD）

内蔵の音声アクティビティ検出システムは、背景ノイズと比較して誰かが話しているときを識別できます。これは以下に役立ちます：

- 非音声オーディオの処理を削減
- 文字起こしの精度を向上
- 関連するオーディオのみを処理することでバッテリー寿命を節約
- 音声が検出されたときのみ文字起こしを行うことでユーザー体験を向上

### 多言語サポート

WhisperKit は複数の言語での文字起こしをサポートし、国際的なアプリケーションに適しています。フレームワークは話されている言語を自動的に検出するか、特定の言語で文字起こしを行うように設定できます。

## 高度な機能

### カスタマイズ可能なモデル

WhisperKit では、精度とパフォーマンスのバランスを取るために異なるモデルサイズを選択できます：

- **Tiny**: 最速、最小のメモリフットプリント、リソースが制限された環境に適しています
- **Small**: ほとんどのアプリケーションに適した速度と精度のバランスが良い
- **Medium**: 適度なリソース要件で高い精度
- **Large**: 最高の精度、精度が重要なアプリケーションに適しています

### 微調整されたモデル

WhisperKit はカスタムの微調整されたモデルのロードをサポートし、開発者が特定のドメイン、アクセント、または専門用語に最適化できるようにします。これは特に以下に役立ちます：

- 医療文字起こし
- 法的文書
- 専門用語を持つ技術分野
- 地域のアクセントの最適化

### 自動句読点とフォーマット

WhisperKit は自動的に句読点を追加し、文字起こしされたテキストをフォーマットして、出力をより読みやすく自然にすることができます。これには以下が含まれます：

- 文の大文字化
- コンマとピリオドの配置
- 疑問符と感嘆符
- 段落の区切り

### 信頼度スコア

WhisperKit は、文字起こしされた各セグメントに対して、文字起こしの信頼性を示す信頼度スコアを提供します。これによりアプリケーションは以下が可能になります：

- 誤認識された可能性のある単語をハイライト
- 信頼度の低いセグメントに対するユーザー確認の要求
- 信頼性の低い文字起こしのフィルタリング
- 不確実性を示すことによるユーザー体験の向上

## パフォーマンス最適化

### 適応型サンプリング

WhisperKit は利用可能なシステムリソースに基づいて処理を適応させ、異なるデバイス間で最適なパフォーマンスを確保できます。これには以下が含まれます：

- デバイス機能に基づく動的モデル選択
- 調整可能な処理バッチサイズ
- メモリ使用量の最適化

### バックグラウンド処理

WhisperKit はバックグラウンド処理をサポートし、アプリケーションがフォアグラウンドにない場合でも文字起こしを継続できます。これは特に以下に役立ちます：

- 長形式のオーディオ文字起こし
- 音声メモアプリケーション
- 会議の録音と文字起こし

### エネルギー効率

フレームワークはエネルギー効率に最適化されており、バッテリー寿命が懸念されるモバイルアプリケーションに適しています。これには以下が含まれます：

- Neural Engine の効率的な使用
- CPU 使用量の最小化
- 最適化されたメモリアクセスパターン

## 統合機能

### Swift API

WhisperKit は、iOS および macOS アプリケーションとシームレスに統合できるクリーンで使いやすい Swift API を提供します。API は Swift の規則とベストプラクティスに従い、Swift 開発者にとって直感的です。

### コマンドラインインターフェース

WhisperKit には、Xcode プロジェクト外でのテストとデバッグ用のコマンドラインインターフェースが含まれています。これは以下に役立ちます：

- 文字起こし機能の迅速なテスト
- オーディオファイルのバッチ処理
- 他のコマンドラインツールとの統合
- 自動テストと CI/CD パイプライン

### Flutter 統合

Flutter WhisperKit Apple プラグインを通じて、WhisperKit は Flutter アプリケーションで使用でき、Apple デバイス上での WhisperKit のネイティブパフォーマンスを活用しながらクロスプラットフォーム機能を提供します。

## ユースケース

### アクセシビリティアプリケーション

WhisperKit は、聴覚障害を持つユーザー向けに音声をテキストに変換するアクセシビリティアプリケーションの作成に最適です。リアルタイム機能と高い精度により、ライブキャプションや文字起こしに適しています。

### コンテンツ作成ツール

コンテンツクリエイター向けのアプリケーションでは、WhisperKit を使用してインタビュー、ポッドキャスト、またはビデオコンテンツを自動的に文字起こしし、コンテンツ制作プロセスの時間と労力を節約できます。

### 言語学習

言語学習アプリケーションでは、WhisperKit を使用して発音や会話練習にリアルタイムフィードバックを提供し、ユーザーの言語スキル向上を支援できます。

### 会議の文字起こし

WhisperKit を使用して会議や会話を文字起こしし、検索可能な記録を作成し、すべてのチームメンバーがディスカッションにアクセスできるようにすることで、コラボレーションを改善できます。

### 音声アシスタント

リアルタイム機能とデバイス上の処理により、WhisperKit は音声認識にクラウドサービスに依存しないプライバシー重視の音声アシスタントの作成に適しています。
