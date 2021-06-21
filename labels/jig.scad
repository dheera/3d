S = 9.0;

module label(title) {
  cube_center([S*5.6,S*2.4,1], r=S/4, $fn=64);
}


difference() {
    cube_center([153,99,1]);
    difference() {
        cube_center([153-5,99-5,2]);
        cube_center([153,S*2.4+6,3]);
    }
    label();
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