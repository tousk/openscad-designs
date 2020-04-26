module art(h=10){
linear_extrude(height = h, center = true, convexity = 10)
    import("/Users/tzhang/Downloads/horse.svg");
}
art();
translate([0,0,-5]) cube([50,6,10]);
