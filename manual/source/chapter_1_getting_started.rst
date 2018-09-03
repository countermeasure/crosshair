==========================
Chapter 1: Getting started
==========================

.. note:: This chapter contains the basic information you need to be able to start using Crosshair.
          It's brief and important, so please read it all!


CapsLock and Ctrl
-----------------

Crosshair swaps the ``CapsLock`` and the left ``Ctrl`` keys.

This means that in this manual:

- when you see ``Ctrl`` you should press the key labelled "CapsLock", and
- when you see ``CapsLock`` you should press the left-most key labelled "Ctrl".


Additional Escape key
---------------------

The key labelled "CapsLock" functions as ``Ctrl`` when pressed and held down.

It also functions as ``Escape`` when it's released.

You'll find that this is really useful for Vim.


Crosshair's Xmonad key bindings
-------------------------------

Crosshair uses both the ``Tab`` and ``\`` keys as Xmonad's modifier (``Mod``)
key.

Use whichever one is most comfortable for you for each Xmonad key binding.

Opening and closing windows
~~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``Mod`` + ``Enter`` opens a terminal window.
- ``Mod`` + ``\`` (hold down ``Tab`` then press ``\``) opens a web browser
  window.
- ``Mod`` + ``Backspace`` closes the focused window.

Navigating windows
~~~~~~~~~~~~~~~~~~

- ``Mod`` + ``h`` | ``j`` | ``k`` | ``l`` moves focus to the window which is
  left | down | up | right.
- ``Ctrl`` + ``h`` | ``j`` | ``k`` | ``l`` moves the focused window
  left | down | up | right.

Manipulating windows
~~~~~~~~~~~~~~~~~~~~

- ``Mod`` + ``Space`` changes to the next window tiling mode for this
  workspace.
- ``Mod`` + ``+`` | ``-`` makes the left-most window wider | narrower.
- ``Mod`` + ``Shift`` + ``Space`` resets the window dimensions to their
  defaults.

Workspaces
~~~~~~~~~~

- ``Mod`` + ``1`` to ``9`` switches to the workspace with that number.
- ``Mod`` + ``r`` opens the workspace name setter.

Programs
~~~~~~~~

- ``Mod`` + ``p`` opens the program launcher.

Quitting
~~~~~~~~

- ``Mod`` + ``Shift`` + ``q`` quits Xmonad.

Reference
~~~~~~~~~

- ``Mod`` + ``m`` opens this manual.


Status bar
----------

The status bar is shown at the very top of the screen.

Workspaces
~~~~~~~~~~

The left side of the status bar shows a numbered list of workspaces.

The current workspace is coloured yellow.

System information
~~~~~~~~~~~~~~~~~~

The right side of the status bar shows system information.

Here's how that breaks down from left to right:

.. raw:: html

  <p>
    <i class="fa fa-plug fa-fw" aria-hidden="true"></i>
    &nbsp; Battery level (when the computer is charging).
  </p>
  <p>
    <i class="fa fa-battery-half fa-fw" aria-hidden="true"></i>
    &nbsp; Battery level (when the computer is running on battery power).
  </p>
  <p>
    <i class="fa fa-cogs fa-fw" aria-hidden="true"></i>
    &nbsp; CPU load.
  </p>
  <p>
    <i class="fa fa-th fa-fw" aria-hidden="true"></i>
    &nbsp; Memory load.
  </p>
  <p>
    <i class="fa fa-wifi fa-fw" aria-hidden="true"></i>
    <i class="fa fa-lock fa-fw" aria-hidden="true"></i>
    &nbsp; Wifi network and signal strength (when a VPN is active).
  </p>
  <p>
    <i class="fa fa-wifi fa-fw" aria-hidden="true"></i>
    <i class="fa fa-unlock-alt fa-fw" aria-hidden="true"></i>
    &nbsp; Wifi network and signal strength (when a VPN is being activated).
  </p>
  <p>
    <i class="fa fa-wifi fa-fw" aria-hidden="true"></i>
    <i class="fa fa-unlock fa-fw" aria-hidden="true"></i>
    &nbsp; Wifi network and signal strength (when no VPN is active).
  </p>
  <p>
    <i class="fa fa-long-arrow-up fa-fw" aria-hidden="true"></i>
    &nbsp; Upload speed.
  </p>
  <p>
    <i class="fa fa-long-arrow-down fa-fw" aria-hidden="true"></i>
    &nbsp; Download speed.
  </p>
  <p>
    <i class="fa fa-volume-up fa-fw" aria-hidden="true"></i>
    &nbsp; Audio volume.
  </p>
  <p>
    <i class="fa fa-calendar-o fa-fw" aria-hidden="true"></i>
    &nbsp; Date.
  </p>
  <p>
    <i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>
    &nbsp; Time.
  </p>

