
W=36;
H=36;

difference() {
cylinder(d=130,h=4.6,$fn=256);
cube_center([95.5-2.0,36,4]);

translate([0,0,2])
cube_center([96.5+.5,2*38.0+.5,4]);

translate([0,0,3])
cylinder(d=84.5,h=4,$fn=256);
}

//for(i=[0,90])
//rotate([0,0,i])
translate([0,0,4.6])
difference() {

    intersection() {
        cylinder(d=90,h=1.5,$fn=256);
     }   
        cube_center([96.5+.5,2*38.0+.5,4]);
        
        translate([0,-10,.8])
        cube_center([96.5+.5,2*38.0+.5,4]);
        
        
    cylinder(d1=84.5,d2=76.5,h=4,$fn=256);
    
}


//84

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