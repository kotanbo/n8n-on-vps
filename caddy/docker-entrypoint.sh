#!/bin/sh

set -e

TEMPLATE="/etc/caddy/Caddyfile.template"
OUTPUT="/etc/caddy/Caddyfile"

echo "[INFO] Generating Caddyfile from template using N8N_DOMAIN=${N8N_DOMAIN}"
envsubst '$N8N_DOMAIN' < "$TEMPLATE" > "$OUTPUT"

exec caddy run --config "$OUTPUT" --adapter caddyfile