translate([0,20,0])
difference() {
    minkowski() {
        cylinder(d=14-1,h=0.5+4,$fn=128);
        cylinder(d1=0,d2=1,h=0.5,$fn=16);
    }
    translate([0,0,4.5])
    cylinder(d1=12.15,d2=12.4,h=0.5,$fn=128);
    translate([0,0,1])
    cylinder(d=12.15,h=4,$fn=128);
    }