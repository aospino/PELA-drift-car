/*
PELA Parametric Block with LEGO-compatible technic connectors and air vents

PELA Parametric Blocks - 3D Printed LEGO-compatible parametric blocks

Published at https://PELAblocks.org

By Paul Houghton
Twitter: @mobile_rat
Email: paulirotta@gmail.com
Blog: https://medium.com/@paulhoughton

Creative Commons Attribution-ShareAlike 4.0 International License
    https://creativecommons.org/licenses/by-sa/4.0/legalcode

Open source design, Powered By Futurice. Come work with the best.
    https://www.futurice.com/

Import this into other design files:
    include <style.scad>
    use <technic.scad>
    
All modules have sensible defaults derived from <style.scad>. 
You can ignore values you are not tampering with and only need to pass a
parameter if you are overriding.

All modules are setup for stateless functional-style reuse in other OpenSCAD files.
To this end, you can always pass in and override all parameters to create
a new effect. Doing this is not natural to OpenSCAD, so apologies for all
the boilerplate arguments which are passed in to each module or any errors
that may be hidden by the sensible default values. This is an evolving art.
*/

include <PELA-parametric-blocks/style.scad>
include <PELA-parametric-blocks/material.scad>
use <PELA-parametric-blocks/PELA-block.scad>
use <PELA-parametric-blocks/PELA-technic-block.scad>



/* [Technic Block] */

// Show the inside structure [mm]
cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
large_nozzle = true;

// Model length [blocks]
l = 6; // [1:1:20]

// Model width [blocks]
w = 2; // [1:1:20]

// Model height [blocks]
h = 5; // [1:1:20]


/* [Block Features] */

// Presence of bottom connector sockets
sockets = true;

// Presence of top connector knobs
knobs = true;

// How tall are top connectors [mm]
knob_height = 2.9; // [1.8:traditional blocks, 2.9:PELA 3D print tall]

// Basic unit vertical size of each block
block_height = 8; // [8:technic, 9.6:traditional blocks]

// Place holes in the corners for mountings screws (0=>no holes, 1=>holes)
corner_bolt_holes = false;

// Size of corner holes for M3 mountings bolts
bolt_hole_radius = 1.6; // [0.0:0.1:2.0]

// Add interior fill for upper layers
solid_upper_layers = true;

// Add interior fill for the base layer
solid_first_layer = false;


/* [Technic Features] */

// Add full width through holes spaced along the length for techic connectors
side_holes = 2; // [0:disabled, 1:short air vents, 2:full width connectors, 3:short connectors]

// Add a wrapper around side holes (disable for extra ventilation but loose lock notches)
side_sheaths = true;

// Add short end holes spaced along the width for techic connectors
end_holes = 2; // [0:disabled, 1:short air vents, 2:full width connectors, 3:short connectors]

// Add a wrapper around end holes (disable for extra ventilation but loose lock notches)
end_sheaths = true;

// Add holes in the top deck to improve airflow and reduce weight
top_vents = false;

// Size of a hole in the top of each knob. 0 to disable or use for air circulation/aesthetics/drain resin from the cutout, but larger holes change flexture such that knobs may not hold as well
knob_vent_radius = 0; // [0.0:0.1:3.9]



/////////////////////////////////////
// DISPLAY
/////////////////////////////////////

PELA_technic_block(material=material, large_nozzle=large_nozzle, cut_line=cut_line, l=l, w=w, h=h, knob_height=knob_height, knob_flexture_height=knob_flexture_height, sockets=sockets, knobs=knobs, knob_vent_radius=knob_vent_radius, skin=skin, top_shell=top_shell, bottom_stiffener_width=bottom_stiffener_width, bottom_stiffener_height=bottom_stiffener_height, corner_bolt_holes=corner_bolt_holes, bolt_hole_radius=bolt_hole_radius, ridge_width=ridge_width, ridge_depth=ridge_depth, ridge_z_offset=ridge_z_offset, solid_upper_layers=solid_upper_layers, top_vents=top_vents, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, solid_first_layer=solid_first_layer, block_height=block_height, bottom_tweak=undef, top_tweak=undef, axle_hole_tweak=undef);
