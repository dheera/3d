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
label("清潔用品");
translate([S*6,0,0])
label("");
translate([-S*6,0,0])
label("烘培工具");

translate([0,S*3,0])
label("保鮮袋");
translate([S*6,S*3,0])
label("杯子");
translate([-S*6,S*3,0])
label("米粉");

translate([0,-S*3,0])
label("火鍋");
translate([S*6,-S*3,0])
label("蒸格");
translate([-S*6,-S*3,0])
label("澱粉");

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