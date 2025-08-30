#!/bin/bash

mkdir -p /var/run/dbus
mkdir -p /run/dbus
# dbus-uuidgen > /var/lib/dbus/machine-id
# dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address --fork

dbus-launch --config-file=/usr/share/dbus-1/session.conf | sed 's/^/export /' >> /etc/bash.bashrc

source /etc/bash.bashrc

pipewire -c $XDG_CONFIG_HOME/pipewire/pipewire.conf &
wireplumber -c $XDG_CONFIG_HOME/wireplumber/wireplumber.conf &
pipewire-pulse -c $XDG_CONFIG_HOME/pipewire//pipewire-pulse.conf &

tail -f /dev/null
