#!/bin/bash
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
BOLDGREEN="\e[1;32m"
ITALICYELLOW="\e[3;33m"
clear

echo -e "${BOLDGREEN}Compilled and running...${ENDCOLOR}"
swipl -s $1.pl

