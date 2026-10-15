#!/bin/bash

CACHE_DIR="/tmp/spotify-art"
mkdir -p "$CACHE_DIR"

playerctl --follow metadata --format '{{title}}|{{artist}}|{{mpris:artUrl}}|{{album}}' | \
while IFS="|" read -r title artist arturl album; do
    # Skip empty
    [ -z "$title" ] && continue

    ART_FILE="$CACHE_DIR/cover.jpg"

    if [ -n "$arturl" ]; then
        curl -s "$arturl" -o "$ART_FILE"
        ICON="$ART_FILE"
    else
        # Generic fallback icon that exists on most systems
        ICON="mpv"
        # or: ICON="multimedia-audio-player"
        # or: ICON="/usr/share/icons/.../some-default.png"
    fi

    # Get a human-readable app name for the notification
    APP_NAME=$(playerctl --player="$player" metadata --format '{{playerName}}' 2>/dev/null)
    [ -z "$APP_NAME" ] && APP_NAME="Now Playing"

    notify-send.py --app-name="$APP_NAME" -i "$ICON" "$title" "$artist • $album" --action "next:Skip" -u low --expire-time 3000   --hint=string:x-canonical-private-synchronous:nowplaying \
      | while read -r action; do
            [ "$action" = "next" ] && playerctl --player="$player" next
        done &
done
