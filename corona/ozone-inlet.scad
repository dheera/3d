D=7;
T=3;
fn=128;

difference() {
    union() {
        translate([0,0,T])
        cylinder(d=D+4*T,h=5,$fn=fn);
        cylinder(d=D+20,h=T,$fn=fn);
    }
    cylinder(d1=D+2*T,d2=D+2*T,h=100,$fn=fn);
}

translate([30,0,0])
difference() {
    union() {
        translate([0,0,T])
        cylinder(d1=D+2*T,d2=D+2*T-0.3,h=5,$fn=fn);
        cylinder(d=D+20,h=T,$fn=fn);
    }
    cylinder(d=D,h=100,$fn=fn);
}