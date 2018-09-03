======================
Appendix 2: Shell tips
======================


Finding and replacing
---------------------

Crosshair has a find-and-replace function which you can invoke with **fnr**
(think of "find 'n replace").

To find and replace all occurances of "foo" with "bar" in the current directory
and all directories under it::

    $ fnr foo bar

If you are using Ctags, you might want to follow a find and replace operation
by updating the Ctags definitions::

    $ ut


Compressed files
----------------


Tar archives
~~~~~~~~~~~~

To extract the contents of **compressed_file.tar.gz** into the current
directory::

    $ tar -zxvf compressed_file.tar.gz

To extract the contents of **compressed_file.tar** into the current directory::

    $ tar -xvf compressed_file.tar


Zip archives
~~~~~~~~~~~~

To extract the contents of **compressed_file.zip** into the current directory::

    $ unzip compressed_file.zip


Navigating directories
----------------------

Using ``cd``::

    $ cd      # Go to your home directory.
    $ cd /    # Go to the root directory.
    $ cd -    # Go to the last directory you were in.

Using ``autojump``::

    $ j whereever  # Go to the directory you visit most with the string
                   # 'whereever' somewhere in its path.
