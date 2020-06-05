
$fn=250;

module sechskantextrusion (laenge) {
    l_p=6;
    b_p=3.47;
    linear_extrude(laenge)union(){
    polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,60])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,120])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,180])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,240])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    rotate([0,0,300])polygon([[0,0],[l_p/2,b_p/2],[l_p/2,-b_p/2]],[[0,1,2]]);
    };
}

module abgerundeterQuader (r,b,l,h){

    R=r;
    B=b;
    L=l;
    H=h;
    BoR = B-2*R;
    LoR = L-2*R;

    translate([R,R,0])cube ([BoR,LoR,H]);
    translate([R,R,0])cylinder (H, r=R);
    translate([BoR+R,R,0])cylinder (H, r=R);
    translate([R,LoR+R,0])cylinder (H, r=R);
    translate([BoR+R,LoR+R,0])cylinder (H, r=R);
    translate([R,0,0])cube([BoR,R,H]);
    translate([R,LoR+R,0])cube([BoR,R,H]);
    translate([0,R,0])cube([R,LoR,H]);
    translate([BoR+R,R,0])cube([R,LoR,H]);
}

difference(){
    abgerundeterQuader (12,40,55,19);
    translate([35/2-2,55/2,4.1])rotate([0,0,30])scale([2.9,2.9,1])sechskantextrusion(15);
    translate([35/2-2,55/2,0])cylinder(10,d=9);
    translate([35/2-2,9,0])cylinder(19,d=12.2);
    translate([35/2-2,55-9,0])cylinder(19,d=12.2);
    translate([40,55/2,6])linear_extrude(1.5)circle(d=13);
    translate([40,55/2,11.5])linear_extrude(2)circle(r=10);
    translate([30,55/2-1,0])cube([10,2,13]);
}
