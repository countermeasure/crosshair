===================
Chapter 3: Terminal
===================

Crosshair provides the Urxvt terminal with the Bash shell.


Opening and closing
-------------------

- ``Mod`` + ``Enter`` opens a terminal window.
- ``Ctrl`` + ``d`` closes the focused terminal window.
- ``Mod`` + ``Backspace`` also closes the focused window.


Text size
---------

- ``Ctrl`` + ``+`` | ``-`` increases | decreases the focused terminal window's
  text size.
- ``Ctrl`` + ``0`` returns the focused terminal window's text to the default
  size.


Prompt
------

The terminal prompt always shows the time and the current working directory.

If you have a virtualenv active, it will show the name of the virtualenv.

If you are in a Git repository, it will show the name of the current branch.

For example::

    14:53  ~/projects/crosshair  ♦ myVenv   master
    $


Scrolling
---------

Press ``Shift`` + ``UpArrow`` | ``DownArrow`` to scroll one line up | down.

Press ``Shift`` + ``PageUp`` | ``PageDown`` to scroll one window-height up |
down.


Custom aliases and functions
----------------------------

There are some useful Bash aliases and functions in
**~/.crosshair/dotfiles/.bash_aliases** and
**~/.crosshair/dotfiles/.bash_functions**.
