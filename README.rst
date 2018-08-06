=========
Crosshair
=========

Crosshair is an Xmonad environment for Debian.

It aims to be simple-to-install, elegant, lightweight, and thoroughly
documented.


Installing Crosshair
--------------------


Quick start
~~~~~~~~~~~

Crosshair is installed onto a new minimal installation of Debian 9 (a.k.a.
Debian Stretch).

We'll call the machine you're installing Crosshair onto the target machine, and
for the purposes on this quick-start guide, we'll assume you have it set up
with a fresh minimal Debian install already.

On a different machine, clone this repo onto a flash drive::

    $ cd /media/cdrom  # assuming flash drive mount point
    $ git clone https://github.com/countermeasure/crosshair.git

Then plug the flash drive into the target machine and run the Crosshair
installer::

    $ sudo mount /dev/sdb1 /media/cdrom  # assuming device name and mount point
    $ cd /media/cdrom/crosshair/installer
    $ ./install_crosshair


Detailed instructions
~~~~~~~~~~~~~~~~~~~~~

For detailed installation instructions, including a step-by-step guide to
creating a minimal installation of Debian 9, see INSTALLATION.rst.
