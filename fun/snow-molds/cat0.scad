difference() {
mirror([0,1,0])
translate([-25/2,0,0])
minkowski() {
translate([2.5,0,2.5])
cube([25-5,12,40-5]);
rotate([90,0,0])
cylinder(d=5,h=0.001,$fn=64);
}
cat();
}

module cat() {

difference() {
    translate([0,0,10])
    union() {
for(i=[-1,1])
   
translate([.2*i,9.5,14])
    sphere(d=2,$fn=32);

for(i=[-1,1])
translate([4*i,8,18])
    sphere(d=3,$fn=32);

for(i=[-1,1])
translate([5*i,0,24])
rotate([0,20*i,0])
rotate([-90,0,0])
rotate([0,0,30])
minkowski() {
cylinder(d=5,$fn=3);
    sphere(d=4,$fn=32);
}


for(i=[-1,1])
translate([5*i,3,0])
scale([.5,.7,.7])
sphere(r=10,$fn=128);

for(i=[-1,1])
translate([5*i,3,-9])
scale([.5,.8,.4])
sphere(r=10,$fn=128);


scale([1,1,1.3])
sphere(r=10,$fn=128);

translate([0,0,15])
scale([1,1,1])
sphere(r=10,$fn=128);
}

scale([1,1,-1])
translate([-50,-50,0])
cube([100,100,100]);
}

}