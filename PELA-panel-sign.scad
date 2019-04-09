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
use <PELA-parametric-blocks/sign/PELA-panel-sign.scad>



/* [Panel Sign] */

// Show the inside structure [mm]
cut_line = 0; // [0:1:100]

// Printing material (set to select calibrated knob, socket and axle hole fit)
material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
large_nozzle = true;

// Length of the sign (PELA knob count)
l = 5;  // [1:1:20]

// Width of the sign (PELA knob count)
w = 1; // [1:1:20]

// The top line of text. Set to "" to not have any top line
line_1 = "";

// The second line of text
line_2 = "markku.ai";

// true=>text is pushing outward from the PELA block, false=>etch text into the block
extrude = true;

// Presence of top connector knobs
knobs = false;

// Language of the text
lang = "en";

// The font to use for text on the top line
f1 = "Liberation Sans:style=Bold Italic";

// The font to use for text on the bottom line
f2 = "Arial:style=Bold";

// The font size (points) of the top line
fs1 = 4.8;

// The font size (points) of the bottom line
fs2 = 5.5;

// How deeply into the PELA block to etch/extrude the text
extrusion_height = 0.5;

// Left text margin (mm)
left_margin = 1.8;

// Top and bottom text margin (mm)
vertical_margin = 1;

// Place holes in the corners for mountings screws (0=>no holes, 1=>holes)
corner_bolt_holes = false;

// Presence of bottom connector sockets
sockets = true;



/* [Hidden] */

// Add holes in the top deck to improve airflow and reduce weight
top_vents = false;




///////////////////////////////
// DISPLAY
///////////////////////////////

PELA_panel_sign(material=material, large_nozzle=large_nozzle, cut_line=cut_line, l=l, w=w, line_1=line_1, line_2=line_2, lang=lang, extrude=extrude,  extrusion_height=extrusion_height, f1=f1, f2=f2, fs1=fs1, fs2=fs2, left_margin=left_margin, vertical_margin=vertical_margin, top_vents=top_vents, corner_bolt_holes=corner_bolt_holes, sockets=sockets, knobs=knobs, block_height=block_height);
