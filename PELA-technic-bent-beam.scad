/*
PELA Technic Bent Beam - 3D Printed LEGO-compatible beam with an angle

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

include <PELA-parametric-blocks/style.scad>
include <PELA-parametric-blocks/material.scad>
use <PELA-parametric-blocks/technic-beam/PELA-technic-bent-beam.scad>


/* [Render] */

// Show the inside structure [mm]
_cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
_material = 1; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
_large_nozzle = true;


/* [Technic Corner] */

// Length of the first beam [blocks]
_l1 = 7; // [1:20]

// Length of the second beam [blocks]
_l2 = 7; // [1:20]

// Beam width [blocks]
_w = 1; // [1:1:30]

// Left beam height [blocks]
_h1 = 1; // [1:1:30]

// Right beam height [blocks]
_h2 = 1; // [1:1:30]

// Angle between the two beams
_angle = 30; // [0:180]


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

drift_car_bent_beam();

module drift_car_bent_beam() {
    bent_beam(material=_material, large_nozzle=_large_nozzle, cut_line=_cut_line, l1=_l1, l2=_l2, angle=_angle, w=_w, h1=_h1, h2=_h2, side_holes=_side_holes, horizontal_skin=_horizontal_skin, vertical_skin=_vertical_skin);
}
