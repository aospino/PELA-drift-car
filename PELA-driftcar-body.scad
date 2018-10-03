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

////////////////////
// Parameters
////////////////////

wheel_diameter = 65; // top to bottom
wheel_base = 258; // hub to hub
front_wheel_y = 290; // From back of back wheel
back_wheel_y = wheel_diameter/2; // From back of back wheel
wheel_width = 190; // outside to outside
wheel_max_vertical_travel = 10; // shock fully compressed
ride_height = 10; // height of base from ground
base_width = 125; // bottom tray width
base_length = wheel_base + wheel_diameter;
exclusion_zone = 0.2; // Additional space around the car body to not bump into the car
z = 10;
base_height = 65;


////////////////////
// Main View
////////////////////

%body_exclusion_zone();
translate([-block_width(14), block_width(-3), z]) {
    front_bumper();
}

translate([block_width(13), block_width(9), z]) {
    side_bumper();
}

translate([block_width(-13+5), block_width(9), z]) {
    side_bumper();
}

translate([block_width(-13), block_width(9), z+block_height()]) {
    color("green") sensor_tower();
}

translate([block_width(12), block_width(9), z+block_height()]) {
    color("green") sensor_tower();
}

translate([block_width(3), block_width(9), z+block_height(16)]) {
    rotate([90-30, 0, 180]) {
        slot_mount_30degree();
    }
}

translate([block_width(-13), block_width(8), z+block_height(18)]) {
    color("white") sensor_bar();
}

translate([block_width(-12), block_width(9), z+block_height(18)]) {
    color("red") sensor_join();
}

translate([block_width(9), block_width(9), z+block_height(18)]) {
    color("red") sensor_join();
}

/*translate([block_width(6), block_width(9), z+block_height(10)]) {
    rotate([0, 90, 0]) {
        color("orange") vertical_holder();
    }
}*/


module body_exclusion_zone() {
    back_wheel_exclusion_zone();
    front_wheel_exclusion_zone();
    base_exclusion_zone();
}

// Added space around the car to prevent bumping into bits
module base_exclusion_zone() {
    minkowski() {
        union() {
            base();
        }

        sphere(r=exclusion_zone, $fn=16);
    }
}

module front_wheel_exclusion_zone() {
    minkowski() {
        front_wheels();

        sphere(r=exclusion_zone, $fn=16);
    }
}

module back_wheel_exclusion_zone() {
    minkowski() {
        back_wheels();

        sphere(r=exclusion_zone, $fn=16);
    }
}


module base() {
    translate([-base_width/2, 0, ride_height]) {
        cube([base_width, base_length, base_height]);
    }
}


module front_wheels() {
    translate([-wheel_width/2, front_wheel_y, wheel_diameter/2]) {
        rotate([0, 90, 0]) {
            cylinder(d=wheel_diameter, h=wheel_width);
        }
    }
}


module back_wheels() {
    translate([-wheel_width/2, back_wheel_y, wheel_diameter/2]) {
        rotate([0, 90, 0]) {
            cylinder(d=wheel_diameter, h=wheel_width);
        }
    }
}

module front_bumper() {
    length = 26;
    width = 2;

    PELA_technic_block(l=length, w=width, h=1, sockets=false, top_vents=false, side_holes=true, side_sheaths=true, end_holes=true, end_sheaths=true);
}


module side_bumper() {
    length = 22;
    width = 5;

    rotate([0, 0, 90]) {
        PELA_technic_block(l=length, w=width, h=1, sockets=false, top_vents=false, side_holes=true, side_sheaths=true, end_holes=true, end_sheaths=true);
    }
}


module sensor_tower() {
    PELA_technic_block(l=1, w=3, h=18, sockets=true, side_holes=true, side_sheaths=true, end_holes=true, end_sheaths=true);
}


module sensor_bar() {
    length = 26;
    width = 1;

    PELA_technic_block(l=length, w=width, h=1, sockets=false, knobs=false, side_holes=true, side_sheaths=true, end_holes=true, end_sheaths=true);
}


module sensor_join() {
    PELA_technic_block(l=3, w=3, h=1, sockets=true, knobs=true, side_holes=true, side_sheaths=true, end_holes=true, end_sheaths=true);
}


module vertical_holder() {
    base_thickness = panel_height();
    array_spacing = block_height();
    minimum_base = true;
    pin_tip_length = 0.7;

    vertical_pin_array(array_size=2, array_spacing=array_spacing, base_thickness=base_thickness, minimum_base=minimum_base, pin_tip_length=pin_tip_length);
}