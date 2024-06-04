#!/bin/bash
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
BOLDGREEN="\e[1;32m"
ITALICYELLOW="\e[3;33m"

detect=' '
replace_by='_'
for file in *\ *;
do
    if [ "$file" = '* *' ];
    then
        echo -e "${ITALICYELLOW}No changes on the files/directories.${ENDCOLOR}"
        break
    fi
    new_name=${file//$detect/$replace_by}
    if [ ! -e "$new_name" ];
    then
        echo -e "${BOLDGREEN}renaming${ENDCOLOR} '$file' ${BOLDGREEN}->${ENDCOLOR} '$new_name'"
        mv "$file" "$new_name"
    fi
done


