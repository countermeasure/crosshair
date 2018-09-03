=======================
Chapter 10: Maintenance
=======================

For now, Crosshair needs to be updated/upgraded manually. It's a Debian system,
so this can be done with **apt**.

First, get the details of the latest packages available::

    $ sudo apt update

If you like, you can then see which packages upgrades are available for::

    $ apt --upgradable list

Then perform the upgrade::

    $ sudo apt upgrade

When you run out of space in **/boot** because it is full of old kernels which
are no longer in use, you can remove the old kernels with::

    $ sudo apt autoremove
