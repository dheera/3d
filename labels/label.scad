S = 9.0;

module label(title) {
  cube_center([S*5.5,S*2.3,1], r=S/4, $fn=64);
  translate([0,0,1])
  linear_extrude(height=0.5)
  text(title,
    font = "cwTeXHeiBold",
    halign = "center",
    valign = "center",
    size = 8
  );
}

translate([0,0,0])
label("麵粉");
translate([S*6,0,0])
label("糯米粉");
translate([-S*6,0,0])
label("烘焙");

translate([0,S*3,0])
label("日料");
translate([S*6,S*3,0])
label("非洲中東");
translate([-S*6,S*3,0])
label("東南亞");

translate([0,-S*3,0])
label("麥片");
translate([S*6,-S*3,0])
label("零食");
translate([-S*6,-S*3,0])
label("模具");

module cube_center(dims,r=0,$fn=16) {
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