#!/bin/bash

# This script renames files and directories by removing special characters (brackets, parentheses, and spaces) from their names.
# It replaces spaces with underscores and simply removes the other characters.

GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
BOLDGREEN="\e[1;32m"
ITALICYELLOW="\e[3;33m"

to_detect=('[' ']' '(' ')' ' ')
replace_by=''

for detect in "${to_detect[@]}";
do
    if [ "$detect" = " " ]; then
        replace_by='_'
    fi

    files=*$detect*
    for file in $files; do
        # If no matching files are found.
        if [ "$file" = "*$detect*" ]; then
            echo -e "${ITALICYELLOW}No changes on the files/directories.${ENDCOLOR}"
            break
        fi
        new_name=${file//$detect/$replace_by}
        # If the new filename doesn't already exist, rename the file.
        if [ ! -e "$new_name" ]; then
            echo -e "${BOLDGREEN}renaming${ENDCOLOR} '$file' ${BOLDGREEN}->${ENDCOLOR} '$new_name'"
            mv "$file" "$new_name"
        fi
    done
done

