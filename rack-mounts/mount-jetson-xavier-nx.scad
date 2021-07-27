W=106-1;
H=35-1;
difference() {

  cube_center([W, H, 2]);
    
    difference() {
        translate([0,1.5,-.3])
        cube_center([71, 21, 5]);
        
        translate([54,-16])
        translate([0,1.5,-.3])
        cube_center([71, 21, 10]);
    }
    
    
    // usb
    translate([42.,9,1])
    cube_center([10, 6, 5]);
    
    // power
    translate([-44,,5.25,-.3])
    cube_center([10, 12, 5]);
    
    translate([-44,-2.5,-.3])
    minkowski() {
        cylinder(d=4,h=50,center=true,$fn=32);
        cube([0.0001,3,0.0001]);
    }
}


difference() {
translate([0,H/2-1,0])
cube_center([W, 2, 95]);

for(i=[-30,-10,10,30])
translate([i,H/2-1,56])    
cube_center([10, 3, 20]);

for(i=[-30,-10,10,30])
translate([i,H/2-1,26])    
cube_center([10, 3, 20]);

translate([-3,H/2,47.75+0.75])
rotate([90,0,0])
xaviernxminus();
    
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


translate([-3,H/2,47.75+0.75])
rotate([90,0,0])
xaviernx();

module xaviernx() {
    translate([-86/2,-58/2,0])
    standoff();
    
    translate([86/2,-58/2,0])
    standoff();
    
    translate([-86/2,58/2,0])
    standoff();
    
    translate([86/2,58/2,0])
    standoff();
}

module xaviernxminus() {
    translate([-86/2,-58/2,0])
    cylinder(d=5,h=5,$fn=32);
    
    translate([86/2,-58/2,0])
    cylinder(d=5,h=5,$fn=32);
    
    translate([-86/2,58/2,0])
    cylinder(d=5,h=5,$fn=32);
    
    translate([86/2,58/2,0])
    cylinder(d=5,h=5,$fn=32);
}


module standoff() {
    difference() {
        cylinder(d1=8,d2=6,h=5,$fn=32);
        cylinder(d=5,h=10, $fn=32);
    }
}

/*difference() {
    cube_center([W, H, 2]);
    for(i=[-10:5:10]) for(j=[-47.5:5:47.5])
    translate([j,i,-.1])
    cube_center([3,3,5]);
}*/


//translate([-34.8,4,41.75]) rotate([90,0,0]) import("/home/dheera/code/3d/rack/Jetson_Xavier_NX_DevKit_LQ.stl");


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