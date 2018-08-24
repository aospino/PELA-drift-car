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
base_height = 40; // including most hardware on the base, measured from ride height upward
base_length = wheel_base + wheel_diameter;
center_bar_width = 20; // upper lengthwise bar for strength and mounting
center_bar_height = 42; // from bottom of base (from ride height)
exclusion_zone = 2; // Additional space around the car body to not bump into the car

body_style = 0; //0=porsche, 1=Ford GT

////////////////////
// Main View
////////////////////

#body_style();
drop_body_exclusion_zone();


module body_style() {
    if (body_style == 1) {
        ford_gt_body_style();
    } else if (body_style == 0) {
        porsche_911_body_style();
    } else {
        echo("Unknown body style: ", body_style);
    }
}

module ford_gt_body_style() {
    s = 3;
    scale([s, s, s]) {
        import("car-models/Ford-GT-2017/files/complete.stl", convexity=6);
    }
}

module porsche_911_body_style() {
    s = 3.2;
    ls = 1.035;
    translate([0, -50, 18]) {
        scale([s, s*ls, s]) {
            import("car-models/Porsche-911-Race-Car/files/body.stl", convexity=6);
        }
    }
}


module drop_body_exclusion_zone() {
    down = 1000;

    intersection() {
        union() {
            hull() {
                base_exclusion_zone();

                translate([0, 0, -down]) {
                    base_exclusion_zone();
                }
            }

            hull() {
                center_bar_exclusion_zone();

                translate([0, 0, -down]) {
                    center_bar_exclusion_zone();
                }
            }

            translate([0, 0, wheel_max_vertical_travel]) {
                hull() {
                    front_wheel_exlusion_zone();

                    translate([0, 0, -down]) {
                        front_wheel_exlusion_zone();
                    }
                }

                hull() {
                    back_wheel_exlusion_zone();

                    translate([0, 0, -down]) {
                        back_wheel_exlusion_zone();
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

module center_bar_exclusion_zone() {
    minkowski() {
        union() {
            center_bar();
        }

        sphere(r=exclusion_zone, $fn=16);
    }
}

module front_wheel_exlusion_zone() {
    minkowski() {
        union() {
            front_wheels();
        }

        sphere(r=exclusion_zone, $fn=16);
    }
}

module back_wheel_exlusion_zone() {
    minkowski() {
        union() {
            back_wheels();
        }

        sphere(r=exclusion_zone, $fn=16);
    }
}

module body() {
    base();
    center_bar();
}

module base() {
    translate([-base_width/2, 0, ride_height]) {
        cube([base_width, base_length, base_height]);
    }
}

module center_bar() {
    translate([-center_bar_width/2, 0, ride_height]) {
        cube([center_bar_width, base_length, center_bar_height]);
    }    
}

module wheels() {
    front_wheels();
    back_wheels();
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
