#!/bin/sh
mkdir -p img text

montage -mode concatenate -tile 1x ???_???_*_by_metagross111.png img/joined.png
convert img/joined.png -monochrome -negate img/negative.png
convert img/negative.png -crop 32x32 -set filename:title "%[fx:page.y/32]_%[fx:page.x/32]" +repage +adjoin "img/pkmn_%[filename:title].png"

for i in img/pkmn_*.png; do
    ./blockdraw.py "$i" | tee "text/$(basename -s ".png" "$i").txt"
done
