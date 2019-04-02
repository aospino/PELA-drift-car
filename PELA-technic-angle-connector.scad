/*
PELA technic angle - 3D Printed LEGO-compatible 30 degree bend

Published at https://PELAblocks.org

By Paul Houghton
Twitter: @mobile_rat
Email: paulirotta@gmail.com
Blog: https://medium.com/@paulhoughton

Creative Commons Attribution ShareAlike NonCommercial License
    https://creativecommons.org/licenses/by-sa/4.0/legalcode

Design work kindly sponsored by
    https://www.futurice.com

All modules are setup for stateless functional-style reuse in other OpenSCAD files.
To this end, you can always pass in and override all parameters to create
a new effect. Doing this is not natural to OpenSCAD, so apologies for all
the boilerplate arguments which are passed in to each module or any errors
that may be hidden by the sensible default values. This is an evolving art.
*/

include <PELA-parametric-blocks/material.scad>
include <PELA-parametric-blocks/style.scad>
use <PELA-parametric-blocks/technic-beam/PELA-technic-angle-connector.scad>



/* [Technic Angle Connector] */

// Show the inside structure [mm]
cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
large_nozzle = true;

// Angle between the top and bottom parts of the connector [degrees]
angle = 60; // [0:180]

// Length of the connector [blocks]
l = 3; // [1:1:20]



///////////////////////////////
// DISPLAY
///////////////////////////////

technic_angle_connector(material=material, large_nozzle=large_nozzle, cut_line=cut_line,angle=angle, l=l);
