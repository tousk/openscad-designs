
w=30; // radius of cylinder
h=100; // height of cylinder
pattern_z=5; // z position of the pattern
pattern_in=2; // move the pattern into the cylinder
mytext="I Love Mom";

//
// the pattern should be at [w,0,0] and move in y according to a
// pattern should be 2Pi * w size in Y

module ptext(){
    rotate([90,0,90])
    linear_extrude(height=5,convexity=2) text(mytext,20);
}
// some text...
module pattern(a=0) {
    translate([w-pattern_in,a*PI/180*(w-pattern_in),pattern_z]) ptext();
}

module cutter(a=5,w=50,h=100) {
    render()
    intersection() {
        rotate([0,0,-a/2]) translate([0,0,-h/2]) cube([w,50,h]);
        rotate([0,0,a/2]) translate([0,-50,-h/2]) cube([w,50,h]);
    }
}

module wrap(step=5) {
    for( i=[0:step:360+2*step] ) {
        rotate([0,0,i])
        intersection() {
            pattern(-i);
            cutter(step,w+20-pattern_in,h+20);
        }
    } 
}

//color("orange") translate([0,0,0]) pattern(0);
union(){
cylinder(r=w,h=h,center=true);
wrap();
}