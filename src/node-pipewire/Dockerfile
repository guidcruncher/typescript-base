FROM debian:stable-slim AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV NODE_ENV=production
ARG TARGETARCH
ENV TZ=UTC

COPY ./npmrc /npmrc

RUN mkdir -p /app /npmcache
RUN apt update
RUN apt install -y --no-install-recommends tzdata ca-certificates curl unzip \
    caddy xz-utils libpipewire-0.3-0  zstd alsa-utils alsa-tools libasound2 \
    libogg-dev libvorbis-dev libasound2-dev libasound2-plugin-equal \
    libasound2-plugins \
    libcamera-ipa pipewire-libcamera pipewire-audio pipewire wireplumber \
    dbus-x11 rtkit dbus-user-session

RUN apt clean -y > /dev/null
RUN mkdir -p /etc/pipewire /etc/wireplumber
RUN cp /usr/share/wireplumber/* /etc/wireplumber/ -r
RUN cp /usr/share/pipewire/* /etc/pipewire/ -r

ENV DISABLE_RTKIT=y
ENV XDG_RUNTIME_DIR=/tmp
ENV PIPEWIRE_RUNTIME_DIR=/tmp

WORKDIR /app
COPY ./start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENTRYPOINT [ "/bin/bash", "-E", "-c" ]
CMD ["/app/start.sh"]

