difference() {
translate([0,0,25.4/2])
rotate([0,90,0])
translate([0,0,-25.4/2])
cube_center([25.4,5*25.4,25.4],r=4);
    
for(i=[-1,1])
translate([0,-2*25.4*i,25.4*0.9])
rotate([8*i,0,0]) {
cube_center([25.4,25.4,21.5*25.4]);
cylinder(d=0.3*25.4,h=100,$fn=64,center=true);
translate([0,0,-50-10])
cylinder(d=0.5*25.4,h=100,$fn=64,center=true);
}

for(i=[-1,0,1])
translate([0,i*1*25.4,0])
cylinder(d=9.1,h=8,$fn=32);
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