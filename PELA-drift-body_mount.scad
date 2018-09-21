/*
PELA Drift Car Body Mount Points


Print with flexible material to provide some shock-absorption to the supported components

Published at http://driftcar.PELAblocks.org

By Paul Houghton
Twitter: @mobile_rat
Email: paulirotta@gmail.com
Blog: https://medium.com/@paulhoughton

Creative Commons Attribution-ShareAlike 4.0 International License
    https://creativecommons.org/licenses/by-sa/4.0/legalcode

Open source design, Powered By Futurice. Come work with the best.
    http://futurice.com

Import this into other design files:
    use <PELA-block.scad>
*/

include <PELA-parametric-blocks/PELA-parameters.scad>
include <PELA-parametric-blocks/PELA-print-parameters.scad>
use <PELA-parametric-blocks/PELA-block.scad>
use <PELA-parametric-blocks/PELA-technic-block.scad>

/* [PELA Panel Options] */
l = 5;
w = 2;
h = 1;
sockets = true;
bolt_holes = true;
end_holes = 3;
end_sheaths = true;
side_holes = 2;
side_sheaths = true;
knobs = false;

// Render
corner_supports();


module corner_supports() {
    side_supports();
    
    translate([block_width(20), 0, 0]) {
        side_supports();
    }
}

module side_supports() {
    support();
    translate([0, block_width(20), 0]) {
        support();
    }    
}

module support() {
    PELA_technic_block(l=l, w=w, h=h, top_vents=false, solid_bottom_layer=false, bolt_holes=bolt_holes, side_holes=side_holes, end_holes=end_holes, knobs=knobs, sockets=sockets);
}