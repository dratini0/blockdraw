#!/bin/bash

if [ "x$1" = "x" ]; then
    no="$((RANDOM % 151 + 1))"
else
    no="$1"
fi

len="$(wc -l "text/pkmn_${no}_0.txt" | cut -d' ' -f 1)"
clearback="$(for i in {1..8}; do tput cuu1; done)"

for i in 0 1 2 1 2 1; do
    cat "text/pkmn_${no}_$i.txt"
    sleep 0.2
    echo -n "$clearback"
done

cat "text/pkmn_${no}_0.txt"
