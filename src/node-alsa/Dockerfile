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
    caddy xz-utils linux-image-generic zstd alsa-utils alsa-tools libasound2 \
    libogg-dev libvorbis-dev libasound2-dev libasound2-plugin-equal \
    libasound2-plugins

apt clean -y > /dev/null
rm -rf /var/cache/apt/archives /var/lib/apt/lists
echo $TZ > /etc/timezone
ln -s /lib/modules/6.12.41+deb13-arm64/ /lib/modules/6.12.34+rpt-rpi-v8
modprobe snd_aloop

curl -L "https://nodejs.org/dist/v24.4.1/node-v24.4.1-linux-arm64.tar.xz" -o ./node.tar.xz
tar xvf ./node.tar.xz -C /usr/local/ --strip-components=1
rm ./node.tar.xz

npm install -g typescript ts-node
npm install -g tslib @types/node
EOF

COPY ./start.sh /start.sh

ENTRYPOINT [ "/bin/bash", "-E", "-c" ]
CMD ["/start.sh"]
