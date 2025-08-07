# n8n を VPS 上に構築

## 商用利用

- 自ホストでの提供は NG
- クライアント所有のサーバーにホストすれば無料
    - Docker Compose で簡単に構築できるようにしておくのがシンプル？
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
- 参考：https://zenn.dev/digilaweb/articles/d2918deeeb5c25