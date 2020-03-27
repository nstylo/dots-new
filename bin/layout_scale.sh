#!/bin/sh
xrandr --output DisplayPort-1 --primary --mode 3840x2160 --pos 2819x0 --rotate normal --output DisplayPort-0 --off --output HDMI-A-0 --off --output DVI-I-0 --mode 1920x1080 --pos 0x0 --rotate normal --scale 1.468x1.468

# restore wallpaper
nitrogen --restore
