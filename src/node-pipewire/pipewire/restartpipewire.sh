#!/bin/bash
processpid=$(pgrep pipewire)

if [ -n "$processpid" ]; then
  trap "kill -9 $processpid" EXIT
fi

  processpid=$(pgrep jamesdsp)

  if [ -n "$processpid" ]; then
    trap "kill -9 $processpid" EXIT
  fi

pipewire -c $XDG_CONFIG_HOME/pipewire/pipewire.conf &
wireplumber -c $XDG_CONFIG_HOME/wireplumber/wireplumber.conf &
pipewire-pulse -c $XDG_CONFIG_HOME/pipewire//pipewire-pulse.conf &

/usr/local/bin/jamesdsp &
