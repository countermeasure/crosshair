=========================
Appendix 4: Postgres tips
=========================

On a new installation, the user **postgres** is in charge of all things related
to Postgres. No other users have permissions for any Postgres operations.


Creating roles and databases
----------------------------

To work with a Postgres database, first make a Postgres role which will own the
database, then create the database.

Note that Postgres roles are not related to Operating System users.

As an example, this will create a database called **crosshair** which is owned
by a role called **countermeasure**::

    $ sudo su postgres                        # Become the "postgres" user
    $ createuser -s -P countermeasure         # Create the role with a password
    $ createdb crosshair -O countermeasure    # Create the database
    $ exit


Connecting to a database
------------------------

To connect to the database::

    $ psql -d crosshair -U countermeasure -h localhost

It's important to specify ``-h localhost`` as this will authenticate your user
with a password. If you don't use it, you're likely to get an error which looks
like this:

.. code-block:: none

    psql: FATAL:  Peer authentication failed for user "countermeasure"


Deleting roles and databases
----------------------------

Deleting is best done as the **postgres** user, as that user has all the
required permissions.

::

    $ sudo su postgres           # Become the "postgres" user
    $ dropuser countermeasure    # Delete the role "countermeasure"
    $ dropdb crosshair           # Delete the database "crosshair"
