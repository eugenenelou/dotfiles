#!/bin/bash

WINDOW_ID=$(xdotool getactivewindow)
rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'
sleep 0.2

# Capture the selection
TEXT="$( xclip -o -selection clipboard )"

# Only attempt to paste if there has been selection
if [ "${TEXT}x" != "x" ]; then
    # xdotool type "$TEXT"
    xdotool windowactivate --sync $WINDOW_ID
    xdotool key --clearmodifiers Shift+Insert
    # clear selection on paste
    echo "" | xclip -selection clipboard
fi
