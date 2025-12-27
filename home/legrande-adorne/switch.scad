
include<common.scad>


thick = 2;
eps = 0.001;
tol = 0.3;

gang_spacing = 1.81 * 25.4;

width = 7.06 * 25.4;
height = 5.13 * 25.4;
depth = 0.35 * 25.4;

hole_width=35.3+thick;
hole_height=91.9+thick;
hole_r=4;


difference() {
cube_center([width+2*thick,height+2*thick,depth+thick],r=4, $fn=32);

translate([0,0,2])
cube_center([width+tol,height+tol,depth+eps],r=2);


for(i=[-1,0,1])
translate([i*gang_spacing,0,0])
cube_center([hole_width,hole_height,thick*2],r=hole_r);

}