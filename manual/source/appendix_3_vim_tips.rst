====================
Appendix 3: Vim tips
====================


Navigating to definitions
-------------------------

Ctags allow you to jump to definitions of classes/functions/variables.

For projects which exist already, you need to build a list of the project's
Ctags before you can use this functionality::

    $ cd /the/root/directory/of/the/project
    $ ut    # This is an alias. Think of it as standing for "update tags".

For new projects, you don't need to do this as the Ctags list is updated every
time you save a file in the Vim editor.

Now, to go to the definition of a class/function/variable, position your cursor
over it and press ``Ctrl`` + ``]``. To go back to where you came from after
looking at the definition press ``Ctrl`` + ``t``.


EasyMotion
----------

The EasyMotion plugin makes moving the cursor over long distances easier.

To use EasyMotion in a forward direction, press ``\`` ``\`` ``w``, and in a
backward direction press ``\`` ``\`` ``b``. Then type the letter(s) which
appear at the start of the word you want to move to.


Folding
-------

- ``Space`` creates, opens and closes folds.
- ``z`` ``i`` turns folding on and off.
- ``z`` ``R`` opens all folds.
- ``z`` ``M`` closes all folds.
- ``z`` ``E`` deletes all folds.


Repeating command-line commands
-------------------------------

In Vim, command-line commands are invoked with a ``:``.

- ``@:`` repeats the last command-line command.
- ``@@`` repeats an already-repeated command-line command.
- ``:`` then ``UpArrow`` | ``DownArrow`` scrolls through previous command-line
  commands.


Substitution (find and replace)
-------------------------------

To substitute "foo" with "bar":

- ``:%s/foo/bar/g`` does the substitution through the whole file.
- ``:%s/foo/bar/gc`` does the substitution through the whole file, confirming
  each replacement.
- ``:s/foo/bar/g`` does the substitution on every match on the current line.
- ``:s/foo/bar/`` does the substitution on the first match on the current line.

You can also use visual mode to select some text and limit the find/replace to
that selection. Once you've made the selection use ``:'<,'>s/foo/bar/g``.

And here's an example of how to use grouping:

- ``:%s/\([a-z]\+\)|\([a-z]\+\)/\2 > \1/`` turns "one|two" into "two > one".


CSV files
---------

The csv.vim plugin makes navigating CSV files easier:

- ``L`` moves to the next field.
- ``H`` moves to the previous field.
- ``K`` moves up a line in the same column.
- ``J`` moves down a line in the same column.


Vim settings
------------

To see the value of a Vim setting, such as "wrap" use ``:set wrap?``.
