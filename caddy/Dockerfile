FROM caddy:alpine

# envsubst 用
RUN apk add --no-cache gettext

COPY Caddyfile.template /etc/caddy/Caddyfile.template
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]