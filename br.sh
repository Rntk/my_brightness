#!/bin/bash
shopt -s extglob;
case $1 in
    +([0-9]) ) br=$1 ;;
    * ) br=0 ;;
esac

if [ $br -gt 100 ]; then
    echo "$br" > /sys/class/backlight/intel_backlight/brightness;
else
    echo -n "May be wrong or danger parameter. Current value: ";
    cat /sys/class/backlight/intel_backlight/brightness;
fi
