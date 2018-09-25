/*
PELA Drift Car Riser

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

/* [PELA Options] */
l = 2;
w = 2;
h = 4;

PELA_technic_block(l=l, w=w, h=h, top_vents=false, solid_bottom_layer=false, bolt_holes=false, side_holes=2, end_holes=2, knobs=true, sockets=true);
