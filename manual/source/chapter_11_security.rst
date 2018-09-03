====================
Chapter 11: Security
====================


Changing the disk encryption passphrase
---------------------------------------

You can change the full disk encryption (FDE) passphrase with this command::

    $ change-fde-passphrase

This is an alias to::

    $  sudo cryptsetup luksChangeKey /dev/sda5
