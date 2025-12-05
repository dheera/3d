difference() {
    minkowski() {
        cylinder(d=67-8,h=24-4,$fn=256);
        sphere(d=8,$fn=64);
    }
    mirror([0,0,1])
    cylinder(d=100,h=100,$fn=16);
    translate([-8.3/2,-8.3/2,0])
    cube([8.3,8.3,22]);


    translate([0,0,10]) {
        rotate([0,90,0]) {
            cylinder(d=3.3,h=100,$fn=64);

            translate([0,0,67/2-.5-4])
            cylinder(d=6.3,h=10,$fn=64);
        }
    }

}