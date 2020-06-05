

$fn=30;
l_p=6;
b_p=3.47;



module printhead_body () {
    
//translate([0,40,40])rotate([180,0,0])
    difference(){
    cube(40);
    translate([5,5,0])cylinder(40,2,2);
    translate([35,5,0])cylinder(40,2,2);
    translate([5,35,0])cylinder(40,2,2);
    translate([35,35,0])cylinder(40,2,2);

    translate([5,5,0]){
    mutterextrusion(15);
    }
    
    translate([35,5,0]){
    mutterextrusion(15);
    }
    
    translate([5,35,0]){
    mutterextrusion(15);
    }
    
    translate([35,35,0]){
    mutterextrusion(15);
    }
    translate([20,12,0]) cylinder(3,d=6.5);
    translate([20,12,3]) cylinder(37, d=11.5);
    translate([20,28,25]) cube([7.2,3.2,30], center=true);
    translate([20,40,14]) rotate([90,0,0]) cylinder(25,d=4.5);
    translate([20,40,14]) rotate([90,0,0]) cylinder(4,d=7.5);
}
}

module mutterextrusion (laenge) {
    linear_extrude(laenge)union(){
    polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,60])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,120])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,180])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,240])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,300])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    };
}

printhead_body ();