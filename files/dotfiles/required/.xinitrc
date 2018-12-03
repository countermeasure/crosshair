#!/bin/bash

# Load and merge resource file.
xrdb -merge "$HOME"/.Xresources

# Swap Caps Lock and left Control keys.
setxkbmap -option ctrl:swapcaps

# Load xmodmap configuration.
xmodmap "$HOME"/.xmodmaprc

# Overload Tab and backslash keys with Xmonad modifier functionality, and
# left Control key (already remapped to Caps Lock key) with Escape
# functionality.
xcape -e "Hyper_L=Tab;Hyper_R=backslash;Control_L=Escape"

# Update ~/.config/user-dirs.dirs
# TODO: Change to : Update XDG user directories. ???
# TODO: Make sure the I know what --force is doing here.
xdg-user-dirs-update --force
# TODO: This instead? xdg-user-dirs-update

# Set wallpaper.
feh --bg-scale /usr/share/wallpaper/default.png

# Initialise the cursor.
# Without this, the Crosshair cursor theme isn't picked up in the root window.
xsetroot -cursor_name crosshair

# Start udiskie in the background.
udiskie &

# TODO: Start/configure redshift

# Start Xmonad.
exec xmonad
