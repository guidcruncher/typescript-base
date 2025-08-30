#!/bin/bash
pipewirepid=$(pgrep pipewire)

if [ -n "$pipewirepid" ]; then
  kill -9 "$pipewirepid"
fi

pipewire -c $XDG_CONFIG_HOME/pipewire/pipewire.conf &
wireplumber -c $XDG_CONFIG_HOME/wireplumber/wireplumber.conf &
