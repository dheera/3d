    
translate([0,-20,0])
difference() {
union() {
cylinder(d=20,h=3,$fn=128);
translate([0,0,3])
cylinder(d1=20,d2=14,h=1,$fn=128);
cylinder(d=14,h=10,$fn=128);
}
cylinder(d=3.6,h=10,$fn=128);
}