W = 19*25.4;
H=1.75*25.4 - 0.6;
T=2;

SD=4.76+1; // screw diameter

//intersection() {
    
difference() {
    union() {
    cube_center([W,H,T], r = 3);
        for(s=[-110-55-4,-55-4,55+4,110+55+4])
        translate([s,0,0])
    trayplus();
        plus();
    }
    
    for(s=[-1,0,1]) for(t=[-1,1])
        translate([t*465.12/2, s*15.875,0])
    minkowski() {
        cylinder(d=SD, h=25, $fn=32, center=true);
        cube_center([3 ,0.0001,0.0001]);
    }
    
    for(s=[-110-55-4,-55-4, 55+4, 110+55+4])
        translate([s,0,0])
    trayminus();
    
    minus();
}

//puzzle(); }

module puzzle() {
    
    translate([0,-250,-1])
    cube([500,500,100]);

    for(s=[-3,-1,1,3])
        translate([0,s*6,0])
    scale([1.5,1,1])
    cylinder(d=4.5,h=100,$fn=3); // 4.5 for difference, 4.3 for intersection
    
}

module plus() {
    cube_center([10,H,12]);
}

module minus() {
    for(s=[-1,0,1])
        translate([0,s*12,0]) {
            
            
    translate([0,0,6])
    rotate([0,90,0])
    {

        cylinder(d=3.3,h=50,$fn=32);
        translate([0,0,1])
        cylinder(d=5.35,h=50,$fn=32);
    }
    
    translate([0,0,6])
    rotate([0,-90,0]) {
    cylinder(d=3.3,h=3.3,$fn=32);
        translate([0,0,1.5])
    cylinder(d=6.5,h=50,$fn=32);
    }
    
    
}
}


    
    

module trayplus() {
    difference() {
    translate([0,-17.5,12])
rotate([0,-90,0])
    linear_extrude(height=106+4, center=true)
    polygon(points =[[55-12-5,0], [0,35+2], [0,0]], paths=[[0,1,2]]);
    }
    
    
    difference() {
        cube_center([106+4,35+4,50]);
        translate([0,3,12])
        cube_center([106+6,35+6,55]);
        //translate([0,-40,12])
        //cube_center([106+6,35+6,55]);
    }
}

module trayminus() {
    cube_center([106+.5,35.5,10]);
    
    translate([0,0,10])
    minkowski() {
        cube_center([106+.5-2,35-2,2]);
        rotate([0,0,45])
        cylinder(d1=2*sqrt(2),d2=0,h=2/sqrt(2),$fn=4);
    }
    
    difference() {
    cube_center([106+.5,35.5,500]);
        
        for(s=[-1,1])
        difference() {
        translate([0,10*s,0]) {
            cube_center([106+2,3-.4,100]);}
            translate([0,10*s,0]) {
            cube_center([104+.4,10,100]);
        }
        }
    }
    
}

module cube_center(dims,r=0,$fn=64) {
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