T=1;
D2=24;
H1=20;
H2=15;
D1=D2-2*T+2*H1;
fn=128;

difference() {
    union() {
        cylinder(d1=D1,d2=D2-2*T,h=H1,$fn=fn);
        cylinder(d=D1+T,h=T,$fn=fn);
    }
    translate([0,0,-T*sqrt(2)])
    cylinder(d1=D1,d2=D2-2*T,h=H1,$fn=fn);
    cylinder(d=D2-2*T,h=H1*2,$fn=fn);
}


translate([0,0,H1-T*sqrt(2)])
difference() {
    cylinder(d=D2,h=H2,$fn=fn);
    cylinder(d=D2-2*T,h=H2,$fn=fn);
}