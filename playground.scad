if (false){
rotate_extrude($fn=100) 
translate([1,0,0])
offset(r=0.2)
polygon( points=[[0,0],[2,1],[3,4],[0,5]] );
}

if (true){
translate([0,0,0])
 hull(){
    cylinder(10,20,10,$fn=50,center=true);
    translate([0,0,5]) sphere(r=10,$fn=50);
     }
}


if (false){ 
rotate_extrude($fn=100) 
translate([20,0,0])     
offset(r=5, $fn=20) polygon(points=[[0,0],[10,0],[13,1],[14,2],[13,4],[10,5]]);
}
