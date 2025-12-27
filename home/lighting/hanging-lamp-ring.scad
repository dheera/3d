T=1.5;
Q=182.5;
R=3.7;
intersection() {
difference() {
    cylinder(d=225,h=T,$fn=256);
    cylinder(d=173,h=T+1,$fn=256);
    for(i=[0,120,240]) rotate([0,0,i])
    cube_center([190,5,10],r=1);
}
cube_center([250,200,5]);
}

for(i=[0:60:360])
    rotate([0,0,i])
translate([0,Q/2,T])
difference() {
    cube_center([5,9,R-0.5]);
    translate([0,0,R/2+0.5])
    rotate([0,90,0])
    cylinder(d=R,h=10,center=true,$fn=32);
}

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