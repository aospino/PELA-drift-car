/*
PELA Parametric Socket Panel Generator

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
    use <PELA-block.scad>
*/

include <PELA-parametric-blocks/style.scad>
include <PELA-parametric-blocks/material.scad>
use <PELA-parametric-blocks/PELA-socket-panel.scad>



/* [Socket Panel] */

// Show the inside structure [mm]
cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
large_nozzle = true;

// Length of the block [blocks]
l = 10; // [1:1:20]

// Width of the block [blocks]
w = 2; // [1:1:20]

// Presence of sockets vs a plain panel
sockets = true;

// Add interior fill for the base layer
solid_first_layer = false;

// Basic unit vertical size of each block
block_height = 8; // [8:technic, 9.6:traditional blocks]


/* [Body Pins] */

// Space between the two front pin centers
pin_separation = 66.0; // [0:0.1:200]

// Thickness of the pin
pin_diameter = 5.9; // [0:0.1:20]

// Length of the pins
front_pin_height = 30.0; // [0:0.1:200]

// Length of the pins
back_pin_height = 50.0; // [0:0.1:200]

// Size of cotter pin holes in each pin
pin_hole_diameter = 2.0; // [0:0.1:20]

// Distance between cotter pin holes in each pin
pin_hole_spacing = 4.5; // [0:0.1:20]


///////////////////////////////
// DISPLAY
///////////////////////////////

front_body_mount();

translate([0, -block_width(w + 1), 0]) {
    back_body_mount();
}


module front_body_mount() {
    socket_panel(material=material, large_nozzle=large_nozzle, cut_line=cut_line, l=l, w=w, sockets=sockets, solid_first_layer=solid_first_layer, skin=skin, block_height=block_height);
    
    body_pin_set(pin_height=front_pin_height);
}

module back_body_mount() {
    socket_panel(material=material, large_nozzle=large_nozzle, cut_line=cut_line, l=l, w=w, sockets=sockets, solid_first_layer=solid_first_layer, skin=skin, block_height=block_height);
    
    body_pin_set(pin_height=back_pin_height);
}


module body_pin_set(pin_height = undef) {    
    translate([(block_width(l)-pin_separation)/2, 0, 0]) {
        body_pin(pin_height = pin_height);
    }
    
    translate([(block_width(l)+pin_separation)/2, 0, 0]) {
        body_pin(pin_height = pin_height);
    }
}

module body_pin(pin_height=undef) {
    assert(pin_height != undef);
    
    translate([0, block_width(w/2), knob_height+2*skin]) {
        difference() {
            union() {
                cylinder(d=pin_diameter, h=pin_height);
                translate([0, 0, pin_height]) {
                    sphere(d=pin_diameter);
                }
                cylinder(d=1.5*pin_diameter, h=panel_height()/3);
            }

            for (i=[pin_hole_spacing:pin_hole_spacing:pin_height]) {
                translate([0, -pin_diameter, i]) {
                    rotate([-90, 0, 0]) {
                        cylinder(d=pin_hole_diameter, h=2*pin_diameter);
                    }
                }
            }
        }
    }
}