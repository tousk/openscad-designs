//use <bend.scad>

module cylindric_bend(dimensions, radius, nsteps = $fn) {
  step_angle = nsteps == 0 ? $fa : atan(dimensions.y/(radius * nsteps));
  steps = ceil(nsteps == 0 ? dimensions.y/ (tan(step_angle) * radius) : nsteps);
  step_width = dimensions.y / steps;
  {
    intersection() {
      children();
      cube([dimensions.x, step_width/2, dimensions.z]);
    }      
    for (step = [1:steps]) {
      translate([0, radius * sin(step * step_angle), radius * (1 - cos(step * step_angle))])
        rotate(step_angle * step, [1, 0, 0])
          translate([0, -step * step_width, 0])
            intersection() {
              children();
              translate([0, (step - 0.5) * step_width, 0])
                cube([dimensions.x, step_width, dimensions.z]);
            }
    }
  }
}


rotate(-90, [0,0,1]) rotate(90, [0,1,0])
  !cylindric_bend([20, 150, 2],50,36)
    translate([20, 0, 0]) 
      rotate(90, [0,0,1])
      linear_extrude(height=3)
        text("cylindric_bend", size=15, valign="bottom");

*translate([0, -40, -50]) rotate(-90, [0,0,1])
  parabolic_bend([20, 150, 2], 0.007)
    translate([20, 0, 0]) rotate(90, [0,0,1])
      linear_extrude(height=2)
        text("parabolic_bend", size=15, valign="bottom");

*linear_extrude(height = 60, twist = 90, slices = 100) {
   difference() {
     offset(r = 10) {
      square(20, center = true);
     }
     offset(r = 8) {
       square(20, center = true);
     }
   }
 }