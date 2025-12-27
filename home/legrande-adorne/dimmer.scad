difference() {
minkowski() {
cube_center([88.3+4-4,130.3+4-4,0.001]);
union() {
cylinder(r=2,h=10,$fn=64);
translate([0,0,10])
cylinder(r1=2,r2=1,h=1,$fn=64);
}
}

translate([0,0,3])
cube_center([36,93,10],r=4);

translate([0,0,10])
minkowski() {
cube_center([36,93,1],r=4);
cylinder(d1=0,d2=2,h=1,$fn=64);
}

cylinder(d=20.3,h=2,$fn=128);

    for(i=[0]) for(j=[-1,1])
    translate([i*20,j*45,0])
    cylinder(d=20.3,h=2.1,$fn=64);
    
    for(i=[-1,1]) for(j=[-1,1])
translate([i*(88.3/2-10),j*(130.3/2-10),0])
    cylinder(d=5.5,h=4.3,$fn=64);
}


module cube_center(dims,r=0,$fn=32) {
    if(r==0) {
        translate([-dims[0]/2, -dims[1]/2, 0])
        cube(dims);
    } else {
        
        minkowski() {
            translate([-dims[0]/2+r, -dims[1]/2+r, 0])
            cube([dims[0]-2*r,dims[1]-2*r,dims[2]]);
            cylinder(r=r,h=0.00001,$fn=$fn);
        }
    }
}