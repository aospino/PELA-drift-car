# PELA Autonomous Drift Car
## 3D Printed LEGO-compatible Parametric 1:10 Scale RC Drift Car Cover Based On [PELA Blocks](http://pelablocks.org)

A high-end RC drift car is modified with 3D printed PELA blocks, LEGO technics, a Raspberry Pi 3+ and camera to drive itself. Snap on additional sensors and custom body parts as your design evolves. At Futurice, we use this to compete and learn. Our different offices race each other to see who has the mad deep learning skills to drive the car around a track the fastest.

To install, get the last preview release of [OpenSCAD](https://www.openscad.org/) then:

`git clone git@github.com:LEGO-compatible-gadgets/PELA-drift-car.git --recurse-submodules`

![PELA Carson Drift Car](images/pela-drift-car.jpg)

![PELA TT-02 Drift Car](images/pela-drift-car-top.jpg)

![PELA Drift Car Maiden Voyage](images/DonkeyCar-Maiden-Voyage.gif)

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

**This drift car is a work in progress.** PELA Blocks and some imagination with LEGO technics will offer you all the parts you need and see here in the picture. Instructions are currently a bit thin as we iterate fast. We'll get to it. Promise.

This car has been designed to compete in [Markku.ai](https://markku.ai/). You can find more resources and ideas there. **Markku.ai** is a **Donkeycar**-derived autonomous driving competition based using high end 1:10 electric drift cars. If you're going to crah- do it with style.

Please see [donkeycar.com](http://www.donkeycar.com/) for help with the basic software setup. This car is a high performace, pimped-out version of what you find there.



## Assembly Instructions

[![PELA Drift Car Assembly](images/PELA-drift-car-assembly.png)](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-drift-car-assembly.stl)

[PELA Drift Car Assembly](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-drift-car-assembly.stl) Calibrate for your pinter as described in [PELA Blocks](https://pelablocks.org) and then export the calibrated models from [OpenSCAD](https://www.openscad.org/). Purchase a TT-02 car, boards, power bank battery and a bag of technic pins as needed. Aseemble according to the image and linked websites above. Drive. Win. 


## Models

[![PELA Drift Car Center Beam](images/PELA-drift-car-center-beam.png)](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-drift-car-center-beam.stl)

[PELA Drift Car Center Beam](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-drift-car-center-beam.stl) A configurable spine that runs down the center of an RC car for attaching other PELA parts. This part makes future upgrades and field reconfiguration and repair easier and much faster by using only technic pins are needed to make changes. For smaller printers, you may optionally render this as two shorter sections that can be joined by placing technic beams down the sides ovelapping both pieces. Use what you have laying around or print from [PELA technic beam](https://pelablocks.org).

___

[![PELA Drift Car End Connector](images/PELA-drift-car-end-connector.png)](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-drift-car-end-connector.stl)

[PELA Drift Car End Connector](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-drift-car-end-connector.stl) An adapter for both ends of the Drift Car Center Beam. Two mounting holes at each end allow quick disconnect of the entire electronics beam from the donor Tamiya TT-02 1:10 RC drift car. From the drop-down menu in OpenSCAD you can select an alternative design for a Carson drift car. The end connector holes line up with each car's mount holes. Use long technic pins or bolts to mount the end connector to the car near the suspension. The TT-02 model can be used for both front and back. The Carson connector only fits at the back of the car, so use a [strap mount](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/PELA-strap-mount.stl) of appropriate size for the front attachment.

___

[![PELA Drift Car Tamiya TT-02 Body Mount](images/PELA-body-mount.png)](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-body-mount.stl)

[PELA Drift Car Tamiya TT-02 Body Mount](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-body-mount.stl) An optional mounting point for a pre-made polycarbonate car body shell.

___

[![PELA Raspberry Pi 3B Technic Mount](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/technic-mount/PELA-raspberry-pi3-technic-mount.png)](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/technic-mount/PELA-raspberry-pi3-technic-mount.stl)

[PELA Raspberry Pi 3B Technic Mount](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/technic-mount/PELA-raspberry-pi3-technic-mount.stl) A Raspberry Pi 3B+ holder.

___

[![PELA PCA9685 16 Channel Servo Board Technic Mount](https://github.com/LEGO-compatible-gadgets/technic-mount/PELA-parametric-blocks/blob/master/PELA-pca9685-servo-board-technic-mount.png)](https://github.com/LEGO-compatible-gadgets/technic-mount/PELA-parametric-blocks/blob/master/PELA-pca9685-servo-board-technic-mount.stl)

[PELA PCA9685 16 Channel Servo Board Technic Mount](https://github.com/LEGO-compatible-gadgets/technic-mount/PELA-parametric-blocks/blob/master/PELA-pca9685-servo-board-technic-mount.stl) For holding a servo driver board to the center bar.

___

[![PELA Raspberry Pi Camera Technic Mount](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/technic-mount/PELA-raspberry-pi-camera-technic-mount.stl)](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/technic-mount/PELA-raspberry-pi-camera-technic-mount.stl)

[PELA Raspberry Pi Camera Technic Mount](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/technic-mount/PELA-raspberry-pi-camera-technic-mount.stl) A Raspberry Pi 3 camera holder.

___

[![PELA Technic Bent Beam](images/PELA-technic-bent-beam.png)](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-technic-bent-beam.stl)

[PELA Technic Bent Beam](https://github.com/LEGO-compatible-gadgets/PELA-drift-car/blob/master/PELA-technic-bent-beam.stl) This is to mount the front wide angle Pi camera to the front TT-02 End Connector at a 30 degree down angle. Print two copies and make two small holes in the shell.

___

[![PELA Technic Sign](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/sign/PELA-technic-sign.png)](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/sign/PELA-technic-sign.stl)

[PELA Technic Sign](https://github.com/LEGO-compatible-gadgets/PELA-parametric-blocks/blob/master/sign/PELA-technic-sign.stl) A sign you can use to name and label your model.


## Downloading

If you prefer to avoid git, you can download the files instead.

1. Download and unzip **[PELA Drift Car](https://github.com/LEGO-Prototypes/PELA-drift-car/archive/master.zip)**
1. Download and unzip **[PELA Blocks](https://github.com/LEGO-Prototypes/PELA-blocks/archive/master.zip)** as a subdirectory inside the above (`PELA-robot-hand/PELA-blocks`)
1. **Calibrate** the models to your printer/filament/slicer/preferences (see below)

## Git Clone

1. `git clone git@github.com:LEGO-compatible-gadgets/PELA-drift-car.git --recurse-submodules`
1. **Calibrate** the models to your printer/filament/slicer/preferences (see below)
1. Before `git submodule update --remote` to get PELA Blocks project changes, you may want to [backup your print calibration files](http://pelablocks.org/#calibration-file-backup)

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

## Open source design, Powered By Futurice

[![Futurice](images/futurice-logo.jpg)](https://futurice.com)

These open source designs are brought to you by [Futurice](http://futurice.com) and contributions from the community. Come work with the best.

The software needed is free and open source, [OpenSCAD](http://www.openscad.org/). You can probably learn it in less than an hour.

## Contact

Collaboration and pull requests are welcome: [Git Project](https://github.com/LEGO-Prototypes/PELA-drift-car)

paul.houghton@futurice.com ( **[Blog](https://medium.com/@paulhoughton)** - **[Twitter](https://twitter.com/mobile_rat)** )

If you like it, please tweet about us! [<img src="images/share-twitter-button.jpg">](https://twitter.com/intent/tweet?screen_name=mobile_rat&hashtags=PELAblocks&related=mobile_rat&text=3D%20printed%20LEGO%20drift%20car%20shell&tw_p=tweetbutton&url=http%3A%2F%2Fdriftcar.pelablocks.org)
