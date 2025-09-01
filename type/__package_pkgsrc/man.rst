cdist-type__package_pkgsrc(7)
=============================

NAME
----
cdist-type__package_pkgsrc - Manage packages using the pkgsrc package manager.


DESCRIPTION
-----------
This space intentionally left blank.


OPTIONAL PARAMETERS
-------------------
name
   ...
version
   ...
state
   One of:

   ``present``
      the package is installed
   ``absent``
      the package is not installed


BOOLEAN PARAMETERS
------------------
None.


EXAMPLES
--------

.. code-block:: sh

   # Install the htop package
   __package_pkgsrc htop

   # Install Bash 2.05 (if you need such an old version for whatever reason)
   __package_pkgsrc bash --version '>=2.0<3'


SEE ALSO
--------
* :strong:`pkg_add`\ (1)
* https://pkgsrc.org/


AUTHORS
-------
* Dennis Camera <dennis.camera--@--riiengineering.ch>


COPYING
-------
Copyright \(C) 2025 Dennis Camera.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
