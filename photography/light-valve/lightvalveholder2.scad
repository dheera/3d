W=36;
H=36;

difference() {
cylinder(d=90,h=4.6,$fn=256);
cube_center([W-2,H-2,4]);
translate([0,0,1])
cube_center([W+.5,H+.5,4]);

translate([0,0,0])
difference() {
cube_center([8,H+.5,4]);
translate([0,50,0])
cube_center([100,100,5]);
}

translate([0,0,3])
cylinder(d=84.5,h=4,$fn=256);

for(i=[-2.5,2.5])
translate([i,0,0])
rotate([90,0,0])
cylinder(h=100,d=2,$fn=32);
}

//for(i=[0,90])
//rotate([0,0,i])
translate([0,0,4.6])
difference() {

    intersection() {
        cylinder(d=90,h=1.5,$fn=256);
        
        union() {
            translate([0,50,0])
            cube_center([100,100,5]);
            
            cube_center([10,100,.5]);
        }
    }
    
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