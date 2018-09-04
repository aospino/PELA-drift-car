/*
PELA Board Holder - 3D Printed LEGO-compatible PCB mount

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

////////////////////
// Parameters
////////////////////

length = 38 + 4;  //TEST
width = 38;
thickness = 1.4;
hold_d = 2.4;
bottom_type = 0;
top_vents = false;
side_holes = 2;
end_holes = 2;
side_sheaths = true;
end_sheaths = true;
left_wall_enabled = true;
right_wall_enabled = true;
front_wall_enabled = true;
back_wall_enabled = true;
drop_bottom = false;

///////////
// Display
///////////
#pcb_space();
pcb_holder();


// Find the dimensions of the optimum holder based on board length or width
function fit_mm_to_pela_blocks(i) = ceil((i+block_width)/block_width);


module pcb_space() {
    l = fit_mm_to_pela_blocks(length);
    w = fit_mm_to_pela_blocks(width);
    x_inset = (block_width(l) - length)/2;
    y_inset = (block_width(w) - width)/2;
    translate([x_inset, y_inset, block_height()+1]) {
        cube([length, width, thickness]);
    }
}


module pcb_holder() {
    l = fit_mm_to_pela_blocks(length);
    w = fit_mm_to_pela_blocks(width);
    h = 1;
    left_wall_knobs = false;
    right_wall_knobs = left_wall_knobs;
    front_wall_knobs = false;
    back_wall_knobs = front_wall_knobs;

    PELA_box_enclosure(l=l, w=w, h=h, bottom_type=bottom_type, panel_height=panel_height, top_vents=top_vents, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, skin=skin, left_wall_enabled=left_wall_enabled, right_wall_enabled=right_wall_enabled, front_wall_enabled=front_wall_enabled, back_wall_enabled=back_wall_enabled, left_wall_knobs=left_wall_knobs, right_wall_knobs=right_wall_knobs, front_wall_knobs=front_wall_knobs, back_wall_knobs=back_wall_knobs, drop_bottom=drop_bottom, solid_upper_layers=solid_upper_layers, shell=shell);
}