#!/bin/bash

if [[ -f "$1" ]]; then
    # either pass on a file with two integer arguments to 'zoom' in on the spectrogram
    if [[ $2 =~ ^-?[0-9]+$ ]] && [[ $3 =~ ^-?[0-9]+$ ]]; then
        echo $(sox "$1" -n remix 2 trim "$2" "$3" spectrogram -o - | curl -# -F file=@- https://0x0.st) | xclip -sel c -i && notify-send "spectrogram successfully uploaded"
    # or pass on a file without arguements
    else
        echo $(sox "$1" -n spectrogram -o - | curl -# -F file=@- https://0x0.st) | xclip -sel c -i && notify-send "spectrogram successfully uploaded"
    fi
else
	echo "no such file"
fi
