
$fn=50;
b_a=60;
h_a=36;
d_sp=15;
b_sp=14;
b_spa=8;
b_spi=14;
h_sp=24;
ws_sp=2.2;
ws=2;
ang_sp=45;
ws_kr=1.2;
b_kr=5;
hdiff_sp=4;

module back_layer() {

    difference(){
        cube([b_a,ws,h_a]);
        translate([b_a/2,ws,h_a/2])      rotate([90,0,0])linear_extrude(ws)circle(d=d_sp);
        //translate([b_a-b_kr,0,0])cube([b_kr,ws_kr,h_a]);
        //cube([b_kr,ws_kr,h_a]);
    }
}

module front_layer() {

    difference(){
        cube([b_a,ws,h_a]);
        *translate([b_a/2,ws/2,h_a/2])cube([b_sp,ws,h_sp],center=true);
        translate([b_a-b_kr,ws-ws_kr,0])cube([b_kr,ws_kr,h_a]);
        translate([0,ws-ws_kr,0])cube([b_kr,ws_kr,h_a]);
        hull(){
            translate([b_a/2,0,b_spa/2+(h_a-h_sp)/2])rotate([-90,0,0])linear_extrude(ws)circle(d=b_spa);
            translate([b_a/2,0,-b_spa/2+h_a-(h_a-h_sp)/2])rotate([-90,0,0])linear_extrude(ws)circle(d=b_spa);
            translate([b_a/2+b_sp/2-b_spi/2,0,h_a/2])rotate([-90,0,0])linear_extrude(ws)circle(d=b_spi);
            translate([b_a/2-b_sp/2+b_spi/2,0,h_a/2])rotate([-90,0,0])linear_extrude(ws)circle(d=b_spi);
        }
    }
}


module middle_layer() {
    difference(){
        translate([0,0,0])cube([b_a,ws_sp,h_a]);
        translate([b_a/2,0,h_a/2])for(i=[0:2:ang_sp]){
             rotate([0,i,0]) hull(){
            translate([0,0,-h_a/2+b_spa/2+(h_a-h_sp)/2])rotate([-90,0,0])linear_extrude(ws_sp)circle(d=b_spa);
            translate([0,0,-b_spa/2+h_a/2-(h_a-h_sp)/2])rotate([-90,0,0])linear_extrude(ws_sp)circle(d=b_spa);
            translate([b_sp/2-b_spi/2,0,0])rotate([-90,0,0])linear_extrude(ws_sp)circle(d=b_spi);
            translate([-b_sp/2+b_spi/2,0,0])rotate([-90,0,0])linear_extrude(ws_sp)circle(d=b_spi);
        }
            
        }
    }
}

module pizza_slice (rad,ang){
    intersection(){
        circle(rad);
        square(rad);
        rotate(ang-90)square(rad);
    }
}

module Zusammenbau_BH () {

    /*translate([0,0,hdiff_sp])*/ union(){
back_layer();
    translate([0,ws,0])middle_layer();
    translate([0,ws+ws_sp,0])front_layer();
    translate([20,2*ws+ws_sp,h_a-5])rotate([90,0,180])scale(0.4)linear_extrude(1.5)text("2ml");
}
/*difference(){
    cube([b_a,2*ws+ws_sp,hdiff_sp]);
    translate([b_a-b_kr,2*ws+ws_sp-ws_kr,0])cube([b_kr,ws_kr,hdiff_sp]);
        translate([0,2*ws+ws_sp-ws_kr,0])cube([b_kr,ws_kr,hdiff_sp]);
    translate([b_a-b_kr,0,0])cube([b_kr,ws_kr,hdiff_sp]);
    cube([b_kr,ws_kr,hdiff_sp]);
}*/
}

Zusammenbau_BH();