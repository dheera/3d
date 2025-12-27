curtain_id=35.7;
base_d=38.0;
base_h=2;
ring_id=26.0;
slot_width=4.5;
slot_d=29.5;
ring_od=30;
h=9;
fn=256;

difference() {
    union() {
        cylinder(h=base_h,d=base_d,$fn=fn);
        for(angle=[0,72,180,180+72]) {
            rotate([0,0,angle])
            pieSlice(30,curtain_id/2,h,$fn=fn);
        }
        cylinder(h=h,d=ring_od,$fn=fn);
        
    }
    cylinder(h=h+0.001,d=ring_id,$fn=fn);
    for(angle=[7,180+7]) {
        rotate([0,0,angle])
        pieSlice(16,slot_d/2,h+0.001,$fn=fn);
    }
    cylinder(d=slot_d,h=1,$fn=fn);
    translate([0,0,1])
    cylinder(d1=slot_d,d2=ring_id,h=(slot_d-ring_id)/2,$fn=fn);
}
module pieSlice(a, r, h, $fn=32){
  // a:angle, r:radius, h:height
  rotate_extrude(angle=a,$fn=$fn) square([r,h]);
}