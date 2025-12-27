/*difference() {
    translate([-44.8,-45.1])
    import("LensBoard_Toyo-view_blank_v2.stl");
   
    translate([0,0,-10])
    cube_center([130,140,50]);
    
    for(s=[-1:1]) for(t=[-1,1])
    translate([t*70,s*70,0])
    cylinder(d=3.2,h=20,$fn=32, center=true);
}*/

GGL=4*25.4+1;
GGW=5*25.4+1.5;
GGT=1/16*25.4+0.5;
OH=5;
F=10;
TT=2.5;

difference() {
    cube_center([158,158,TT+TT+.5], r=7);
    translate([0,0,TT])
    cube_center([158-5.2,158-5.2,TT+TT], r=4.5);
    
    rotate([0,0,45])
    cylinder(d1=145*sqrt(2),d2=110*sqrt(2),h=20,$fn=4);
}

difference() {
    union() {
        rotate([0,0,45])
        cylinder(d1=145*sqrt(2),d2=110*sqrt(2),h=25,$fn=4);
    }
    difference() {
    translate([0,0])
    rotate([0,0,45])
    cylinder(d1=((145-2*TT)*sqrt(2)),d2=((110-2*TT)*sqrt(2)),h=25,$fn=4);
        
        translate([0,0,25-TT])
        cube_center([110,110,TT]);
    }
    
    cube_center([88.3,88.3,50], r=3);
    
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
            cylinder(r=r,h=0.00001,$fn=64);
        }
    }
}