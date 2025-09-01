#!/bin/bash

mkdir -p $XDG_RUNTIME_DIR/mpd $XDG_DATA_HOME/mpd $XDG_STATE_HOME/mpd $XDG_CONFIG_HOME/mpd
mkdir -p $XDG_RUNTIME_DIR/go-librespot $XDG_DATA_HOME/go-librespot $XDG_STATE_HOME/go-librespot $XDG_CONFIG_HOME/go-librespot

mkdir -p /tmp/mpd/ /var/run/dbus
mkdir -p /run/dbus
dbus-uuidgen > /var/lib/dbus/machine-id
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address --fork

dbus-launch --config-file=/usr/share/dbus-1/session.conf | sed 's/^/export /' >> /etc/bash.bashrc

