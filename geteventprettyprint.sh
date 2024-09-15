#!/bin/sh

input_file="$1"
green='\033[0;32m'
clear='\033[0m'
red='\033[0;31m'
cyan='\033[0;36m'
xxd -g 1 -i -e -c 24 "$input_file" | while read -r linex; do
#echo "$linex"
    hexline="$(echo "$linex" | awk '{printf "0x%s%s%s%s%s%s%s%s 0x%s%s%s%s%s%s%s%s 0x%s%s             0x%s%s             0x%s%s%s%s\n",  $9,$8,$7,$6,$5,$4,$3,$2,$17,$16,$15,$14,$13,$12,$11,$10,$19,$18,$21,$20,$25,$24,$23,$22}')"
    echo "${cyan}--------------------------------------------------------------------------------------${clear}"
    echo "${green}$hexline${clear}${red}"
    for number in $hexline; do
        printf "%-18u " $((number))
    done
    echo "${clear}"

done
