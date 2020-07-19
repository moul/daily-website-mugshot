#!/bin/sh

urls=""
urls="$urls https://berty.tech/"
urls="$urls https://getmakerlog.com/"
urls="$urls https://github.com/"
urls="$urls https://github.com/moul/"
urls="$urls https://github.com/moul?tab=repositories&type=source"
urls="$urls https://github.com/search?q=user%3Amoul+user%3Amoul"
urls="$urls https://hoodmaps.com/"
urls="$urls https://manfred.life"
urls="$urls https://moul.io"
urls="$urls https://nomadlist.com"
urls="$urls https://nomadlist.com/@levelsio"
urls="$urls https://nomadlist.com/@moul"
urls="$urls https://remoteok.io"
urls="$urls https://sgtm.club/"
urls="$urls https://sgtm.club/@manfred"
urls="$urls https://sgtm.club/open"
urls="$urls https://soundcloud.com/camembert-au-lait-crew/"
urls="$urls https://twitter.com/moul/"
urls="$urls https://ultre.me/en/blog/"
urls="$urls https://wip.chat"
urls="$urls https://wip.chat/@levelsio"
urls="$urls https://wip.chat/@marc"
urls="$urls https://wip.chat/@moul"
urls="$urls https://www.camembertaulaitcrew.biz/"
urls="$urls https://www.google.com/"
urls="$urls https://www.producthunt.com/"
urls="$urls https://www.producthunt.com/@m42am"
urls="$urls https://www.producthunt.com/@rrhoover"
urls="$urls https://www.producthunt.com/makers"
urls="$urls https://www.scaleway.com/en/"
urls="$urls https://yourstack.com/"
urls="$urls https://yourstack.com/rrhoover"
#urls="$urls "
#urls="$urls "
#urls="$urls "

for url in $urls; do
    dir=$(echo $url | tr -cd '[:alnum:]._-')
    d=$(date +%s)
    mkdir -p $dir/$d
    (
	cd $dir/$d
	set -x
	time pageres "$url" --filename=full
	time pageres "$url" 1920x1080 1366x768 1280x1280 1280x800 1000x1000 800x800 500x500 640x480 480x640 --crop
    )
done
						 
