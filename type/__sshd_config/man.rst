cdist-type__sshd_config(7)
==========================

NAME
----
cdist-type__sshd_config - Manage options in sshd_config


DESCRIPTION
-----------
This space intentionally left blank.


OPTIONAL PARAMETERS
-------------------
file
   The path to the sshd_config file to edit.

   Defaults to: ``/etc/ssh/sshd_config``
match
   Restrict this option to apply only for certain connections.
   Allowed values are what would be allowed to be written after a ``Match``
   keyword in ``sshd_config``, e.g. ``--match 'User anoncvs'``.

   Can be used multiple times. All of the values are ANDed together.
option
   The name of the option to manipulate. Defaults to ``__object_id``.
state
   One of:

   ``present``
      ensure a matching config line is present (or the default value).
   ``absent``
      ensure no matching config line is present.
value
   The value to be assigned to (if ``--state present``) or
   removed from (if ``--state absent``) the option specified by ``--option``.

   This option is required if ``--state present``. If not specified and
   ``--state absent``, all values for the given option are removed.

   **NB:** If the value starts with a ``-``, escape it by preceed the value
   With a Backslash (``\``), e.g.
   ``__sshd_config Ciphers --value '\-chacha20-poly1305*'``.


EXAMPLES
--------

.. code-block:: sh

   # Disallow root logins with password
   __sshd_config PermitRootLogin --value without-password

   # Disallow password-based authentication
   __sshd_config PasswordAuthentication --value no

   # Accept the EDITOR environment variable
   __sshd_config AcceptEnv:EDITOR --option AcceptEnv --value EDITOR

   # Force command for connections as git user
   __sshd_config git@ForceCommand --match 'User git' --option ForceCommand \
       --value 'cd ~git && exec git-shell ${SSH_ORIGINAL_COMMAND:+-c "${SSH_ORIGINAL_COMMAND}"}'


BUGS
----
* This type assumes a nicely formatted config file,
  i.e. no config options spanning multiple lines.
* ``Include`` directives are ignored.
* Config options are not added/removed to/from the config file if their value is
  the default value.
* ``Match``es with multiple conditions are only considered identical if the
  conditions are listed in the same order.
* This type does not remove empty Match blocks from the config file after the
  last option was removed.


SEE ALSO
--------
* :strong:`sshd_config`\ (5)


AUTHORS
-------
* Dennis Camera <dennis.camera--@--riiengineering.ch>


COPYING
-------
Copyright \(C) 2020-2024 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
