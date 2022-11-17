#!/bin/bash

notify-send "Spotify-TUI" "Launching SPT"
if [ ! $(pgrep "spotifyd") ]; then
  notify-send "Spotifyd" "Launching spotifyd"
	spotifyd
fi

spt
