# PELA Drift Car
## 3D Printed LEGO-compatible Parametric 1:10 Scale RC Drift Car Cover Based On [PELA Blocks](http://pelablocks.org)

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

**This drift car is a work in progress.**

## Open source design, Powered By Futurice

[![Futurice](images/futurice-logo.jpg)](https://futurice.com)

These open source designs are brought to you by [Futurice](http://futurice.com) and contributions from the community. Come work with the best.

The software needed is free and open source, [OpenSCAD](http://www.openscad.org/). You can probably learn it in less than an hour.

## Models

___


[![PELA riser block with technic connectors](/docs/images/riser-4-2-4.png)](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/riser-4-2-4.stl)

[3D PELA riser block with technic connectors](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/riser-4-2-4.stl) Optional vents help to dissipate heat. There are several types you can select from.


## Downloading

If you prefer to avoid git, you can download the files instead.

1. Download and unzip **[PELA Drift Car](https://github.com/LEGO-Prototypes/PELA-drift-car/archive/master.zip)**
1. Download and unzip **[PELA Blocks](https://github.com/LEGO-Prototypes/PELA-blocks/archive/master.zip)** as a subdirectory (`PELA-robot-hand\PELA-blocks`)
1. **[Calibrate](http://pelablocks.org/#calibrate)** the models to your printer/filament/slicer/preferences

## Git Clone

1. `git lfs install` and `git clone --recurse-submodules git@github.com:LEGO-compatible-gadgets/PELA-drift-car.git`
1. `cd PELA-drift-car\PELA-parameteric-blocks` and then `git checkout master`
1. **[Calibrate](http://pelablocks.org/#calibrate)** the models to your printer/filament/slicer/preferences
1. When PELA Blocks changes, [backup your calibration files](#calibration-file-backup) if needed, then either `git submodule update --remote` or cd into the submodule and `git reset --hard origin/master` and `git pull`

See also [Advanced Setup](http://pelablocks.org/ADVANCED-SETUP.html)

## Calibration

**IMPORTANT:** The STL models must be customized for your material, printer and slicer. First **[calibrate](http://pelablocks.org/#calibrate)** the PELA blocks for your printer to achieve a nice snap fit.

See also [Advanced Calibration](http://pelablocks.org/ADVANCED-CALIBRATION)

## Calibration File Backup

If you later update the PELA-blocks project to a newer version, you risk overwirting and loosing your calibration customizations. The simplest solution is to create a backup copy those settings.

1. `cd PELA-drift-car/PELA-Blocks`
1. `cp PELA-parameters.scad ../PELA-parameters-backup.scad`
1. `cp PELA-print-parameters.scad ../PELA-print-parameters-backup.scad`

## Use

Edit the [OpenSCAD](http://www.openscad.org/) files to generate different views such as one finger at a time.

Be patient, have a nice meal and a coffee, the models are complex and render slowly.

## License

[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/3.0/88x31.png)](https://creativecommons.org/licenses/by-sa/4.0/)

**Creative Commons Attribution-ShareAlike 4.0 International License**

These designs are by PELA project contributors, not by the LEGO corporation. They are compatible with LEGO and similar blocks available from multiple manufacturers and online projects. The associated patents have expired. These designs are not identical to LEGO; they have been specially modified for easy 3D printing and offered in the spirit of open source collaborative innovation.

If what you want is available as injection molded plastic, buy it for the higher quality and durability. These model are helpful when you want something customized, a special color, an unusual material, and for replacement parts when you just can't wait.

## Contact

Collaboration and pull requests are welcome: [Git Project](https://github.com/LEGO-Prototypes/PELA-drift-car)

paul.houghton@futurice.com ( **[Blog](https://medium.com/@paulhoughton)** - **[Twitter](https://twitter.com/mobile_rat)** )

If you like it, please tweet about us! [<img src="images/share-twitter-button.jpg">](https://twitter.com/intent/tweet?screen_name=mobile_rat&hashtags=PELAblocks&related=mobile_rat&text=3D%20printed%20LEGO%20drift%20car%20shell&tw_p=tweetbutton&url=http%3A%2F%2Fdriftcar.pelablocks.org)
