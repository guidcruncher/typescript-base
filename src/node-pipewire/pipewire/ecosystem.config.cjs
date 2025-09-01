module.exports = {
  apps : [
  {
    name   : "librespot",
    script : "/usr/local/bin/go-librespot",
    args   : "--config_dir /local/state/go-librespot/"
  },
  {
    name   : "mpd",
    script : "/usr/bin/mpd",
    args   : "--no-daemon --stdout --verbose /local/config/mpd/mpd.conf"
  }
  ]
}
