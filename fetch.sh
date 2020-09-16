#!/bin/sh

while IFS= read -r url; do
    dir=$(echo $url | tr -cd '[:alnum:]._-')
    d=$(date +%s)
    mkdir -p $dir/$d
    (
	      cd $dir/$d
        date
	      set -x
	      retry -m 1 -t 300 pageres "$url" --filename=full
        date
	      retry -m 1 -t 300 pageres "$url" 1920x1080 1366x768 1280x1280 1280x800 1000x1000 800x800 500x500 640x480 480x640 --crop
    )
    echo "DONE $url $(echo $(date +%s)-$d | bc)s"
    sleep .5
done < sites.txt
