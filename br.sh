#!/bin/bash
shopt -s extglob;
dir_path="/sys/class/backlight/intel_backlight"

case $1 in
    +([0-9]) ) br=$1 ;;
    * ) br=0 ;;
esac

max_br=`cat $dir_path/max_brightness`;

if (($br > 100)) && (( $br < $max_br )) && [ -e "$dir_path/max_brightness" ]; then
    echo "$br" > "$dir_path/brightness";
else
    echo -n "May be wrong or danger parameter. Current value: ";
    cat "$dir_path/brightness";
fi 
