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
use <PELA-parametric-blocks/PELA-block.scad>
use <PELA-parametric-blocks/PELA-technic-block.scad>
use <PELA-parametric-blocks/technic-beam/PELA-technic-beam.scad>
use <PELA-parametric-blocks/technic-beam/PELA-technic-twist-beam.scad>


/* [Render] */

// Show the inside structure [mm]
_cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
_material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]
// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
_large_nozzle = true;


/* [Technic Twist Beam] */

// Beam width [blocks]
_w = 1; // [1:1:30]

// Left side length of upward facing connectors [blocks]
_left = 1; // [1:20]

// Center length of sideways facing connectors [blocks]
_center = 2; // [0:20]

// Right side length of upward facing connectors [blocks]
_right = 1; // [1:20]

// Beam height [blocks]
_h = 3; // [1:1:30]


/* [Advanced] */

// Add full width through holes spaced along the length for techic connectors
_side_holes = 2; // [0:disabled, 1:short air vents, 2:full width connectors, 3:short connectors]

// Horizontal clearance space removed from the outer horizontal surface to allow two parts to be placed next to one another on a 8mm grid [mm]
_horizontal_skin = 0.1; // [0:0.02:0.5]

// Vertical clearance space between two parts to be placed next to one another on a 8mm grid [mm]
_vertical_skin = 0.1; // [0:0.02:0.5]



///////////////////////////////
// DISPLAY
///////////////////////////////

technic_twist_beam(material=_material, large_nozzle=_large_nozzle, cut_line=_cut_line, w_left=_w, w_center=_w, w_right=_w, l_left=_left, l_center=_center, l_right=_right, h_left=_h, h_center=_h, h_right=_h, side_holes=_side_holes, horizontal_skin=_horizontal_skin, vertical_skin=_vertical_skin);
