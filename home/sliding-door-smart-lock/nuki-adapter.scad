H=177;
W=31.5;
thick=2;
hthick=5;

H_slot=77;
T_slot=2.5;

difference() {

    // additive
    union() {
        // base
        cube_center([H,W,hthick],r=W/2-0.01,$fn=256);

        cylinder(d=57,h=hthick,$fn=256);
        
        // inner rim
        translate([0,0,hthick])
        difference() {
            cube_center([H-2*thick-0.3,W-2*thick-0.3,thick],r=(W-2*thick)/2-0.3-0.01,$fn=256);
            difference() {
                cube_center([H-4*thick,W-4*thick,thick+0.01],r=(W-4*thick)/2-0.01,$fn=256);
                cube_center([50,50,100]);
                difference() {
                    cube_center([500,100,5]);
                    cube_center([147,100,5]);
                }
            }
        }

        // slide slot
        translate([0,-W/2+(thick+0.3)/2,hthick])
        cube_center([H_slot-1,thick+0.3,thick]);
        

    }
    
    // subtractive
    union() {
        // horizontal slots for peg
        for(i=[-1,1])
        translate([125/2*i,0,hthick]) {
            cube_center([10,100,thick+0.01]);
        }
        
        // inverse pegs
        for(i=[-1,1])
        translate([102.5/2*i,0,hthick-2]) {
            cylinder(d=5,h=10,$fn=64);
        }
        
        // holes for handle
        for(i=[-1,1])
        translate([147/2*i,0,0]) {
            cylinder(d=5.5,h=100,$fn=64);
            translate([0,0,hthick-2.5])
            cylinder(d1=5.5,d2=9.5,h=2.5,$fn=64);
            translate([0,0,hthick])
            cylinder(d=10,h=100,$fn=64);
        }
        
        // hole for lock
        cylinder(d=12,h=100,$fn=64);
        
        // hole for nuki
        for(i=[-1,1])
        translate([i*38/2,0,0])
        cylinder(d=3.6,h=100,$fn=64);
    }
    
        // peg holes
        for(i=[-1,1])
        translate([125/2*i,0,0]) {
                cylinder(d=4.5,h=10,$fn=64);
                cylinder(d1=8.5,d2=8.5,h=0.5,$fn=64);
                translate([0,0,0.5])
                cylinder(d1=8.5,d2=4.5,h=2.2,$fn=64);
        }
}

// additive 2
union() {
/*
        // pegs
        for(i=[-1,1])
        translate([125/2*i,0,hthick]) {
            difference() {
                cylinder(d1=8.5,d2=8,h=9,$fn=32);
                translate([0,0,4.5])
                rotate([90,0,0])
                cylinder(d=3,h=100,center=true,$fn=32);
            }
        }
*/
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