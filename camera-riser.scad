/*
PELA Drift Car Body - 3D Printed LEGO-compatible 1:10 scale road car shell

Published at https://driftcar.PELAblocks.org

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

include <PELA-parametric-blocks/PELA-print-parameters.scad>
include <PELA-parametric-blocks/PELA-parameters.scad>
use <PELA-parametric-blocks/PELA-block.scad>
use <PELA-parametric-blocks/PELA-technic-block.scad>
use <PELA-parametric-blocks/box-enclosure/PELA-box-enclosure.scad>
use <PELA-parametric-blocks/slot-mount/PELA-slot-mount-30degree.scad>
use <PELA-parametric-blocks/pin/PELA-technic-vertical-pin-array.scad>


hole_diameter = 4;
hole_spacing = 54.7;
base_end_diameter = 8;
base_thickness = block_height(1);
vertical_riser_length = block_width(5);
riser_height = 10;

camera_riser();


module camera_riser() {
    camera_mount();
    vertical_riser();

    translate([0, block_width(4), block_height(riser_height + 3)]) {
        top_riser();
    }

    riser_bridge();
}


module camera_mount() {
    difference() {
        hull() {
            translate([0, -block_width(1/2), 0]) {
                cylinder(d=base_end_diameter, h=base_thickness);
            }

            translate([block_width(0.5), -block_width(), 0]) {
                cube([0.01, block_width(1.7), block_height()]);
            }
        }

        union() {
            translate([0, -block_width(1/2), 0]) {
                cylinder(d=hole_diameter, h=base_thickness + 0.01);
            }

            translate([-block_width(), block_width(1), 0]) {
                cube([block_width(5), block_width(2), block_height()]);
            }
        }
    }
}


module vertical_riser() {
    translate([block_width(0.5), -block_width(), 0]) {
        PELA_technic_block(l=5, w=2, h=riser_height, sockets=true, solid_bottom_layer=false, solid_upper_layers=true, knobs=false, side_holes=2, end_holes=3);
    }
}


module top_riser() {
    translate([block_width(0.5), -block_width(), 0]) {
        PELA_technic_block(l=5, w=2, h=4, sockets=false, solid_bottom_layer=true, solid_upper_layers=false, knobs=true, side_holes=2, end_holes=3);
    }
}


module riser_bridge() {
    translate([block_width(0.5), -block_width(), block_height(riser_height-1)]) {
        difference() {
            hull() {
                cube([block_width(5), block_width(2), block_height()]);

                translate([0, block_width(4), block_height(4)]) {
                    cube([block_width(5), block_width(2), block_height()]);                                
                }
            }

            union() {
                cube([block_width(5), block_width(2), block_height()]);
                translate([0, block_width(4), block_height(4)]) {
                    cube([block_width(5), block_width(2), block_height()]);                                
                }
            }
        }
    }
}