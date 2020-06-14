# Build step tool for x86-64 and GCC4.9.2.

***build_step*** is shell tool for analyze build products.

Developed in bash code: ***100%***.

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/build_step.svg)](https://github.com/vroncevic/build_step/issues)
 [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/build_step.svg)](https://github.com/vroncevic/build_step/graphs/contributors)

<!-- START doctoc -->
**Table of Contents**

- [Installation](https://github.com/vroncevic/build_step#installation)
- [Usage](https://github.com/vroncevic/build_step#usage)
- [Dependencies](https://github.com/vroncevic/build_step#dependencies)
- [Shell tool structure](https://github.com/vroncevic/build_step#shell-tool-structure)
- [Docs](https://github.com/vroncevic/build_step#docs)
- [Copyright and Licence](https://github.com/vroncevic/build_step#copyright-and-licence)
<!-- END doctoc -->

### INSTALLATION

Navigate to release [page](https://github.com/vroncevic/build_step/releases) download and extract release archive.

To install modules type the following:

```
tar xvzf build_step-x.y.z.tar.gz
cd build_step-x.y.z
cp -R ~/sh_tool/bin/   /root/scripts/build_step/ver.1.0/
cp -R ~/sh_tool/conf/  /root/scripts/build_step/ver.1.0/
cp -R ~/sh_tool/log/   /root/scripts/build_step/ver.1.0/
```

![alt tag](https://raw.githubusercontent.com/vroncevic/build_step/dev/docs/setup_tree.png)

Or You can use docker to create image/container.

### USAGE

```
# Create symlink for shell tool
ln -s /root/scripts/build_step/ver.1.0/bin/build_step.sh /root/bin/build_step

# Setting PATH
export PATH=${PATH}:/root/bin/

# Start analyze build products
build_step start
```

### DEPENDENCIES

This tool requires these other modules and libraries:

* sh_util https://github.com/vroncevic/sh_util

### SHELL TOOL STRUCTURE

***build_step*** is based on MOP.

Shell tool structure:
```
.
├── bin/
│   └── build_step.sh
├── conf/
│   ├── build_step.cfg
│   └── build_step_util.cfg
└── log/
    └── build_step.log
```

### DOCS

[![Documentation Status](https://readthedocs.org/projects/build_step/badge/?version=latest)](https://build_step.readthedocs.io/projects/build_step/en/latest/?badge=latest)

More documentation and info at:

* https://build_step.readthedocs.io/en/latest/

### COPYRIGHT AND LICENCE

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2018 by https://vroncevic.github.io/build_step

This tool is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

