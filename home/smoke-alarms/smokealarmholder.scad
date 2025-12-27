difference() {
    cylinder(d=120,h=2,$fn=256);
    cylinder(d=50,h=3,$fn=256);
    for(i=[0:3]) rotate([0,0,90*i])
    translate([40,0,0]) {
        minkowski() {
            cube([0.0001,10,0.0001],center=true);
            cylinder(d=4.5,h=5,$fn=32);
        }
        translate([0,0,0.7])
        minkowski() {
            cube([0.0001,10,0.0001],center=true);
            cylinder(d=9,h=5,$fn=32);
        }
    }
}
translate([0,0,2]) {
    difference() {
        cylinder(d=114.8,h=5.5,$fn=256);
        cylinder(d=110.8,h=6,$fn=256);
    }
    translate([0,0,3.5])
    difference() {
        cylinder(d=113,h=2,$fn=256);
        cylinder(d=107,h=6,$fn=256);
        
        for(i=[0:1])
        rotate([0,0,i*90])
        cube([200,60,60],center=true);
        

        for(i=[0:3])
        rotate([0,0,i*90+45])
        translate([0,0,-0.4])
        rotate([3,0,0])
        translate([100,0,0])
        cube([200,50,3],center=true);
        
    }
}