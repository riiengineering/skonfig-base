cdist-type__timezone(7)
=======================

NAME
----
cdist-type__timezone - Configure the system timezone.


DESCRIPTION
-----------
This type creates a symlink (``/etc/localtime``) to the selected
timezone (which should be available in ``/usr/share/zoneinfo``).


REQUIRED PARAMETERS
-------------------
tz
   The name of the timezone to set.


EXAMPLES
--------

.. code-block:: sh

   # Set up Europe/Andorra as our timezone.
   __timezone --tz Europe/Andorra

   # Set up US/Central as our timezone.
   __timezone --tz US/Central


AUTHORS
-------
* Steven Armstrong <steven-cdist--@--armstrong.cc>
* Nico Schottelius <nico-cdist--@--schottelius.org>
* Ramon Salvadó <rsalvado--@--gnuine.com>
* Dennis Camera <dennis.camera--@--riiengineering.ch>


COPYING
-------
Copyright \(C) 2012-2020 the `AUTHORS`_.
You can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.
