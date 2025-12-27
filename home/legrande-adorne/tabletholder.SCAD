thick=7.2;
T2=15;
hback=130+0.3;
hfront=161.9+0.3;
T=5;

UT=13;

for(i=[-1,1])
translate([-7,65.15*i,0])
difference() {
    cube_center([10,10,T2]);
    cylinder(d=2.7,h=T2,$fn=64);
    translate([0,0,T2-3])
    cylinder(d1=6,d2=6,h=3,$fn=64);
}

cube_center([T,hfront+2*T,T2],r=1);

difference() {
for(i=[-1,1])
translate([T-T/2+thick/2,i*(hfront/2),0])
cube_center([2*T+thick,T*2,T2],r=1);

translate([T-T/2+thick/2,0,0])
cube_center([thick,hfront,T2],r=1);
}



translate([-13,0,0])
mirror([1,0,0]) {
cube_center([T,hback+2*T,T2]);
difference() {

translate([4.5+2,0,0])
    cube_center([9,hback+2*T,T2]);

union() {
    translate([4.5,0,0])
    cube_center([4.5,hback,T2]);
    
    for(i=[-1,1]) scale([1,i,1])
    translate([9-.6,hback/2-4.5/2-.5,0])
    rotate([0,0,-15])
    cube_center([4.5,4.5,T2]);
    
    translate([9,0,0])
    cube_center([4.5,hback-3,T2]);
    }


/*    for(i=[-1,1])
    translate([T-T/2+thick/2,i*(hback/2),0])
    cube_center([2*T+thick,T,T2],r=1);
    
    }*/
    

}

}

module cube_center(dims,r=0,$fn=32) {
    if(r==0) {
        translate([-dims[0]/2, -dims[1]/2, 0])
        cube(dims);
    } else {
        
        minkowski() {
            translate([-dims[0]/2+r, -dims[1]/2+r, 0])
            cube([dims[0]-2*r,dims[1]-2*r,dims[2]]);
            cylinder(r=r,h=0.00001,$fn=$fn);
        }
    }
}