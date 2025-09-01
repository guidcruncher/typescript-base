#!/bin/bash

if [ ! -e "/app/.bootstrap" ]; then
   touch /app/.bootstrap
   source /app/bootstrap.sh
fi

/usr/bin/pipewire -c $XDG_CONFIG_HOME/pipewire/pipewire.conf &
/usr/bin/wireplumber -c $XDG_CONFIG_HOME/wireplumber/wireplumber.conf &
/usr/bin/pipewire-pulse -c $XDG_CONFIG_HOME/pipewire/pipewire-pulse.conf &

# /usr/bin/mpd $XDG_CONFIG_HOME/mpd/mpd.conf

cp $XDG_CONFIG_HOME/go-librespot/config.yml $XDG_STATE_HOME/go-librespot/ 
#-/usr/local/bin/go-librespot  --config_dir $XDG_STATE_HOME/go-librespot/ &

# /usr/local/bin/jamesdsp -s -w

pm2 start /app/ecosystem.config.cjs
tail -f /dev/null
