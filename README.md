# n8n 構築

n8n を Docker Compose で VPS または localhost に構築

## 前提条件

- Docker インストール済み

## セットアップ手順

### 1. 環境設定ファイルの準備

`.env.example` をコピーして `.env` ファイルを作成

```bash
cp .env.example .env
```

### 2. 環境変数の設定

`.env` ファイルを編集して必要な値を設定

#### 設定項目の説明

- `N8N_ENCRYPTION_KEY`: データの暗号化に使用するキー
- `N8N_DOMAIN`: n8n にアクセスするドメイン名
- `GENERIC_TIMEZONE`: タイムゾーン設定（デフォルト: Asia/Tokyo）

#### 補足的な設定

- `N8N_LOG_LEVEL=debug`: デバッグ時に追加

#### 暗号化キーの生成

暗号化キーのコマンド例

```bash
openssl rand -hex 16
```

または

```bash
uuidgen
```

### 3. n8n 起動・停止

起動

```bash
docker compose up -d
```

起動確認

```bash
docker compose ps
```

サービス停止

```bash
docker compose down
```