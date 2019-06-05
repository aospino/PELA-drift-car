/*
PELA Parametric Flat Sign Generator

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
    use <PELA-flat-sign.scad>
    use <../PELA-block.scad>
    use <../PELA-technic-block.scad>
*/

include <PELA-parametric-blocks/style.scad>
include <PELA-parametric-blocks/material.scad>
use <PELA-parametric-blocks/PELA-block.scad>
use <PELA-parametric-blocks/PELA-technic-block.scad>
use <PELA-parametric-blocks/PELA-knob-panel.scad>
use <PELA-parametric-blocks/technic-beam/PELA-technic-beam.scad>
use <PELA-parametric-blocks/technic-beam/PELA-technic-twist-beam.scad>
use <PELA-parametric-blocks/technic-mount/PELA-technic-box.scad>
use <PELA-parametric-blocks/sign/PELA-panel-sign.scad>


/* [Render] */

// Show the inside structure [mm]
_cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
_material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
_large_nozzle = true;



/* [Panel Sign] */

// Length of the sign (block count)
_l = 4;  // [1:1:20]

// Width of the sign (block count)
_w = 4; // [1:1:20]

// Width of the sign (block count)
_h = 1; // [1:1:20]

// Distance from length ends of connector twist [blocks]
_twist_l = 1; // [1:18]

// Distance from width ends of connector twist [blocks]
_twist_w = 2; // [1:18]

// Interior fill style
_center = 2; // [0:empty, 1:solid, 2:edge cheese holes, 3:top cheese holes, 4:all cheese holes, 5:socket panel, 6:knob panel, 7:flat planel]

// The first line of text
_edge_text = "Hki";

// The first line of text
_line_1 = "Jee!";

// The second line of text
_line_2 = "001";
 
// Depth of text etching into top surface
_text_depth = 1; // [0.0:0.1:2]

// Presence of top connector knobs
_knobs = false;

// Height of traditional connectors [mm] (taller gives a stronger hold)
_knob_height = 2.9; // [0:disabled, 1.8:traditional, 2.9:PELA 3D print tall]

// Size of a hole in the top of each knob. Set 0 to disable for best flexture or enable for air circulation/aesthetics/drain resin
_knob_vent_radius = 0.0; // [0.0:0.1:4]

// Language of the text
_lang = "en";

// The font to use for text on the top line
_f1 = "Liberation Sans:style=Bold Italic";

// The font to use for text on the bottom line
_f2 = "Arial:style=Bold";

// The font size (points) of the top line
_fs1 = 4.8;

// The font size (points) of the bottom line
_fs2 = 5;

// Left text margin (mm)
_left_margin = 1.8;

// Top and bottom text margin (mm)
_vertical_margin = 0.3;

// Place holes in the corners for mountings screws (0=>no holes, 1=>holes)
_corner_bolt_holes = false;

// Presence of bottom connector sockets
_sockets = true;

// Add interior fill for the base layer
_solid_first_layer = false;

// Horizontal clearance space removed from the outer horizontal surface to allow two parts to be placed next to one another on a 8mm grid [mm]
_horizontal_skin = 0.1; // [0:0.02:0.5]

// Vertical clearance space between two parts to be placed next to one another on a 8mm grid [mm]
_vertical_skin = 0.1; // [0:0.02:0.5]



/* [Hidden] */

// Add holes in the top deck to improve airflow and reduce weight
_top_vents = false;




///////////////////////////////
// DISPLAY
///////////////////////////////

// Enable these one at a time if a dual-color print

PELA_technic_sign(material=_material, large_nozzle=_large_nozzle, cut_line=_cut_line, l=_l, w=_w, h=_h, twist_l=_twist_l, twist_w=_twist_w, center=_center, edge_text=_edge_text, line_1=_line_1, line_2=_line_2, lang=_lang, text_depth=_text_depth, f1=_f1, f2=_f2, fs1=_fs1, fs2=_fs2, left_margin=_left_margin, vertical_margin=_vertical_margin, top_vents=_top_vents, corner_bolt_holes=_corner_bolt_holes, sockets=_sockets, knobs=_knobs, knob_height=_knob_height, knob_vent_radius=_knob_vent_radius, block_height=_block_height, solid_first_layer=_solid_first_layer, horizontal_skin=_horizontal_skin, vertical_skin=_vertical_skin);
