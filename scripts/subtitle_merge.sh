#!/bin/bash
#fontselect: (Arial, 400, 0) -> /usr/share/fonts/truetype/liberation2/LiberationSans-Regular.ttf, 0, LiberationSans

MOVIE="$1"
SUBTITLE="$2"

BASENAME=$(basename "$MOVIE" .mp4)
OUTPUT="${BASENAME}_with_sub.mp4"

ffmpeg -i "$MOVIE" -vf "subtitles=$SUBTITLE:force_style='FontSize=32'" -c:a copy "$OUTPUT"

echo "Subtitle merged into $OUTPUT"
