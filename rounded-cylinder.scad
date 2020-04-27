module cy(){
union(){
    translate([0,0,0]) cylinder(r=20,h=20,$fn=100);
translate([0,0,20]) rotate_extrude(convexity = 10, $fn = 100)
    scale([1,1,1])
    translate([18,0,0])
    circle(r=2);
    
    translate([0,0,0]) cylinder(r=18,h=22,$fn=100);

}
}

cy();
rotate([180,0,0]) cy();
