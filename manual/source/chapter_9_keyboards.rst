====================
Chapter 9: Keyboards
====================

Hotplugging a keyboard
----------------------

When connecting a keyboard after startup, run this command to ensure that
Crosshair's key remappings take effect on it::

    $ xmodmap ~/.Xmodmap


Changing the keyboard language
------------------------------

Here's how to change the keyboard to a non-English language (to Arabic for
example), then back to English::

    $ setxkbmap -layout us && xmodmap ~/.Xmodmap
    $ setxkbmap -layout ar && xmodmap ~/.Xmodmap
    $ setxkbmap -layout us && xmodmap ~/.Xmodmap

Note that the first command doesn't change anything, but you want it available
in your history so that when you are unable to type in English you can still
access it using the ``UpArrow`` key.

