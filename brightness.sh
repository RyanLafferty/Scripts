#!/bin/bash
BRIGHTNESS=0.7
DEFAULT_BRIGHTNESS=0.7
TIC_RATE=25
DEFAULT_BRIGHTNESS_FILE=~/.default-brightness
BRIGHTNESS_FILE=~/.current-brightness
CHANGE_BRIGHTNESS_FILE=~/scripts/change-brightness.sh

if [ ! -f ${CHANGE_BRIGHTNESS_FILE} ]; then
    echo "Fatal Error: change-brightness.sh not found; location = ${CHANGE_BRIGHTNESS_FILE}"
    exit 0
fi

if [ ! -f ${BRIGHTNESS_FILE} ]; then
    echo "Current brightness not set, using default brightness"
    if [ ! -f ${DEFAULT_BRIGHTNESS_FILE} ]; then
        echo "Default brightness not set, using script default ${DEFAULT_BRIGHTNESS}"
        while true; do
            bash ${CHANGE_BRIGHTNESS_FILE} ${DEFAULT_BRIGHTNESS}
            echo "Current Brightness is set to: ${DEFAULT_BRIGHTNESS}"
            sleep ${TIC_RATE}
        done
        exit 1
    fi
    BRIGHTNESS_FILE=${DEFAULT_BRIGHTNESS_FILE}
fi

while true; do
    BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})
    bash ${CHANGE_BRIGHTNESS_FILE} ${BRIGHTNESS}
    echo "Current brightness is set to: ${BRIGHTNESS}"
    sleep ${TIC_RATE}
done
