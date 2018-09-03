==============================
Appendix 5: Miscellaneous tips
==============================


Copy/paste and the terminal
---------------------------

To copy text from the terminal use ``Ctrl`` + ``Alt`` + ``c``.

To paste text into the terminal use ``Ctrl`` + ``Alt`` + ``v``.


The PATH
--------

Directories are added to the PATH in **~/.crosshair/files/dotfiles/.profile**.

To add another directory to the PATH, simple add another line like the
following into **.profile** below line 28::

    PATH+=":/absolute/path/to/the/directory"


User directories
----------------

The directories in the home directory do not have capitalised first letters the
way they do in many Linux distributions.

That is, Crosshair has **~/desktop** rather than **~/Desktop**, **~/documents**
rather than **~/Documents** and so on.

You can rename the **~/trash** directory to something else if you like. Maybe
you're prefer to call it **~/recycling** or **~/rubbish**. If you do that, you
should edit the **~/config/user-dirs.dirs** file to reflect the change.

For more information see
https://www.freedesktop.org/wiki/Software/xdg-user-dirs/.


Where to put executables
------------------------

If you download an executable file, put it in the **/usr/local/bin/**
directory.

Then make sure that the owner of the file is **root**, the group is **staff**,
and the permissions are **0755**.

Here's a real-world example of how to do that. Let's say you download a
compressed file called **geckodriver-v0.18.0-linux64.tar.gz** and you want to
extract and correctly save the binary called **geckodriver** which it
contains::

    $ sudo mv ~/downloads/geckodriver-v0.18.0-linux64.tar.gz /usr/local/bin
    $ sudo tar -zxvf geckodriver-v0.18.0-linux64.tar.gz
    $ sudo chown root:staff geckodriver
    $ sudo chmod 0755 geckodriver


Wallpapers
----------

Wallpapers go in **~/.wallpaper**.

To change the wallpaper, change this line in **~/.xinitrc** to point to your
new wallpaper file and then reboot::

    feh --bg-scale ~/.wallpaper/default.png


Photo slideshow
---------------

To see a slideshow of photos in your **~/photos** directory (and all
subdirectories)::

    $ slideshow
