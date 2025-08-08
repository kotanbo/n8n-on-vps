#!/bin/sh

set -e

TEMPLATE="/etc/caddy/Caddyfile.template"
OUTPUT="/etc/caddy/Caddyfile"

TLS_BLOCK=""
if echo "$N8N_HOST" | grep -qE '(^|\.)localhost$'; then
  TLS_BLOCK="tls internal"
fi

echo "[INFO] Generating Caddyfile from template using N8N_HOST=${N8N_HOST}, TLS_BLOCK=${TLS_BLOCK}"
envsubst '$N8N_HOST $TLS_BLOCK' < "$TEMPLATE" > "$OUTPUT"

exec caddy run --config "$OUTPUT" --adapter caddyfile