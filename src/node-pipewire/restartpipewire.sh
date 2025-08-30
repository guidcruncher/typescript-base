#!/bin/bash
pipewirepid=$(pgrep pipewire)

if [ -n "$pipewirepid" ]; then
  trap "kill -9 $pipewirepid" EXIT
fi

pipewire -c $XDG_CONFIG_HOME/pipewire/pipewire.conf &
wireplumber -c $XDG_CONFIG_HOME/wireplumber/wireplumber.conf &
pipewire-pulse -c $XDG_CONFIG_HOME/pipewire//pipewire-pulse.conf &
