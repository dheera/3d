fudge = 0.5;
difference() {
    union() {
        cube_center([108, 108, 2.5]);
        difference() {
        translate([0,0,2.5])
        cube_center([88.3,88,2.5], r=3);
        translate([0,0,2.5])
        cube_center([83,83,2.5], r=1);
        }
    }
    translate([0,0,0]) {
        cylinder(d1=34.9+fudge,d2=34.9,h=0.5,$fn=256);
        translate([0,0,0.5])
        cylinder(d1=34.9,d2=34.9,h=2.0,$fn=256);
        translate([0,15,1])
        cube_center([2.5,10,2.5],r=1);
    }


    
    for(s=[-1,1]) for(t=[-1,1])
    translate([-s*20,-t*48])
    cylinder(d=3.1,h=50,$fn=64);
    for(s=[-1,1]) for(t=[-1,1])
    translate([-s*48,-t*20])
    cylinder(d=3.1,h=50,$fn=64);
    
    
}
    
module cube_center(dims,r=0) {
    if(r==0) {
        translate([-dims[0]/2, -dims[1]/2, 0])
        cube(dims);
    } else {
        
        minkowski() {
            translate([-dims[0]/2+r, -dims[1]/2+r, 0])
            cube([dims[0]-2*r,dims[1]-2*r,dims[2]]);
            cylinder(r=r,h=0.00001,$fn=32);
        }
    }
}