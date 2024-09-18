cdist-type__user_groups(7)
==========================

NAME
----
cdist-type__user_groups - Manage user groups


DESCRIPTION
-----------
This type can be used to add or remove a user from one or more
secondary groups.


REQUIRED PARAMETERS
-------------------
group
   The group to which this user should be added or removed (depending
   on ``--state``).

   Can be used multiple times to specify multiple groups.


OPTIONAL PARAMETERS
-------------------
state
   One of:

   ``present``
      the user is added to the given ``--group``s.
   ``absent``
      the user is removed from the given ``--group``s.

   Defaults to: ``present``
user
   The name of the user to add or remove from the groups.

   Defaults to: ``__object_id``


EXAMPLES
--------

.. code-block:: sh

   # On OpenBSD allow user manuel to use the shutdown(8) command
   __user_groups manuel \
      --group _shutdown

   # Add user joe to various groups useful for desktop users
   __user_groups joe \
      --group audio \
      --group video \
      --group scanner \
      --group cdrom \
      --group floppy \
      --group bluetooth \
      --group plugdev

   # Remove user joe from the group wheel
   __user_groups better_not_give_them_too_much_power_smiley \
      --user joe \
      --state absent \
      --group wheel


AUTHORS
-------
* Steven Armstrong <steven-cdist--@--armstrong.cc>
* Dennis Camera <dennis.camera--@--riiengineering.ch>


COPYING
-------
Copyright \(C) 2012 Steven Armstrong, 2024 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
