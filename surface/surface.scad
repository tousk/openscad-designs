*scale([1, 1, 0.4])
  surface(file = "horse2.png", center = true,invert=false);

w=30; // radius of cylinder
h=100; // height of cylinder

//
// the pattern should be at [w,0,0] and move in y according to a
// pattern should be 2Pi * w size in Y
// Some rings...
//
module pattern0(a=0) {
    for(i=[0:3]) {
        translate([w,a*PI/180*w+i*PI/2*w+w,-20])
        rotate([-90,0,-90])
        difference() {
            cylinder(d1=PI/2*w+3,d2=0,h=80);
            translate([0,0,-0.1]) cylinder(d1=PI/2*w-3,d2=45+50,h=80);
        }
    }
}
// some text...
module pattern1(a=0) {
    translate([w,a*PI/180*w,10])
    rotate([90,0,90])
    linear_extrude(height=5,convexity=2) text("bonjour!",32);
}

// rings and text...
module pattern2(a=0) {
    *pattern0(a);
    pattern1(a);
}


module cutter(a=5,w=50,h=100) {
    render()
    intersection() {
        rotate([0,0,-a/2]) translate([0,0,-h/2]) cube([w,50,h]);
        rotate([0,0,a/2]) translate([0,-50,-h/2]) cube([w,50,h]);
    }
}

cylinder(r=w,h=h,center=true);

color("orange") translate([0,0,0]) pattern2(0);

step=5;
for( i=[0:step:360+2*step] ) {
    rotate([0,0,i])
    intersection() {
        pattern2(-i);
        cutter(step,w+20,h+20);
    }
} 