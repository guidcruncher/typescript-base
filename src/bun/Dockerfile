FROM debian:stable-slim AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production
ARG TARGETARCH
ENV TZ=UTC

RUN <<EOF
mkdir -p /app
apt update
apt install -y --no-install-recommends tzdata ca-certificates curl unzip \
    caddy

apt clean -y > /dev/null
rm -rf /var/cache/apt/archives /var/lib/apt/lists
echo $TZ > /etc/timezone

curl -fsSL https://bun.sh/install | bash
cp /root/.bun/bin/bun /usr/local/bin
ln /usr/local/bin/bun /usr/local/bin/bunx
EOF

COPY ./start.sh /start.sh

ENTRYPOINT [ "/bin/bash", "-E", "-c" ]
CMD ["/start.sh"]
