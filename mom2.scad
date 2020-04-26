module art(h=5){
linear_extrude(height = h, center = true, convexity = 10)
import("/Users/tzhang/Downloads/01281 Nurses Rock/SVG/01281 Nurses Rock.svg");
}

//translate([0,0,-10]) cylinder(10,r=200);
translate([-150,-150,5]) art(35);