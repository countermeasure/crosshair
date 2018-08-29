#!/bin/bash

# Update ~/.config/user-dirs.dirs
# TODO: Change to : Update XDG user directories. ???
# TODO: Make sure the I know what --force is doing here.
xdg-user-dirs-update --force
# TODO: This instead? xdg-user-dirs-update

# Start Xmonad.
exec xmonad
