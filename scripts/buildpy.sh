#!/bin/bash
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
BOLDGREEN="\e[1;32m"
ITALICYELLOW="\e[3;33m"
clear

source_file="$1.py"
temp_file="temp.py"
if [ ! -f $temp_file ]; then
    touch "$temp_file"
fi
getDiff=$(diff temp.py $1.py)

if [ "$getDiff" ]; then
    echo -e "${ITALICYELLOW}The file has been edited.${ENDCOLOR}"
    cp "$1.py" "temp.py"
else
    echo -e "${ITALICYELLOW}No changes on the file.${ENDCOLOR}"
fi

echo -e "${BOLDGREEN}Compilled and running...${ENDCOLOR}"
python3 $1.py


