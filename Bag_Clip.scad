
// --------------------------------------------------------------------------
// parametrs, you can change them as you will

m_Height = 4;   // height of the clip
m_Space  = 0.4; // gap between moving parts for supportless 3d print
m_Radius = 4;   // radius of clip joint
m_Lenght = 40;  // total clip lenght, including m_Radius
m_Text   = "\u2668"; // carved text on clip
m_font   = "Apple Symbols";
m_text_scale = 1.5;

// --------------------------------------------------------------------------
// internal variables, you also may change them

cyl_Height = (m_Height-2*m_Space)/3;
int_Height = (m_Height+4*m_Space)/3;
cyl_Radius = m_Radius;
box_Lenght = max(m_Lenght-m_Radius,m_Radius);
hol_Radius = m_Radius*(2/3)+m_Space;
tht_Height = m_Radius*0.3;
tht_Grads  = 50;
tht_Base   = tht_Height*tan(tht_Grads/2);  
clp_Thick  = 1.5;
clp_Height = 2*(m_Radius+m_Space+clp_Thick);
clp_Lenght = m_Radius*1.5;
sub_Lenght = clp_Lenght*0.8;
    
 // --------------------------------------------------------------------------
 // main code, 3d print with 90 rotation for inner part and 0 rotation of outer part
 
rotate(45) InnerPart();
rotate(0) OuterPart();

// --------------------------------------------------------------------------

module OuterPart() {
    difference() {
       
        difference() {
        
            union() {
        
                difference() {
                    translate([0,-(box_Lenght-clp_Thick-m_Space)/2,0])
                        cube([cyl_Radius*2,box_Lenght-clp_Thick-m_Space,m_Height],center=true);
                    cube([cyl_Radius*2,cyl_Radius*2+m_Space,int_Height],center=true);
                    //cylinder(h=int_Height,r=cyl_Radius+m_Space,center=true,$fn=100); 
                }
    
                translate([0,0,cyl_Height+m_Space])
                    cylinder(h=cyl_Height,r=cyl_Radius,center=true,$fn=100); 
    
                translate([0,0,-cyl_Height-m_Space])
                    cylinder(h=cyl_Height,r=cyl_Radius,center=true,$fn=100); 
    
                cylinder(h=cyl_Height+m_Space*2,r=hol_Radius-m_Space,center=true,$fn=100); 
            }
        
            union() {
                difference() {
                    translate([m_Radius/2,-(m_Lenght-m_Radius)/2,0])
                        cube([cyl_Radius,m_Lenght-m_Radius,m_Height],center=true);
                    cylinder(r=cyl_Radius,h=m_Height,center=true,$fn=100);
                }
            }
        }
        
        tht_Base1 = tht_Base+m_Space*sin(tht_Grads/2);
        tht_Height1 = tht_Base1*(1/tan(tht_Grads/2));
        
        translate([-(m_Radius-tht_Height1+0.01),-m_Radius,0])
            rotate([0,-90,90])
                linear_extrude(height=box_Lenght-m_Radius) 
                    polygon(points=[[0,0],[-tht_Base1,tht_Height1],[tht_Base1,tht_Height1]]); 
    }
}


module InnerPart() { 
    
    difference() {
        
        union() {
            difference() {
                union() {
                    difference() {
                        union() {
                    
                            translate([-m_Lenght/2+m_Radius,m_Radius+m_Radius/2+m_Space,0])
                                cube([m_Lenght,m_Radius,m_Height],center=true);
                  
                            translate([0,(m_Radius+m_Space)/2,0])
                                cube([cyl_Radius*2,m_Radius+m_Space,cyl_Height],center=true);
                
                            cylinder(h=cyl_Height,r=cyl_Radius,center=true,$fn=100); 
                        }
                
                        cylinder(h=cyl_Height,r=hol_Radius,center=true,$fn=100); 
                    }
            
                    translate([-m_Radius,m_Radius+m_Space-tht_Height,0])
                        rotate([0,-90,0])
                            linear_extrude(height=box_Lenght-m_Radius) 
                                polygon(points=[[0,0],[-tht_Base,tht_Height],[tht_Base,tht_Height]]);    
                }

                // add the text to the base of clip brackets

                translate([m_Radius*0.8,m_Radius*1.9,cyl_Height+m_Space])
                    rotate(180)
                        linear_extrude(height=1) text(m_Text,1.7*m_text_scale,m_font, $fn=100);
            }

            translate([-m_Lenght+m_Radius+clp_Lenght,m_Radius*2+m_Space,-m_Height/2]) 
                rotate([0,0,180])
                    linear_extrude(height=m_Height)
                        polygon(points=[
                            [0,0],
                            [clp_Lenght,0],
                            [clp_Lenght,clp_Height*0.9],
                            [clp_Lenght-clp_Thick,clp_Height*0.9],
                            [clp_Lenght-2*clp_Thick*0.9,clp_Height-2*clp_Thick],
                            [clp_Lenght-clp_Thick,clp_Height-2*clp_Thick],
                            [clp_Lenght-clp_Thick,clp_Thick],
                            [0,clp_Thick]
                        ]); 
        }
        
                    
        translate([-m_Lenght+m_Radius+sub_Lenght+clp_Thick,m_Radius*2+m_Space-clp_Thick,-m_Height/2])
            rotate([0,0,-180])
                linear_extrude(height=m_Height)
                    polygon(points=[
                        [0,0],
                        [sub_Lenght,0],
                        [sub_Lenght,clp_Height-3*clp_Thick],
                        [sub_Lenght-m_Space,clp_Height-3*clp_Thick],
                        [sub_Lenght-m_Space,clp_Thick*0.8],
                    ]); 


        
    }
}




