# CLAUDE.md - プロジェクト指示書

## プロジェクト概要

Claude Code ベストプラクティスのサンプルプロジェクト。
静的HTMLベースのシンプルな構成で、Claude Codeの各種設定パターンを実演する。

## ディレクトリ構成

```
.
├── CLAUDE.md                  # このファイル（AI向けプロジェクト指示書）
├── .claude/
│   ├── settings.json          # 権限管理・Hooks設定
│   └── commands/              # スラッシュコマンド定義
│       ├── review.md          # /review - コードレビュー
│       ├── simplify.md        # /simplify - コード簡素化
│       ├── verify.md          # /verify - HTML検証
│       └── plan.md            # /plan - 実装計画策定
├── .mcp.json                  # MCPサーバー設定（テンプレート）
├── apps/
│   └── index.html             # メインHTML
└── .gitignore
```

## コーディング規約

- インデント: スペース2つ
- HTMLファイル: lang="ja"を指定、UTF-8エンコーディング
- コミットメッセージ: 英語、動詞始まり（Add / Update / Fix / Remove）

## AI向け指示

### コマンド実行ルール

- `&&` でコマンドをチェインしない。`git add` と `git commit` は別々のBash呼び出しで実行すること
- 破壊的操作（`rm -rf`、`git push --force`、`git reset --hard`）は実行禁止

### コミットルール

- ユーザーから明示的に依頼された場合のみコミットを作成する
- コミットメッセージは簡潔に、変更の「なぜ」を記述する

## 開発ワークフロー指針

### Plan Mode 活用（Practice #4）

- 新機能や複数ファイルにまたがる変更は、まず Plan Mode で設計してから実装する
- `/plan` スラッシュコマンドで読み取り専用の計画策定が可能

### 並列作業（Practice #1）

- 独立したタスクは複数のClaude Codeインスタンスで並列実行可能
- Notification hookにより作業完了時にmacOS通知を受け取れる
- Git worktreeを使えばブランチごとに別ディレクトリで並行作業できる

### モデル選択（Practice #2）

- 設計・計画: Opus（高精度な推論が必要な場面）
- 実装・コーディング: Sonnet（速度とコストのバランス）
- 軽微な修正・検索: Haiku（高速・低コスト）

## MCP統合（Practice #9）

`.mcp.json` にMCPサーバーを設定可能。追加例:

```json
{
  "mcpServers": {
    "fetch": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-fetch@latest"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-github@latest"],
      "env": { "GITHUB_TOKEN": "<token>" }
    }
  }
}
```
