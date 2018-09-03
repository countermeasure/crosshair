===================
Chapter 8: Displays
===================


Listing displays
----------------

To see the list of connected displays::

    $ xrandr --listmonitors


Managing displays
-----------------

If you are on a notebook, your notebook's monitor is probably called LVDS-1.

If you have an external monitor connected, it will probably be called something
like HDMI-1 or DP-1.

Here are some examples which assume a notebook computer connected to an
external monitor by a DisplayPort.

Show the external monitor to the right of the notebook display::

    $ xrandr --output LVDS-1 --auto --output DP-1 --auto --right-of LVDS-1

Turn off the notebook display so that the only display is the external
monitor (useful when closing the notebook's lid)::

    $ xrandr --output LVDS-1 --off
