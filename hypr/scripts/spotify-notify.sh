#!/bin/bash

CACHE_DIR="/tmp/spotify-art"
mkdir -p "$CACHE_DIR"

playerctl --follow metadata --format '{{title}}|{{artist}}|{{mpris:artUrl}}' | \
while IFS="|" read -r title artist arturl; do

    # Skip empty
    [ -z "$title" ] && continue

    ART_FILE="$CACHE_DIR/cover.jpg"

    if [ -n "$arturl" ]; then
        curl -s "$arturl" -o "$ART_FILE"
        ICON="$ART_FILE"
    else
        ICON="spotify"
    fi

    notify-send -i "$ICON" "$title" "$artist"
done
