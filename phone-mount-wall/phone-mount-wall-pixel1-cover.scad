screen_w = 62;
screen_h = 110.5;
phone_w = 69.64;
phone_h = 143.83;
phone_t = 7.5;

W = screen_w + 40;
H = screen_h + 40;
T = phone_t + 1.5 + 1.5 + 1+5+4;

difference() {
    cube_center([W,H,T],r=2,$fn=32);
    translate([0,0,1.5])
    cube_center([W-3,H-3,T],r=1);
    translate([0,0,-1])
    cube_center([screen_w, screen_h, 15],r=1);
    translate([0,-100,1.5])
    cube_center([14,200,9]);  
}

    for(s=[-1,0,1]) for(t=[-1,1])
    translate([t*(W/2-1.6),s*40,5+phone_t+1+1.5+sqrt(2)/2+.05])
    rotate([90,0,0])
    cylinder(d=1.4142,h=9.5,$fn=4, center=true);


/*
for(s=[-1,1])
translate([s*43,70,0])
rotate([0,0,90])
    hanger();
*/

module cube_center(dims,r=0,$fn=16) {
    if(r==0) {
        translate([-dims[0]/2, -dims[1]/2, 0])
        cube(dims);
    } else {
        minkowski() {
            translate([-(dims[0]-2*r)/2, -(dims[1]-2*r)/2, 0])
            cube([dims[0]-2*r,dims[1]-2*r,dims[2]]);
            cylinder(r=r,$fn=$fn,h=0.0001);
        }
    }
}

module hanger() {
    rotate([0,0,-90]) {
    linear_extrude(8)
    minkowski() {
        polygon([[0,2],[-5,-8],[0,1],[5,-8]]);
        circle(r=1);
    }
    translate([0,0,8])
    linear_extrude(1)
    minkowski() {
        polygon([[0,2],[-5,-8],[0,-5],[5,-8]]);
        circle(r=1);
    }
}
}