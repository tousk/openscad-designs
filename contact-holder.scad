module drum(myr,topwall){
    difference(){
       scale([1,1,1.5]) sphere(r=myr, $fn=100);
        translate([0,0,-2.5+topwall]) cylinder(h=5, r=10, center=true, $fn=100);
        translate([0,0,2.2-topwall]) cylinder(h=5, r=10, center=false, $fn=100);
    }
}


difference(){
    difference(){
        drum(myr=2.5,topwall=0);
        drum(myr=2.3,topwall=0.3);
    }
    translate([0.8,0.2,0.2]) cylinder(h=3, r=0.5, center=false, $fn=100);
    translate([-0.8,0.2,0.2]) cylinder(h=3, r=0.5, center=false, $fn=100);
    
    m_Text   = "R       I"; // carved text on clip
    m_font   = "Georgia";
    m_text_scale = 0.5;
    translate([-1.0,-1.0,2.15])
    linear_extrude(height=3) text(m_Text,m_text_scale,m_font, $fn=100);

    translate([-0.3,-1.4,2.15])
    linear_extrude(height=3) text("\uF04E",m_text_scale,"Webdings", $fn=100);

}

