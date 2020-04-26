content = "!#$%^&*()";
font = "Webdings";

linear_extrude(height = 3,center=true, twist=0) {
       translate([-3,-3,0]) text(content, font = font, spacing= 1, size = 10);
}