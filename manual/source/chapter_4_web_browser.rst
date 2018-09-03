======================
Chapter 4: Web browser
======================


Firefox
-------

Firefox is Crosshair's default web browser.


Extensions
~~~~~~~~~~

When Firefox starts for the first time, you will be asked to activate the
extensions that Crosshair has installed. It's recommended to activate them all.

They are:

- `Dark Background and Light Text
  <https://addons.mozilla.org/en-US/firefox/addon/dark-background-light-text/>`_
- `HTTPS Everywhere
  <https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/>`_
- `Privacy Badger
  <https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/>`_
- `uBlock Origin
  <https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/>`_
- `Vimium
  <https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/>`_


Vimium key bindings
~~~~~~~~~~~~~~~~~~~

Vimium provides Vim-style key bindings in Firefox.

To see the list of Vimium key bindings press ``?`` while in Firefox.


Current version
~~~~~~~~~~~~~~~

Debian stable provides the Firefox ESR package. Because new Firefox
versions are released many times each year, and because there are good
performance and security reasons to have an up-to-date web browser, Crosshair
installs the current version of Firefox is installed 'manually'.

It's installed in the **/opt** directory, and there is a symlink to its
executable in **/opt/bin**.


Upgrading Firefox to the newest version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When Firefox notifies you that a new version is available, you can upgrade to
it by opening a terminal and issuing this command::

    $ upgrade-firefox


Chromium
--------

Chromium is a recommended package.

Having a secondary browser is a good idea for any sites which don't work quite
right with Firefox.
