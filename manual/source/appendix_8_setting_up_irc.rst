==========================
Appendix 8: Setting up IRC
==========================

Crosshair uses Weechat for IRC. Here's how to set it to to connect to a server
when it starts using your credentials.

First open Weechat::

    $ irc

Then in Weechat, assuming you want to connect to **irc.freenode.net** with
nickname **mynick** and password **mypassword**::

    /server add freenode irc.freenode.net
    /set irc.server.freenode.nicks "mynick,mynick2,mynick3,mynick4,mynick5"
    /set irc.server.freenode.autoconnect on
    /set irc.server.freenode.command "/msg nickserv identify mypassword"
