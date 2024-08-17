#!/bin/bash

: '
This script searches for and deletes two types of files:
- Files without extensions
- Files with "temp" in their name
'

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
BOLDGREEN="\e[1;32m"
ITALICYELLOW="\e[33m"

curr_path=$(pwd)
echo -e "${YELLOW}dir${ENDCOLOR}: $curr_path"

results1=$(find . -type f ! -name "*.*")
results2=$(find . -type f   -name "*temp*")

if [ -z "$results1" ] && [ -z "$results2" ]; then
    echo "No files found that match the criteria."
else
    # piping rm's output to the input of find
    echo "$results1" | xargs rm
    echo "$results2" | xargs rm

    echo -e "${BOLDGREEN}Successfully${ENDCOLOR} deleted the following files:"

    echo "$results1"
    echo "$results2"
fi

