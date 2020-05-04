//module art(h=5){
//	linear_extrude(height = h, center = true, convexity = 10)
//}

//translate([0,0,-10]) cylinder(10,r=200);

union(){
  difference(){
    rotate([90,0,0]) import("braava_jet_240_sweep_base_plate.stl",center=false);
    translate([0,0,0.5])  cube([5,11,0.7]);
  }
  translate([0,0,0.5])  cube([6,5,0.7]);
}
