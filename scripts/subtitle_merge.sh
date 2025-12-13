#!/bin/bash

MOVIE="$1"
SUBTITLE="$2"

BASENAME=$(basename "$MOVIE" .mp4)
OUTPUT="${BASENAME}_with_sub.mp4"

# CPU-based
# ffmpeg -i "$MOVIE" \
# -vf "subtitles='$SUBTITLE':force_style='fontname=Noto Sans Arabic Medium,FontSize=42'" \
# -c:a copy "$OUTPUT"

# GPU-based
ffmpeg -hwaccel cuda -i "$MOVIE" \
-vf "subtitles='$SUBTITLE':force_style='fontname=Noto Sans Arabic Medium,FontSize=42'" \
-c:v h264_nvenc -preset fast -c:a copy "$OUTPUT"

echo "Subtitle merged into $OUTPUT"
