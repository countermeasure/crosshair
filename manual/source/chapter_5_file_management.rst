==========================
Chapter 5: File management
==========================

Ranger is Crosshair's file manager.

It runs in the terminal, is curses-based and has VI key bindings.


Opening ranger
--------------

Open ranger in a terminal like so::

    $ r    # "r" is an alias for "ranger"


Ranger key bindings
-------------------

Crosshair uses Ranger's default key bindings which you can see in
:doc:`appendix_7_ranger_cheatsheet`.


Media
-----

If you plug in an external drive, it should automatically mount to
**/media/your_username**.

To unmount it, use the key binding ``Mod`` + ``u``, then select the drive to
unmount from the menu.


Trash
-----

There is a trash bin located in your home directory at **~/trash**.

To move a file called **delete_this_file.txt** to trash, move a directory
called **delete_this_directory** to trash, then empty the trash::

    $ trash delete_this_directory
    $ trash delete_this_file.txt
    $ trash-empty

The **trash** command is aliased to **t**, and **trash-empty** is aliased to
**te** so the above commands can be replaced by the following::

    $ t delete_this_file.txt
    $ t delete_this_directory
    $ te

You can rename the **trash** directory to something else if you like. Maybe
you're prefer to call it **recycling** or **rubbish**. If you do that, you
should edit the **~/.config/user-dirs.dirs** file to reflect the change.

For additional information see
https://www.freedesktop.org/wiki/Software/xdg-user-dirs/.
