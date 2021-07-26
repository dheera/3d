W=106-1;
H=35-1;
difference() {

  cube_center([W, H, 2]);
    translate([-36,0,-.1])
    cube_center([15.1, 19.0, 5]);
    
    translate([9.5,1,-.1])
    cube_center([54, 17, 5]);
}

translate([-36,0,-.1])
cube_center([15.1-1, 19.0-1, 2]);

translate([-36,0,1.85])
cube_center([15.1, 19.0, .15]);

difference() {
translate([0,H/2-1,0])
cube_center([W, 2, 90]);

for(i=[-30,-10,10,30])
translate([i,H/2-1,56])    
cube_center([10, 3, 20]);
    
}

difference() {
    union() {
        cube_center([W,H,0]);
    translate([0,0,1])
    minkowski() {
        cube_center([W-2,H-2,1.6]);
        rotate([0,0,45])
        cylinder(d1=2*sqrt(2),d2=0,h=2/sqrt(2),$fn=4);
    }
}
    
    cube_center([W-2+.1,H+5+.1,50]);
}

for(s=[-1,1])
translate([s*30,H/2,50+1])
rotate([0,90,0])
cylinder(d=2,h=10,$fn=4,center=true);


difference() {
    // side panels
for(s=[-1,1])
    scale([s,1,1]) {
        
            for(t=[-1,1])
    translate([t*(106/2-1.7),0,10 ])
    scale([.5,1,1])
    rotate([90,0,0])
    cylinder(d=3,h=20, center=true,$fn=32);
            
        
        difference() {
    translate([W/2-1,0,0])
    cube_center([2,H,90]);
            // rails
            for(t=[-1,1])
    translate([W/2-1+2-1,t*6,0])
    cube_center([2,3,90]);
            
            
            
        }
    }
    
    rotate([45,0,0])
    translate([0,0,30])
    cube_center([200,200,200]);
    
}


translate([10,H/2-2,45.5])
rotate([90,90,0])
raspberrypi();

module raspberrypi() {
    translate([-85/2 + 3.5,49/2,0])
    standoff();
    
    translate([-85/2 + 3.5,-49/2,0])
    standoff();
    
    translate([-85/2 + 3.5 + 58,49/2,0])
    standoff();
    
    translate([-85/2 + 3.5 + 58,-49/2,0])
    standoff();
}


module standoff() {
    difference() {
        cylinder(d1=8,d2=6,h=5.5,$fn=32);
        cylinder(d=4.0,h=10, $fn=32);
    }
}

/*difference() {
    cube_center([W, H, 2]);
    for(i=[-10:5:10]) for(j=[-47.5:5:47.5])
    translate([j,i,-.1])
    cube_center([3,3,5]);
}*/

/*
translate([-28+10,10,88])
rotate([90,90,0])
import("/home/dheera/code/3d/rack/Raspberry_pi_4_v0.6.stl");
*/

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