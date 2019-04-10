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
use <PELA-drift-car-center-beam.scad>
use <PELA-drift-car-tt02-end-connector.scad>
use <PELA-panel-sign.scad>
use <PELA-pca9685-servo-board-technic-mount.scad>
use <PELA-raspberry-pi3-camera-technic-mount.scad>
use <PELA-raspberry-pi3-technic-mount.scad>
use <PELA-technic-bent-beam.scad>
use <PELA-parametric-blocks/pin/PELA-technic-pin.scad>


///////////////////////////////
// DISPLAY
///////////////////////////////
bw = block_width();
bh = block_height();

drift_car_center_beam();

translate([-0.5*bw, -bw, 7*bh])
    rotate([-90, 90, 0]) 
        drift_car_bent_beam();

translate([-0.5*bw, 5*bw, 7*bh])
    rotate([-90, 90, 0]) 
        drift_car_bent_beam();

translate([-2.5*bw, 7*bw, 0])
    rotate([0, 0, -90]) 
        drift_car_tt02_end_connector();

translate([30.5*bw, -4*bw, 0])
    rotate([0, 0, 90]) 
        drift_car_tt02_end_connector();

translate([-.755*bw, -bw, 7.438*bh])
    rotate([0, -120, 0]) {
        drift_car_camera_mount(render_modules=0);

        translate([0, 8*bw, bh])
            drift_car_camera_mount(render_modules=1);
    }

translate([-2.5*bw, 4*bw, 2*bh])
    rotate([0, 0, -90]) 
        drift_car_panel_sign();

translate([2.5*bw, -3*bw, 1*bh])
    rotate([0, 0, 0])
        union() {
            drift_car_pi_mount(render_modules=0);
            
            translate([0, 20*bw, 3*bh]) 
                rotate([180, 0, 0]) 
                    drift_car_pi_mount(render_modules=2);
            
            translate([0, -2*bw, 4*bh]) 
                rotate([180, 0, 0]) 
                    drift_car_pi_mount(render_modules=1);
        }
    
translate([22.5*bw, -3*bw, bh])
    rotate([0, 0, 90])
        union () {
            drift_car_9685_mount_and_cover(render_modules=0);
            
            translate([0, -2*bw, 3*bh])
                rotate([180, 0, 0])
                    drift_car_9685_mount_and_cover(render_modules=1);
        }

translate([32*bw, -3.3*bw, 0.5*bh])
    rotate([0, 90, 0])
        pin();


translate([32*bw, 5.3*bw, 0.5*bh])
    rotate([0, 90, 0])
        pin();
