T=0.25*25.4;
D=1*25.4;
fn=128;


difference() {
  cylinder(d2=D+4,d1=D+12,h=T+T/2+1,$fn=fn);
  translate([0,0,2])
  cylinder(d2=D,d1=D+2,h=T+1-3,$fn=fn);
  translate([0,0,1])
  cylinder(d2=D,d1=D,h=T+T/2+1,$fn=fn);
}

translate([2*D,0,0])
difference() {
  cylinder(d=D-0.75,h=T/2,$fn=fn);
  translate([0,0,1+0.1])
  cylinder(d2=D-0.75,d1=D/3,h=T/2-1,$fn=fn);
}
