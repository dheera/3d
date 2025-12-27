module contax_collar() {
D1=59;
D2=66;
H1=25.75;
H2=17.75;
fn=256;
    
    difference() {
        cylinder(d=D2+2,h=H1,$fn=fn);
        translate([0,0,-.1])
        cylinder(d=D1,h=H1+1,$fn=fn);
        
        translate([0,0,(H1-H2)/2-1])
        difference() {
            cylinder(d=D2+2.001,h=H2+2,$fn=fn);
            cylinder(d=D2,h=H2+2,$fn=fn);
            cylinder(d1=D2+2.001,d2=D2,h=1,$fn=fn);
            translate([0,0,H2+1])
            cylinder(d2=D2+2.001,d1=D2,h=1,$fn=fn);
        }


        translate([-50,-0.75,-.001])
        cube([100,100,100]);
        

        translate([0,0,H1-2])
        difference() {
            cylinder(d1=D2+2,d2=D2+2,h=2,$fn=fn);
                translate([0,0,-.001])
            cylinder(d1=D2+2,d2=D2-2,h=2.002,$fn=fn);
        }
    
    }
}


module nikon_collar() {
    //nikon
D1=49.5;
D2=66;
H1=25;
H2=17.75;
fn=256;

    difference() {
        cylinder(d=D2+2,h=H1,$fn=fn);
        translate([0,0,-.1])
        cylinder(d=D1,h=H1+1,$fn=fn);
        
        translate([0,0,(H1-H2)/2-1])
        difference() {
            cylinder(d=D2+2.001,h=H2+2,$fn=fn);
            cylinder(d=D2,h=H2+2,$fn=fn);
            cylinder(d1=D2+2.001,d2=D2,h=1,$fn=fn);
            translate([0,0,H2+1])
            cylinder(d2=D2+2.001,d1=D2,h=1,$fn=fn);
        }


        translate([-50,-0.75,-.001])
        cube([100,100,100]);
        
        translate([0,0,H1-2])
        cylinder(d1=49.5,d2=60,h=2,$fn=fn);
    

        translate([0,0,H1-2])
        difference() {
            cylinder(d1=D2+2,d2=D2+2,h=2,$fn=fn);
                translate([0,0,-.001])
            cylinder(d1=D2+2,d2=D2-2,h=2.002,$fn=fn);
        }
    
        translate([0,0,2])
        mirror([0,0,1])
        difference() {
            cylinder(d1=D2+2,d2=D2+2,h=2,$fn=fn);
            translate([0,0,-.001])
            cylinder(d1=D2+2,d2=D2-2,h=2.002,$fn=fn);
        }
    }
}

contax_collar();
translate([0,10,0])
rotate([0,0,180])
contax_collar();