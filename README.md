# KiCAD (6) Library Collection

This repository contains all symbols, footprints and 3d models I use with KiCAD.


## How to use
Clone this repository to your computer and add those symbols and footprints you need. I personally use git for all KiCAD projects and therefore often include this repo as a git submodule within the projects source code.
```
$ git submodule add git@github.com:slimcdk/slimc-kicad-libraries.git
$ git submodule update --init --recursive
```

## Project configurations
### Environment variables
To include 3d models, configure the following environment variables in your project. `library` is the absolutte path to where this repository lives on your system.
```
SLIMC_3DMODELS=<library>/slimc/3d-packages
ESPRESSIF_3DMODELS=<library>/espressif-kicad-libraries/3d
```

I'm actively searching for a dynamic way to point to these directories.



## External Libraries
* https://github.com/espressif/kicad-libraries.git
* https://github.com/Digi-Key/digikey-kicad-library.git
* https://github.com/Digi-Key/digikey-partner-kicad-library.git
* https://github.com/Gekkio/gekkio-kicad-libs.git
