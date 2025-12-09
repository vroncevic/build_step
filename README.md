# Build step tool for x86-64 and GCC10.2.1

<img align="right" src="https://raw.githubusercontent.com/vroncevic/build_step/dev/docs/build_step_logo.png" width="25%">

**build_step** is shell tool for analyzing build products.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![build_step_shell_checker](https://github.com/vroncevic/build_step/actions/workflows/build_step_shell_checker.yml/badge.svg)](https://github.com/vroncevic/build_step/actions/workflows/build_step_shell_checker.yml)

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/build_step.svg)](https://github.com/vroncevic/build_step/issues) [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/build_step.svg)](https://github.com/vroncevic/build_step/graphs/contributors)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Shell tool structure](#shell-tool-structure)
- [Docs](#docs)
- [Copyright and licence](#copyright-and-licence)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Installation

![Debian Linux OS](https://raw.githubusercontent.com/vroncevic/apmodule/dev/docs/debtux.png)

Navigate to release **[page](https://github.com/vroncevic/build_step/releases)** download and extract release archive.

To install **build_step** type the following

```bash
tar xvzf build_step-4.0.tar.gz
cd build_step-4.0
cp -R ~/sh_tool/bin/   /root/scripts/build_step/ver.4.0/
cp -R ~/sh_tool/conf/  /root/scripts/build_step/ver.4.0/
cp -R ~/sh_tool/log/   /root/scripts/build_step/ver.4.0/
```

Self generated setup script and execution

```bash
./build_step_setup.sh 

[setup] installing App/Tool/Script build_step
	Tue Dec  2 07:29:50 PM CET 2025
[setup] clean up App/Tool/Script structure
[setup] copy App/Tool/Script structure
[setup] remove github editor configuration files
[setup] set App/Tool/Script permission
[setup] create symbolic link of App/Tool/Script
[setup] done

/root/scripts/build_step/ver.4.0/
├── bin
│   └── build_step.sh
├── conf
│   ├── build_step.cfg
│   ├── build_step.logo
│   └── build_step_util.cfg
└── log
    └── build_step.log

4 directories, 5 files
lrwxrwxrwx 1 root root 50 Dec  2 19:29 /root/bin/build_step -> /root/scripts/build_step/ver.4.0/bin/build_step.sh
```

Or You can use docker to create image/container.

### Usage

```bash
# Create symlink for shell tool
ln -s /root/scripts/build_step/ver.4.0/bin/build_step.sh /root/bin/build_step

# Setting PATH
export PATH=${PATH}:/root/bin/

# Start analyze build products
build_step ver.4.0
Tue Dec  2 07:30:18 PM CET 2025

[check_root] Check permission for current session? [ok]
[check_root] Done

                                                                        
   ██              ██  ██      ██                 ██                    
  ░██             ░░  ░██     ░██                ░██                    
  ░██      ██   ██ ██ ░██     ░██        ██████ ██████  █████  ██████   
  ░██████ ░██  ░██░██ ░██  ██████       ██░░░░ ░░░██░  ██░░░██░██░░░██  
  ░██░░░██░██  ░██░██ ░██ ██░░░██      ░░█████   ░██  ░███████░██  ░██  
  ░██  ░██░██  ░██░██ ░██░██  ░██       ░░░░░██  ░██  ░██░░░░ ░██████   
  ░██████ ░░██████░██ ███░░██████ █████ ██████   ░░██ ░░██████░██░░░    
  ░░░░░    ░░░░░░ ░░ ░░░  ░░░░░░ ░░░░░ ░░░░░░     ░░   ░░░░░░ ░██       
                                                              ░░        
	                                           
		Info   github.io/build_step ver.4.0 
		Issue  github.io/issue
		Author vroncevic.github.io

[build_step] Loading basic and util configuration!
100% [================================================]

[load_conf] Loading App/Tool/Script configuration!
[check_cfg] Checking configuration file [/root/scripts/build_step/ver.4.0/conf/build_step.cfg] [ok]
[check_cfg] Done

[load_conf] Done

[load_util_conf] Load module configuration!
[check_cfg] Checking configuration file [/root/scripts/build_step/ver.4.0/conf/build_step_util.cfg] [ok]
[check_cfg] Done

[load_util_conf] Done

[build_step] C preprocessor!
[build_step] Generating assembly code!
[build_step] Generating object file!
[build_step] Generating ELF file!
[build_step] Set owner!
[build_step] Set permission!
[build_step] Done
```

### Dependencies

**build_step** requires next modules and libraries
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**build_step** is based on MOP.

Shell tool structure

```bash
sh_tool/
├── bin/
│   └── build_step.sh
├── conf/
│   ├── build_step.cfg
│   ├── build_step.logo
│   └── build_step_util.cfg
└── log/
    └── build_step.log
```

### Docs

[![Documentation Status](https://readthedocs.org/projects/build_step/badge/?version=latest)](https://build-step.readthedocs.io/projects/build_step/en/latest/?badge=latest)

More documentation and info at
* [https://build_step.readthedocs.io/en/latest/](https://build-step.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)
* [https://www.gnu.org/manual/manual.en.html](https://www.gnu.org/manual/manual.en.html)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-4.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2017 - 2026 by [vroncevic.github.io/build_step](https://vroncevic.github.io/build_step)

**build_step** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/build_step/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
