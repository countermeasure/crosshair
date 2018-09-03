======================
Chapter 13: Encryption
======================


GnuGP
-----

Crosshair, because it uses Debian, uses GnuPG for encryption


Basic GnuPG operations
----------------------

To add someone's public key contained in the file **this_pgp_key.txt** to the
GnuPG keyring so that you can use it to encrypt email to them::

    $ gpg --import this_pgp_key.txt

To list all keys in the keyring::

    # gpg --list-keys
