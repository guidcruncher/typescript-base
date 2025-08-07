FROM debian:stable-slim AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production
ARG TARGETARCH
ENV TZ=UTC

COPY ./npmrc /npmrc

RUN <<EOF
mkdir -p /app /npmcache
apt update
apt install -y --no-install-recommends tzdata ca-certificates curl unzip \
    caddy xz-utils

apt clean -y > /dev/null
rm -rf /var/cache/apt/archives /var/lib/apt/lists
echo $TZ > /etc/timezone

curl -L "https://nodejs.org/dist/v24.4.1/node-v24.4.1-linux-arm64.tar.xz" -o ./node.tar.xz
tar xvf ./node.tar.xz -C /usr/local/ --strip-components=1
rm ./node.tar.xz

npm install -g typescript ts-node
npm install -g tslib @types/node
EOF

COPY ./start.sh /start.sh

ENTRYPOINT [ "/bin/bash", "-E", "-c" ]
CMD ["/start.sh"]
