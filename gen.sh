#!/bin/sh

FORMAT=${1:-mp4}
mkdir -p gifs
for website in */; do
    for res in 1000x1000; do
	(
	    dest=gifs/$res-$(echo $website | sed 's@/$@@').${FORMAT}
	    echo $dest
	    rm -rf $dest
	    set -xe
	    ffmpeg -framerate 15 -pattern_type glob -i "$website/*/*-1000x1000-cropped.png" -r 15 "$dest"
	)
    done
done

