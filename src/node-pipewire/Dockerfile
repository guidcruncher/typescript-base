FROM debian:stable-slim AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production
ARG TARGETARCH
ENV TZ=UTC

ENV XDG_DATA_HOME=/local/share
ENV XDG_CONFIG_HOME=/local/config
ENV XDG_STATE_HOME=/local/state
ENV XDG_RUNTIME_DIR=/tmp

ENV PIPEWIRE_LATENCY="32/48000"
ENV DISPLAY=":0"
ENV PULSE_RUNTIME_PATH="/tmp/"
ENV DISABLE_RTKIT=y
ENV PIPEWIRE_RUNTIME_DIR=/tmp

RUN <<EOF
mkdir -p $XDG_DATA_HOME $XDG_CONFIG_HOME $XDG_STATE_HOME $XDG_CONFIG_HOME/pipewire $XDG_CONFIG_HOME/wireplumber $XDG_DATA_HOME/wireplumber $XDG_CONFIG_HOME/pipewire/pipewire.conf.d $XDG_CONFIG_HOME/pipewire/client.conf.d/ $XDG_CONFIG_HOME/pipewire/pipewire-pulse.conf.d/ $XDG_CONFIG_HOME/pipewire/jack.conf.d/ $XDG_CONFIG_HOME/pipewire/filter-chain.conf.d/

mkdir -p /app /npmcache
apt update
apt install -y --no-install-recommends tzdata ca-certificates curl unzip \
    caddy xz-utils libpipewire-0.3-0  zstd alsa-utils alsa-tools libasound2 \
    libogg-dev libvorbis-dev libasound2-dev libasound2-plugin-equal \
    libasound2-plugins \
    libcamera-ipa pipewire-libcamera pipewire-audio pipewire wireplumber \
    dbus-x11 rtkit dbus-user-session nano easyeffects pipewire-pulse pipewire-audio-client-libraries pulseaudio-utils \
    pipewire-alsa pipewire-jack pipewire-v4l2 gstreamer1.0-pipewire libpipewire-0.3-modules \
    libspa-0.2-jack libspa-0.2-modules wireplumber

apt clean autoclean -y > /dev/null
rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

echo $TZ > /etc/timezone
ln -s /lib/modules/6.12.41+deb13-arm64/ /lib/modules/6.12.34+rpt-rpi-v8
curl -L "https://nodejs.org/dist/v24.4.1/node-v24.4.1-linux-arm64.tar.xz" -o ./node.tar.xz
tar xvf ./node.tar.xz -C /usr/local/ --strip-components=1
rm ./node.tar.xz
npm install -g typescript ts-node
npm install -g tslib @types/node
EOF

FROM base AS production

COPY ./configs/ /local/config/
WORKDIR /app
COPY ./*.sh /app/
RUN chmod +x /app/*.sh
ENTRYPOINT [ "/bin/bash", "-E", "-c" ]
CMD ["/app/start.sh"]

