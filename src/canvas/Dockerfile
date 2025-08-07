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
    caddy build-essential python3 make gcc g++ \
    libpng-dev libjpeg-dev libpango-1.0-0 libpango1.0-dev libcairo2-dev \
    libgif-dev glibc-source libstdc++6

apt clean -y > /dev/null
rm -rf /var/cache/apt/archives /var/lib/apt/lists
echo $TZ > /etc/timezone

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24
node -v
nvm current
npm -v
mv /npmrc ~/.npmrc
npm install -g typescript ts-node
npm install -g tslib @types/node canvas
EOF

COPY ./start.sh /start.sh

ENTRYPOINT [ "/bin/bash", "-E", "-c" ]
CMD ["/start.sh"]
