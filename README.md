# n8n を VPS 上に構築

## 商用利用

- 自ホストでの提供は NG
- クライアント所有のサーバーにホストすれば無料
    - 無料では利用できない機能：https://docs.n8n.io/hosting/community-edition-features/
- 参考：https://www.adcal-inc.com/column/n8n-commercial-use/

## データベース

- SQLite または PostgreSQL
    - SQLite は同時書き込みが弱いためか "10 ～ 15 の同時ワークフローを処理" に留まるとのこと
        - 多数動かすのであれば PostgreSQL
        - PostgreSQL であればメモリがボトルネックになりそう
        - VPS のスペック（メモリ）次第でどちらか選ぶ
    - 参考：https://community.n8n.io/t/n8n-with-sqlite-postgresql-or-supabase-three-installation-options-compared/118201

## 構築

- [n8n-docker-caddy](https://github.com/n8n-io/n8n-hosting/tree/main/docker-caddy) を元に構築
https://community.n8n.io/t/switching-login-mode-email-vs-basic-auth-on-self-hosted-n8n/101527
- Basic 認証は削除され、オーナーアカウントでサインイン
    - https://docs.n8n.io/hosting/configuration/user-management-self-hosted/
- オーナーアカウントはメンバーのワークフローを上書きする可能性あり
    - ファイルの排他制御のようなものはないみたい
    - https://docs.n8n.io/user-management/best-practices/
- セキュリティ
    - 公開 API を利用しないなら無効：https://docs.n8n.io/hosting/securing/disable-public-api/
- 参考：https://zenn.dev/digilaweb/articles/d2918deeeb5c25