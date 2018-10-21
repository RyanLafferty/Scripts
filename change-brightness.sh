#!/bin/bash
BRIGHTNESS=$1

if [[ $# < 1 ]];
then
	echo "Please include a brightness value between 0 and 1"
	exit
fi

if (( $(echo "${BRIGHTNESS} > 1" | bc -l) || $(echo "${BRIGHTNESS} < 0" | bc -l)  ));
then
	echo "Please enter a brightness value between 0 and 1".
	exit
fi

xrandr --output eDP-1-1 --brightness ${BRIGHTNESS}

echo ${BRIGHTNESS} > ~/.current-brightness

