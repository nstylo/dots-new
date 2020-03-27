#!/bin/bash

# if no arguments given set bitrate and samplerate to fallback values
if [[ $2 -eq 0 ]]; then 
	bitrate=16
else 
	bitrate=$2
fi
if [[ $3 -eq 0 ]]; then
	samplerate=44100
else 
	samplerate=$3
fi

# input
in="$1"
base=$(basename "$in")
outdir=""$(dirname "$in")/$base" - "$2"bit lossless" 

# if input is a directory go through the whole folder
# and create a new folder one level higher containing output files
if [[ -d $in ]]; then
	[[ ! -d $outdir ]] && mkdir "$outdir"
	for f in "$in"*.flac; do
		sox "$f" -G -b $bitrate "$outdir"/"$(basename "$f")" rate -v -L $samplerate dither
	done
# else if the input is a single file put output file into top level folder
elif [[ -f $in ]] && [[ "${base##*.}" == "flac" ]]; then	
	sox "$in" -G -b $bitrate "$(dirname "$in")/${base%.*} - ${bitrate}bit lossless.flac" rate -v -L $samplerate dither
# else input was invalid
else 
	echo "\"$1\": invalid input"
fi
