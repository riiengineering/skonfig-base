cdist-type__group(7)
====================

NAME
----
cdist-type__group - Manage groups


DESCRIPTION
-----------
This type allows you to create or modify groups on the target.


OPTIONAL PARAMETERS
-------------------
gid
   cf. :strong:`groupmod`\ (8).
password
   see above
state
   One of:

   ``present``
      ...
   ``absent``
      ...

   Defaults to: ``present``


BOOLEAN PARAMETERS
------------------
system
   cf. :strong:`groupadd`\ (8).

   :strong:`NB:` this parameter Applies only at group creation.


MESSAGES
--------
mod
   group is modified
add
   New group added
remove
   group is removed
change <property> <new_value> <current_value>
   Changed group property from current_value to new_value
set <property> <new_value>
   set property to new value, property was not set before


EXAMPLES
--------

.. code-block:: sh

   # Create a group 'foobar' with operating system default settings
   __group foobar

   # Remove the 'foobar' group
   __group foobar --state absent

   # Create a system group 'myservice' with operating system default settings
   __group myservice --system

   # Same but with a specific gid
   __group foobar --gid 1234

   # Same but with a gid and password
   __group foobar --gid 1234 --password 'crypted-password-string'


AUTHORS
-------
* Steven Armstrong <steven-cdist--@--armstrong.cc>
* Dennis Camera <dennis.camera--@--riiengineering.ch>


COPYING
-------
Copyright \(C) 2011-2015 Steven Armstrong, 2024 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
