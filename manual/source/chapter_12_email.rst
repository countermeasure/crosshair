=================
Chapter 12: Email
=================

Mutt
----

Mutt is Crosshair's default email client.

To use it, you need to add a **~/.muttrc** file.

IMAP
----

To access your email via IMAP, your **~/.muttrc** file should look like this::

    set folder = "imaps://imap.your_email_host.com"
    set spoolfile = "+INBOX"
    set imap_user = "your_full_email_address"

Using Mutt
----------

Open it with ``Mod`` + ``e``.

Change folders with ``c``, then select the folder.

Delete a message while hovering over it with ``d``. Undelete a message with
``u``.

Go to a particular message, type its number (e.g. ``376``) then ``Enter``.

To sync the changes you've made in mutt to the server (for example, deleting
messages), press ``$``.
