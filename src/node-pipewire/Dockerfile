FROM debian:stable-slim AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production
ARG TARGETARCH
ENV TZ=UTC

ENV XDG_DATA_HOME=/local/share
ENV XDG_CONFIG_HOME=/local/config
ENV XDG_STATE_HOME=/local/state
ENV XDG_RUNTIME_DIR=/tmp


ENV DISABLE_RTKIT=y
ENV PIPEWIRE_RUNTIME_DIR=/tmp
COPY ./npmrc /npmrc

RUN <<EOF
mkdir -p $XDG_DATA_HOME $XDG_CONFIG_HOME $XDG_STATE_HOME $XDG_CONFIG_HOME/pipewire $XDG_CONFIG_HOME/wireplumber $XDG_DATA_HOME/wireplumber $XDG_CONFIG_HOME/pipewire/pipewire.conf.d $XDG_CONFIG_HOME/pipewire/client.conf.d/ $XDG_CONFIG_HOME/pipewire/pipewire-pulse.conf.d/ $XDG_CONFIG_HOME/pipewire/jack.conf.d/ $XDG_CONFIG_HOME/pipewire/filter-chain.conf.d/

mkdir -p /app /npmcache
apt update
apt install -y --no-install-recommends tzdata ca-certificates curl unzip \
    caddy xz-utils libpipewire-0.3-0  zstd alsa-utils alsa-tools libasound2 \
    libogg-dev libvorbis-dev libasound2-dev libasound2-plugin-equal \
    libasound2-plugins \
    libcamera-ipa pipewire-libcamera pipewire-audio pipewire wireplumber \
    dbus-x11 rtkit dbus-user-session


apt clean -y > /dev/null
mkdir -p /config/pipewire /config/wireplumber

# mv /usr/share/wireplumber/wireplumber.conf $XDG_CONFIG_HOME/wireplumber/
# mv /usr/share/pipewire/pipewire.conf $XDG_CONFIG_HOME/pipewire/
# mv /usr/share/pipewire/client.conf $XDG_CONFIG_HOME/pipewire/
# mv /usr/share/pipewire/filter-chain.conf $XDG_CONFIG_HOME/pipewire/
# mv /usr/share/pipewire/pipewire-pulse.conf $XDG_CONFIG_HOME/pipewire/
# mv /usr/share/pipewire/jack.conf $XDG_CONFIG_HOME/pipewire/

EOF

COPY ./configs/ /local/config/
WORKDIR /app
COPY ./start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENTRYPOINT [ "/bin/bash", "-E", "-c" ]
CMD ["/app/start.sh"]

