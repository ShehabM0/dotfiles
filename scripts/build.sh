#!/bin/bash
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
BOLDGREEN="\e[1;32m"
ITALICYELLOW="\e[3;33m"
clear

source_file="$1.cpp"
temp_file="temp.cpp"
if [ ! -f $temp_file ]; then
    touch "$temp_file"
fi
getDiff=$(diff temp.cpp $1.cpp)

if [ "$getDiff" ]; then
    echo -e "${ITALICYELLOW}The file has been edited.${ENDCOLOR}"
    cp "$1.cpp" "temp.cpp"
    g++ $1.cpp -o $1
else
    echo -e "${ITALICYELLOW}No changes on the file.${ENDCOLOR}"
fi

echo -e "${BOLDGREEN}Compilled and running...${ENDCOLOR}"
./$1

# g++ -static -DLOCAL -lm -s -x c++ -Wall -Wextra -O2 -std=c++17 -o $1 $1.cpp

