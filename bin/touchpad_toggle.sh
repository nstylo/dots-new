#!/bin/bash

# get id of touchpad, for more general use modify the grep
ID="$(xinput list | grep -Po 'ALP0012.*id=\K[0-9]+')"

# echo "$ID"

# Use device number matching touchpad
if [[ $(xinput list $ID | grep -Ec "disabled") -eq 1 ]]; then
    xinput enable $ID
    #  DISPLAY=:0 notify-send --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Touchpad enabled"
else
    xinput disable $ID
    #  DISPLAY=:0 notify-send --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-busy.png "Touchpad disabled"
fi

exit 0
