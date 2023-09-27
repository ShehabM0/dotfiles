#!/bin/bash
GREEN="\e[32m"
ENDCOLOR="\e[0m"
BOLDGREEN="\e[1;32m"
clear
g++ $1.cpp -o $1
echo -e "${BOLDGREEN}Compilled and running...${ENDCOLOR}"
./$1
