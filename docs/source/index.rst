build_step
-----------

**build_step** is shell tool for analyzing build products.

Developed in `bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`_ code: **100%**.

|GitHub shell checker|

.. |GitHub shell checker| image:: https://github.com/vroncevic/build_step/workflows/build_step%20shell%20checker/badge.svg
   :target: https://github.com/vroncevic/build_step/actions?query=workflow%3A%22build_step+shell+checker%22

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

|GitHub issues| |Documentation Status| |GitHub contributors|

.. |GitHub issues| image:: https://img.shields.io/github/issues/vroncevic/build_step.svg
   :target: https://github.com/vroncevic/build_step/issues

.. |GitHub contributors| image:: https://img.shields.io/github/contributors/vroncevic/build_step.svg
   :target: https://github.com/vroncevic/build_step/graphs/contributors

.. |Documentation Status| image:: https://readthedocs.org/projects/build_step/badge/?version=latest
   :target: https://build_step.readthedocs.io/projects/build_step/en/latest/?badge=latest

.. toctree::
    :hidden:

    self

Installation
-------------

Navigate to release `page`_ download and extract release archive.

.. _page: https://github.com/vroncevic/build_step/releases

To install **build_step** type the following:

.. code-block:: bash

   tar xvzf build_step-x.y.z.tar.gz
   cd build_step-x.y.z
   cp -R ~/sh_tool/bin/   /root/scripts/build_step/ver.1.0/
   cp -R ~/sh_tool/conf/  /root/scripts/build_step/ver.1.0/
   cp -R ~/sh_tool/log/   /root/scripts/build_step/ver.1.0/

Or You can use Docker to create image/container.

|GitHub docker checker|

.. |GitHub docker checker| image:: https://github.com/vroncevic/build_step/workflows/build_step%20docker%20checker/badge.svg
   :target: https://github.com/vroncevic/build_step/actions?query=workflow%3A%22build_step+docker+checker%22

Dependencies
-------------

**build_step** requires next modules and libraries:

* sh_util `https://github.com/vroncevic/sh_util <https://github.com/vroncevic/sh_util>`_

Shell tool structure
---------------------

**build_step** is based on MOP.

Code structure:

.. code-block:: bash

   .
   ├── bin/
   │   └── build_step.sh
   ├── conf/
   │   ├── build_step.cfg
   │   └── build_step_util.cfg
   └── log/
       └── build_step.log

Copyright and licence
----------------------

|License: GPL v3| |License: Apache 2.0|

.. |License: GPL v3| image:: https://img.shields.io/badge/License-GPLv3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |License: Apache 2.0| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0

Copyright (C) 2017 by `vroncevic.github.io/build_step <https://vroncevic.github.io/build_step>`_

**build_step** is free software; you can redistribute it and/or modify it
under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

|Free Software Foundation|

.. |Free Software Foundation| image:: https://raw.githubusercontent.com/vroncevic/build_step/dev/docs/fsf-logo_1.png
   :target: https://my.fsf.org/

|Donate|

.. |Donate| image:: https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif
   :target: https://my.fsf.org/donate/

Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
