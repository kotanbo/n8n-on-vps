#!/bin/sh

set -e

TEMPLATE="/etc/caddy/Caddyfile.template"
OUTPUT="/etc/caddy/Caddyfile"

echo "[INFO] Generating Caddyfile from template using N8N_HOST=${N8N_HOST}"
envsubst '$N8N_HOST' < "$TEMPLATE" > "$OUTPUT"

exec caddy run --config "$OUTPUT" --adapter caddyfile