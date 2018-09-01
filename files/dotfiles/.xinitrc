#!/bin/bash

# Load and merge resource file.
xrdb -merge "$HOME"/.Xresources

# Update ~/.config/user-dirs.dirs
# TODO: Change to : Update XDG user directories. ???
# TODO: Make sure the I know what --force is doing here.
xdg-user-dirs-update --force
# TODO: This instead? xdg-user-dirs-update

# Initialise the cursor.
# Without this, the Crosshair cursor theme isn't picked up in the root window.
xsetroot -cursor_name crosshair

# Start Xmonad.
exec xmonad
