cdist-type__aix_security(7)
===========================

NAME
----
cdist-type__aix_security - Change attributes in AIX security stanza files


DESCRIPTION
-----------
This type can be used to change the attributes stored in AIX security
configuration stanza files (``/etc/security/...``).


REQUIRED PARAMETERS
-------------------
file
   The name of the file to modify.

   Must be one of the files allowed, cf. :strong:`chsec`\ (1) for more
   information.
stanza
   The name of the stanza (section name) to modify.


OPTIONAL PARAMETERS
-------------------
attribute
   The attribute (inside the ``--stanza``) to modify using the
   ``attribute=value`` syntax.

   If the value is empty, the attribute is removed.
   When ``--state absent`` the value is ignored and may be omitted.

   Can be used multiple times to set multiple attributes.
state
   One of:

   ``present``
      The attribute is set in the ``--file``.
   ``absent``
      The attribute is removed from the ``--file``.

   Defaults to: ``present``


EXAMPLES
--------

.. code-block:: sh

   # Use strong password hashing
   __aix_security /etc/security/login.cfg:usw:pwd_algorithm \
      --file /etc/security/login.cfg \
      --stanza usw \
      --attribute 'pwd_algorithm=ssha512'

   # And the inverse: allow root to use bad passwords (testing only, of course)
   __aix_security /etc/security/user:root:bad_passwords \
      --file /etc/security/user \
      --stanza root \
      --attribute minage=0 \
      --attribute maxage=0 \
      --attribute minlen=4 \
      --attribute minalpha=0 \
      --attribute minother=0 \
      --attribute mindiff=0 \
      --attribute histsize=0 \
      --attribute dictionlist=''

   # Change the default user shell
   __aix_security user_default_ksh93 \
      --file /etc/security/mkuser.default \
      --stanza user \
      --attribute shell=/usr/bin/ksh93


SEE ALSO
--------
* :strong:`chsec`\ (1)


AUTHORS
-------
* Dennis Camera <dennis.camera--@--riiengineering.ch>


COPYING
-------
Copyright \(C) 2025 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
