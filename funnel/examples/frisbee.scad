use <../spline.scad>
include <../dfm.scad>

wall=0.1;

color("orange")
scale(1)
spline_lathe([
[9.8,0],
[10,0.4],
[9,2],
[1.2,2],
[1.2,2-wall],
[9,2-wall],
[10-wall,1-0.4],
[9.8-wall/2,0] 
],$fn=100);
