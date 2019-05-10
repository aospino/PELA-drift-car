/*
PELA Technic Board Mount - 3D Printed LEGO-compatible PCB mount used for including printed ciruit boards in technic models

This is a library module used by other models

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
use <PELA-parametric-blocks/PELA-block.scad>
use <PELA-parametric-blocks/PELA-technic-block.scad>
use <PELA-parametric-blocks/technic-mount/PELA-technic-mount.scad>
use <PELA-drift-car-tt02-end-connector.scad>


/* [Render] */

// Show the inside structure [mm]
cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
large_nozzle = true;

// Select parts to render
render_half = 0; // [0:both, 1:left half, 2:right half]


/* [Board] */

// Board space length [mm]
length = 224; // [0:0.1:300]

// Board space width [mm]
width = 28; // [0:0.1:300]

// Board space height [mm]
thickness = 0; // [0:0.1:300]

// Include the TT-02 ends to the model for combined print
include_ends = true;


/* [Enclosure] */

// Distance from length ends of connector twist [blocks]
twist_l = 3; // [1:18]

// Distance from width ends of connector twist [blocks]
twist_w = 1; // [1:18]

// Closeness of board fit lengthwise [blocks]
l_pad = 0; // [0:tight, 1:+1 block, 2:+2 blocks]

// Closeness of board fit widthwise [blocks]
w_pad = 0; // [0:tight, 1:+1 block, 2:+2 blocks]

// Height of the enclosure [blocks]
h = 1; // [1:1:20]

// Interior fill style
center = 4; // [0:empty, 1:solid, 2:edge cheese holes, 3:top cheese holes, 4:all cheese holes, 5:socket panel, 6:knob panel]

// Step in from board space edges to support the board [mm]
innercut = 0.0; // [0:0.1:100]

// Step down from board bottom to give room board components [mm]
undercut = 0.0; // [0:0.1:100]

// Presence of sockets if center is "socket panel"
center_sockets = true;

// Presence of knobs if center is "knob panel"
center_knobs = true;

// Size of hole in the center of knobs if "center" or "cover center" is "knob panel"
knob_vent_radius = 0.0; // [0.0:0.1:3.9]

// Text label
text = "Markku.ai";

// Depth of text etching into top surface
text_depth = 0.5; // [0.0:0.1:2]



/* [Left Cut] */

// Distance of the front of left side hole [mm]
left_cutout_y = 4; // [0:0.1:200]

// Width of the left side hole [mm]
left_cutout_width = 0; // [0:0.1:200]

// Depth of the left side hole [mm]
left_cutout_depth = 24; // [0:0.1:200]

// Distance from bottom of the left side hole [mm]
left_cutout_z = 4; // [0:0.1:200]

// Height of the left side hole [mm]
left_cutout_height = 8; // [0:0.1:200]



/* [Right Cut] */

// Distance of the front of right side hole [mm]
right_cutout_y = 4; // [0:0.1:200]

// Width of the right side hole [mm]
right_cutout_width = 0; // [0:0.1:200]

// Depth of the right side hole [mm]
right_cutout_depth = 24; // [0:0.1:200]

// Distance from bottom of the right side hole [mm]
right_cutout_z = 4; // [0:0.1:200]

// Height of the right side hole [mm]
right_cutout_height = 8; // [0:0.1:200]



/* [Front Cut] */

// Distance of the left of front side hole [mm]
front_cutout_x = 4; // [0:0.1:200]

// Width of the front side hole [mm]
front_cutout_width = 0; // [0:0.1:200]

// Depth of the depth side hole [mm]
front_cutout_depth = 24; // [0:0.1:200]

// Distance from bottom of the front side hole [mm]
front_cutout_z = 4; // [0:0.1:200]

// Height of the front side hole [mm]
front_cutout_height = 8; // [0:0.1:200]



/* [Back Cut] */

// Distance of the left of back side hole [mm]
back_cutout_x = 4; // [0:0.1:200]

// Width of the back side hole [mm]
back_cutout_width = 0; // [0:0.1:200]

// Depth of the back side hole [mm]
back_cutout_depth = 24; // [0:0.1:200]

// Distance from bottom of the back side hole [mm]
back_cutout_z = 4; // [0:0.1:200]

// Height of the back side hole [mm]
back_cutout_height = 8; // [0:0.1:200]



/* [Cover] */

// Text label
cover_text = "Markku.ai";

// Interior fill style
cover_center = 5; // [0:empty, 1:solid, 2:edge cheese holes, 3:top cheese holes, 4:all cheese holes, 5:socket panel, 6:knob panel]

// Height of the cover [blocks]
cover_h = 1; // [1:1:20]

// Presence of sockets if "cover center" is "socket panel"
cover_sockets = true;

// Presence of knobs if "cover center" is "knob panel"
cover_knobs = true;




/* [Hidden] */

// Select parts to render
render_modules = 0; // [0:technic mount, 1:technic cover, 2:technic mount and cover]

// Basic unit vertical size of each block
block_height = 8; // This is not adjuestable due to twist beam technic hole rotation



///////////////////////////////
// DISPLAY
///////////////////////////////

drift_car_center_beam();

module drift_car_center_beam() {
    l = fit_mm_to_blocks(length, l_pad);
    w = fit_mm_to_blocks(width, w_pad);

    if (render_half == 0) {
        full_mount();
    } else if (render_half == 1) {
        intersection() {
            full_mount();
        
            translate([block_width(-0.5), block_width(-0.5), 0]) {
                skinned_block(material=material, large_nozzle=large_nozzle, l=l/2, w=w, h=h, ridge_width=ridge_width, ridge_depth=ridge_depth, block_height=block_height, skin=skin);
            }
        }
    } else if (render_half == 2) {
        intersection() {
            full_mount();
        
            translate([block_width(l/2-0.5), block_width(-0.5), 0]) {
                skinned_block(material=material, large_nozzle=large_nozzle, l=l/2, w=w, h=h, ridge_width=ridge_width, ridge_depth=ridge_depth, block_height=block_height, skin=skin);
            }
        }
    }
}

module full_mount() {
    length_with_ends = length + (include_ends ? block_width(2):0);
    
    technic_mount_and_cover(render_modules=render_modules, material=material, large_nozzle=large_nozzle, cut_line=cut_line, length=length_with_ends, width=width, thickness=thickness, h=h, cover_h=cover_h, l_pad=l_pad, w_pad=w_pad, twist_l=twist_l, twist_w=twist_w, center_sockets=center_sockets, center_knobs=center_knobs, cover_sockets=cover_sockets, cover_knobs=cover_knobs, knob_vent_radius=knob_vent_radius, solid_first_layer=solid_first_layer, innercut=innercut, undercut=undercut, center=center, cover_center=cover_center, text=text, cover_text=cover_text, text_depth=text_depth, left_cutout_y=left_cutout_y, left_cutout_width=left_cutout_width, left_cutout_depth=left_cutout_depth, left_cutout_z=left_cutout_z, left_cutout_height=left_cutout_height, right_cutout_y=right_cutout_y, right_cutout_width=right_cutout_width, right_cutout_depth=right_cutout_depth, right_cutout_z=right_cutout_z, right_cutout_height=right_cutout_height, front_cutout_x=front_cutout_x, front_cutout_width=front_cutout_width, front_cutout_depth=front_cutout_depth, front_cutout_z=front_cutout_z, front_cutout_height=front_cutout_height, back_cutout_x=back_cutout_x, back_cutout_width=back_cutout_width, back_cutout_depth=back_cutout_depth, back_cutout_z=back_cutout_z, back_cutout_height=back_cutout_height, dome=false);
    
    if (include_ends) {
        translate([block_width(-1.5), block_width(7), 0]) {
            rotate([0, 0, -90]) {
                drift_car_tt02_end_connector();
            }
        }

        translate([block_width(31.5), block_width(-3), 0]) {
            rotate([0, 0, 90]) {
                drift_car_tt02_end_connector();
            }
        }
    }
}
