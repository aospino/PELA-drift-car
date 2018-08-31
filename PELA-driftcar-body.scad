/*
PELA Robot Hand

PELA Drift Car Body - 3D Printed LEGO-compatible 1:10 scale road car shell

Published at http://driftcar.PELAblocks.org

By Paul Houghton
Twitter: @mobile_rat
Email: paulirotta@gmail.com
Blog: https://medium.com/@paulhoughton

Creative Commons Attribution ShareAlike NonCommercial License
    https://creativecommons.org/licenses/by-sa/4.0/legalcode

Design work kindly sponsored by
    http://futurice.com

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
use <PELA-parametric-blocks/support/support.scad>

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

body_style = 0; //0=Porsche, 1=Ford GT

base_heights = [65, 55];
function base_height() = (base_heights[body_style]);

////////////////////
// Main View
////////////////////


ghost_view = true; // Set false for printing

if (ghost_view) {
//    #body_style();
    difference() {
        front_box();
        drop_body_exclusion_zone();
    }
} else {
    // Print view
//            body_style_cleaned();
     drop_body_exclusion_zone();
}


module body_style() {
    if (body_style == 1) {
        ford_gt_body_style();
    } else if (body_style == 0) {
        porsche_911_body_style();
    } else {
        echo("Unknown body style: ", body_style);
    }
}


module body_style_cleaned() {
    if (body_style == 1) {
        ford_gt_cleaned();
    } else if (body_style == 0) {
        translate([0, 0, 16])
        porsche_911_cleaned();
    } else {
        echo("Unknown body style: ", body_style);
    }
}


module ford_gt_body_style() {
    s = 26.03;
    sw = 1.05;
    translate([0, 158, 19]) {
        scale([s*sw, s, s]) {
            import("car-models/Ford-GT-2017/files/body.stl", convexity=20);
        }
    }
}

module ford_gt_cleaned() {
    import("car-models/Ford-GT-driftcar-body-meshlab.stl", convexity=20);
}

module porsche_911_body_style() {
    s = 3.3;
    translate([0, -50, 25]) {
        scale([s, s, s]) {
            import("car-models/Porsche-911-Race-Car/files/body.stl", convexity=20);
        }
    }
}

module porsche_911_cleaned() {
    import("car-models/Porsche-driftcar-body-meshlab.stl", convexity=20);
}

module drop_body_exclusion_zone() {
    down = 300;

    intersection() {
        union() {
            hull() {
                base_exclusion_zone();

                translate([0, 0, -down]) {
                    base_exclusion_zone();
                }
            }

            translate([0, 0, wheel_max_vertical_travel]) {
                hull() {
                    front_wheel_exclusion_zone();

                    translate([0, 0, -down]) {
                        front_wheel_exclusion_zone();
                    }
                }

                hull() {
                    back_wheel_exclusion_zone();

                    translate([0, 0, -down]) {
                        back_wheel_exclusion_zone();
                    }
                }
            }
        }

        translate([-down/2, -exclusion_zone, 0]) {
            cube([down, down, down]);
        }
    }
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

module body() {
    base();
    center_bar();
}

module base() {
    translate([-base_width/2, 0, ride_height]) {
        cube([base_width, base_length, base_height()]);
    }
}

module center_bar() {
    translate([-center_bar_width/2, 0, ride_height]) {
        cube([center_bar_width, base_length, center_bar_height]);
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

// A PELA box enclusure for the front of the car. The rest of the car above can be build up using LEGO or some parts printed printed separately and snapped on
module front_box() {
    l=22; //blocks
    w=21; //blocks
    h=5; //blocks
    z=38; //mm
    y=70; //mm

    translate([block_width(-w/2), y, z]) {
        PELA_box_enclosure(l=w, w=l, h=h, bottom_type=1, top_vents=false, side_holes=true, side_sheaths=true, end_holes=true, end_sheaths=true, left_wall_enabled=true, right_wall_enabled=true, front_wall_enabled=true, back_wall_enabled=true, drop_bottom=false, solid_upper_layers=false);
    }
}