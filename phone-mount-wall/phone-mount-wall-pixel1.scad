screen_w = 62;
screen_h = 110.5;
phone_w = 69.64;
phone_h = 143.83;
phone_t = 7.5;

W = screen_w + 40;
H = screen_h + 40;
T = phone_t + 1.5 + 1.5 + 1;



/*
    translate([0,0,1.5+1+1.5])
cube_center([phone_w, phone_h,phone_t]);*/

translate([120,0,0]) {
    
difference() {
    union() {
    cube_center([W-3.4,H-3.4,1.5],r=1);
        
    
// stupid wedge design of pixel 1
translate([0,0,1.5])
    cube_center([phone_w,phone_h,4.5]);
    
translate([phone_w/2,0,1.5+4.5])
rotate([0,-90,0])
linear_extrude(height=phone_w)
polygon(points =[[1,-phone_h/2], [0,-phone_h/2], [0,phone_h/2]], paths=[[0,1,2]]);
    }
    
    translate([0,0,-1])
    cube_center([32+10,66+10, 15],r=1);
    
    for(s=[-1,1]) {
    translate([0,s*96.8375/2,0])
    cylinder(d=3.7,h=15,center=true,$fn=32);
        
        translate([0,s*96.8/2,1.5])
    cylinder(d=10,h=15,$fn=32);
    }

    for(s=[-1,0,1]) for(t=[-1,1])
        translate([t*(W/2-1.7),s*40,sqrt(2)/2+.05])
    rotate([90,0,0])
    cylinder(d=1.4142,h=10,$fn=4, center=true);
}
translate([0,0,1.5]) {
    difference() {
        cube_center([phone_w+3,phone_h+3,phone_t+4.5]);
        cube_center([phone_w+0.3,phone_h+0.3,phone_t+10]);
        cube_center([200,phone_h-20,phone_t+10]);
        cube_center([phone_w-20,200,phone_t+10]);
    }
}
}

/*
for(s=[-1,1])
translate([s*43,70,0])
rotate([0,0,90])
    hanger();
*/

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

module hanger() {
    rotate([0,0,-90]) {
    linear_extrude(8)
    minkowski() {
        polygon([[0,2],[-5,-8],[0,1],[5,-8]]);
        circle(r=1);
    }
    translate([0,0,8])
    linear_extrude(1)
    minkowski() {
        polygon([[0,2],[-5,-8],[0,-5],[5,-8]]);
        circle(r=1);
    }
}
}